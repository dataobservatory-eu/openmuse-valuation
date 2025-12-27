## Status, scope, and methodological positioning

This repository documents a **valuation case study** developed within the Open Music Europe (OpenMusE) project. The contents reflect a **methodological implementation and demonstration**, rather than a full empirical pilot as originally envisaged at proposal stage.

During project execution, several planned analytical dependencies, empirical inputs, and replication activities were not available in the form or timeframe originally anticipated. In line with adaptations agreed at project level, this repository therefore prioritises:

- transparent documentation of valuation concepts and models;
- reproducible analytical workflows;
- clearly specified data structures and assumptions; and
- demonstrative use of synthetic or limited empirical data where appropriate.

The materials provided here are intended to support methodological validation, future reuse, and extension beyond the project’s formal end date. They do not make empirical claims about real markets, countries, or organisations, nor do they represent statistically representative valuation results.

Where geographical context is relevant, empirical inputs informing this case study were available primarily from Slovakia and Hungary, with additional methodological validation using data provided by partners in Latvia and Estonia. No replication outside these contexts is documented in this repository.

## Planning phase

In the planning phase, this documentation built on earlier folders (all publicly accessible) to design the data collection. This planning document is available in rendered format and source files as follows.

`WP1 interrelated deliverables` are to be found in <https://github.com/dataobservatory-eu/openmuse-valuation> with standardised folders and file names. Its current version can be read in multiple formats [here](https://music.dataobservatory.eu/documents/open_music_europe/music-economy-register/https://music.dataobservatory.eu/documents/open_music_europe/economy/valuation/index.html).

This repository uses [Quarto](https://quarto.org/) to generate a technical book. Most of the book can be edited in any markdown editor, but it is recommended to use RStudio or Quarto for contribution that includes codes. The key chapters include:

-   `index.qmd`: Introduction and overview

-   `glossary.qmd`: Key terminology

-   `musiccomparators.qmd`: Overview of the background and model variables

-   `personaluse.qmd`: Measuring the home and personal use of music at home, during the commute and at work or study.

-   `eventquantities.qmd`: Measuring the social-event based use of music in concerts and various social establishments.

-   `hedonicpricemodel.qmd`: Overview of the applicability of the hedonic price method in public performance

-   `experimentalmodels.qmd`: Overview of the usability of the experimental models

-   `sustainability.qmd`: Questions related to WP2 and WP3.

-   `surveying.qmd`: Surveying and building register datasets

-   `references.qmd`: Bibliography and references

The documentation is maintained to support methodological transparency, reuse, and future extension.

## Part of the Pilot Study

The resulting methodology informed a component of the WP1 cornerstone report.
The source of this contribution is the `index.qmd` and the rendered 
versions of this document, which directly feed into the final deliverable document are released on Zenodo as a stand-alone document, too.

## Data

-   `data-raw`: contains the unprocessed, and publicly reusable data
-   `data`: contains the replication data of the pilot study

## R

-   `R`: contains the R source files of the pilot study.

Required packages:

```         
require(here)         # platform independent file paths
require(readxl)       # read xlsx files
require(dplyr)        # data wrangling
require(tidyr)
require(knitr)        # for printing the tables
require(kableExtra)   # for printing the tables
```

## Bibliography Files

The `bib/` folder contains all the bibliographic references used throughout the documentation. Each `.bib` file is organized by thematic areas related to administrative data, cultural data spaces, economic classification systems, and music sector metadata standards.

-   `bib/administrativedata.bib`: References on the usage of administrative data for economic and social measurements.

-   `bib/CISAC.bib`: resources related to CISAC and the ISWC system.

-   `bib/datagovernance.bib`: Key references on data governance frameworks and practices relevant to music economy datasets.

-   `bib/datamodels.bib`: Bibliography on conceptual and logical data models, including those used for registers and identifiers.

-   `bib/dataspace.bib`: Resources focusing on the European Data Spaces initiative and related technical frameworks.

-   `bib/ddi.bib`: References on the Data Documentation Initiative (DDI) standards, especially metadata for social, behavioral, and economic sciences.

-   `bib/eulaw.bib`: Relevant European Union legislation, directives, and regulations impacting data spaces, copyright, and cultural sectors.

-   `bib/ILO.bib`: References to International Labour Organization (ILO) standards, classifications, and surveys.

-   `bib/ifpi.bib`: References to IFPI international or national IFPI chapter data sources.

-   `bib/ISOdata.bib`: Bibliography for ISO standards relevant to music metadata, publishing, and administrative records.

-   `bib/metadata.bib`: General references on metadata standards and practices across multiple domains.

-   `bib/opa.bib`: bibliography on the Open Policy Analysis Guidelines.

-   `bib/OpenMusE.bib`: Publications and references specifically related to the [Open Music Europe](https://openmuse.eu/) (OpenMusE) project.

-   `bib/ontologies.bib`: Bibliography on ontologies for cultural heritage, creative industries, and linked open data.

-   `bib/privatelyhelddata.bib`: Literature on the governance, access, and use of privately-held data relevant to cultural economy research.

-   `bib/esco_nace.bib`: Bibliography concerning European Skills, Competences, Qualifications and Occupations (ESCO) and NACE economic classifications.

-   `bib/thesauri.bib`: Resources on thesauri and controlled vocabularies used for cultural data description and interoperability.

# How to Contribute

We welcome contributions!\
If you are working on administrative data, cultural data spaces, or open data for the music sector, please get in touch or submit an issue or pull request.

### Ways to Contribute

-   Correct or extend the glossary

-   Suggest improvements to the registers and classifications

-   Report or fix issues in the Quarto build

📩 You can start by opening an [issue](https://github.com/dataobservatory-eu/music-economy-register/issues) or submitting a pull request.

## Authors, Contributors and Acknowledgments

-   **Daniel Antal, CFA** (Reprex) - main author, developer

-   **Richard Demčák** (SOZA) - collective management interoperability

-   **Anna Márta Mester** (Reprex) - data modelling and data stewardship

## License

This documentation and its source code are shared under the Creative Commons Attribution 4.0 International (CC BY 4.0) license, unless otherwise noted.

## Images

We save visualisations in folders corresponding to the file format.

`png`: contains visualisations in Portable Network Graphics format (our preferred format.)

`jpg`: contains visualisations in JPEG formats

## Exceptions

The `.gitignore` contains the exceptions that are not synchronized to the repository. These are the rendered html files and their supporting JavaScript, CSS and other auxiliary files. They should build on everybody's computer flawlessly.
