library(tidyverse)
library(treemapify)
source(file.path("R", "folders.R"))
source(file.path("R", "color_palettes.R"))

## English label version of listen_hours

## Labels and colors
vocabulary <- readxl::read_excel( # English vocabulary file
  file.path("data-raw", "vocabulary_cap_19_en.xlsx")
  )

weights <- readRDS(file.path(
  uhd_folder, "data", "2019",
  "weights_2019.rds"))

listen_music_vocabulary_en <- vocabulary %>%
  filter(context == "listen_music") %>%
  mutate(use_group = english) %>%
  mutate(source = english) %>%
  mutate(weighting = english) %>%
  mutate(device = english) %>%
  rename(media = english) %>%
  select(-context)

visits <- readRDS(file.path("data", "2019", "visits_19.rds")) %>%
  mutate_at(
    vars(starts_with("visit")),
    ~ . * 1.5
  )

listen_music_2018 <- readRDS(file.path(
  "data", "2019",
  "listen_music_2018.rds")) %>%
  mutate(device = case_when(
    device %in% c(
      "computer_work", "computer_home",
      "mp3_player"
    ) ~ gsub("_", "", device),
    device %in% c(
      "radio_music_travel",
      "radio_music_home", "radio_music_work"
    ) ~ gsub("_music", "", device),
    device == "tv_home" ~ "tv",
    TRUE ~ as.character(device)
  )) %>%
  mutate(source_device = paste0(source, "_", device))

## Creating column for youtube listening hours ------------
listening_youtube <- select(
  weights, uniqid,
  weight_10
) %>%
  left_join(readRDS(file.path("data", "2019", "listen_music.rds")),
    by = "uniqid"
  ) %>%
  select(listen_music_youtube, weight_10) %>%
  transmute(weighted_hours = listen_music_youtube * weight_10) %>%
  filter(weighted_hours > 0)

saveRDS(
  listening_youtube,
  file.path("data", "2019", "listening_youtube_en.rds")
)


listen_music_2019_1 <- select(weights, uniqid, proj_weight_10) %>%
  left_join(readRDS(file.path("data", "2019", "listen_music.rds")),
    by = "uniqid"
  ) %>%
  select(-contains("audiobook")) %>%
  select(-listen_music_youtube) %>%
  left_join(., select(visits, uniqid, visit_concert),
    by = "uniqid"
  ) %>%
  rename(listen_music_live_concert = visit_concert) %>%
  mutate_at(
    vars(starts_with("listen")),
    ~ . * proj_weight_10
  ) %>%
  summarize_if(is.numeric, sum, na.rm = TRUE) %>%
  select(-proj_weight_10) %>%
  gather(source_device, values) %>%
  mutate(source_device = gsub("portable_", "", source_device)) %>%
  mutate(source_device = gsub("listen_music_", "", source_device)) %>%
  mutate(source_device = gsub("casettte", "casette", source_device)) %>%
  mutate(source_device = case_when(
    source_device == "tv_home" ~ "broadcast_tv",
    source_device %in% c(
      "radio_music_travel",
      "radio_music_home", "radio_music_work"
    ) ~ gsub("radio_music_", "broadcast_radio_", source_device),
    TRUE ~ as.character(source_device)
  )) %>%
  mutate(
    device = word(source_device, 2, -1, sep = "_"),
    source = word(source_device, 1, 1, sep = "_")
  ) %>%
  mutate(source = case_when(
    grepl("radio", device) ~ "radio",
    device == "tv" ~ "tv",
    TRUE ~ as.character(source)
  )) %>%
  left_join(select(listen_music_2018, source_device, hours),
    by = c("source_device")
  ) %>%
  rename(
    hours_18 = hours,
    hours = values
  ) %>%
  mutate(change = (hours - hours_18) / hours_18)

listen_music_2019_2 <- listen_music_2019_1 %>%
  left_join(., select(
    listen_music_vocabulary_en, source, label
  ), # Adding English labels
  by = "source"
  ) %>%
  select(-source) %>%
  rename(source = label) %>%
  distinct(
    source_device, source, device,
    hours, hours_18, change
  )

sum(listen_music_2019_2$hours) == sum(listen_music_2019_1$hours)

listen_music_2019 <- listen_music_2019_2 %>%
  left_join(., select(
    listen_music_vocabulary_en, device, label
  ),
  by = "device"
  ) %>%
  mutate(source = ifelse(label == "concert", "live", source))

### Ellenőrzés: a csoportosítás során az óraszámok egyeznek.
sum(listen_music_2019$hours) == sum(listen_music_2019_1$hours)


download_music_paid_rate <- readRDS(
  file.path("data", "2019", "paid_rates.rds")
) %>%
  select(uniqid, download_music_paid_rate) %>%
  left_join(., select(weights, uniqid, weight_10),
    by = "uniqid"
  ) %>%
  filter(complete.cases(.)) %>%
  mutate(download_music_paid_rate_w = weighted.mean(
    as.numeric(download_music_paid_rate), weight_10
  )) %>%
  distinct(download_music_paid_rate_w) %>%
  as.numeric(as.character(.)) / 100

download_music_paid_rate

store_music <- readRDS(file.path(
  "data", "2019",
  "store_music.rds"
))

cddvd_paid_rate <- store_music %>%
  select(
    uniqid, store_music_orig_cd,
    store_music_cddvd, store_music_orig_dvd
  ) %>%
  mutate(total = store_music_orig_cd +
    store_music_cddvd +
    store_music_orig_dvd) %>%
  mutate(original = store_music_orig_cd + store_music_orig_dvd) %>%
  mutate(paid_rate = original / total) %>%
  left_join(., select(weights, uniqid, weight_10), by = "uniqid") %>%
  filter(complete.cases(.)) %>%
  mutate(paid_rate = weighted.mean(paid_rate, weight_10)) %>%
  distinct(paid_rate) %>%
  as.numeric(as.character(.))

paid_rate_casette <- store_music %>%
  select(uniqid, contains("casette")) %>%
  mutate(total = rowSums(.[, -1])) %>%
  mutate(paid_rate = case_when(
    total == 0 ~ NA_real_,
    TRUE ~ store_music_casette_paid / total
  )) %>%
  filter(complete.cases(.)) %>%
  left_join(., select(weights, uniqid, weight_10), by = "uniqid") %>%
  mutate(casette_paid_rate_w = weighted.mean(paid_rate, weight_10)) %>%
  distinct(casette_paid_rate_w) %>%
  as.numeric(as.character(.))

save(listen_music_2019,
  download_music_paid_rate,
  paid_rate_casette, cddvd_paid_rate,
  file = file.path(
    "data", "2019",
    "listen_volumes_en.rda"
  )
)
