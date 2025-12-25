
# Creating noise variable for the realistic CAP benchmark -------
set.seed(123)
draws_1 <- rnorm(16, 1, 0.034)
summary(draws_1)

set.seed(124)
draws_2 <- rnorm(16, 1.01, 0.031)
summary(draws_2)

set.seed(125)
draws_3 <- rnorm(16, 1, 0.036)
summary(draws_3)

set.seed(126)
draws_4 <- rnorm(16, 1.018, 0.033)
summary(draws_4)

listen_hours_noise <- data.frame(
  liv_2023 = draws_1,
  liv_2024 = draws_2,
  pom_2023 = draws_3,
  pom_2024 = draws_4)

saveRDS(listen_hours_noise, "data/listen_hours_noise.rds")
