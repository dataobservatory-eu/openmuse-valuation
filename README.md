# Open Music Europe Valuation Case Study Documentation


This document has been prepared by OpenMusE project partners as an account of work carried out within the framework of the EC-GA contract no [101095295](https://cordis.europa.eu/project/id/101095295).

*The Open Music Europe project has received funding from the European Union’s Horizon Europe, research and innovation programme, under Grant Agreement No.* [101095295](https://cordis.europa.eu/project/id/101095295)*. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Research Executive Agency. Neither the European Union nor the granting authority can be held responsible for them.*

Any dissemination of results must indicate that it reflects only the author’s view and that the Commission Agency is not responsible for any use that may be made of the information it contains.

> This is a living document which provides an overview of `D1.2`, which is a linked open data database supported by applications. As a living document conforming to OPA, it can be found at <https://github.com/dataobservatory-eu/music-economy-register> with standardised folders and file names. Its current version can be read in multiple formats [here](https://music.dataobservatory.eu/documents/open_music_europe/music-economy-register/).

This repository uses [Quarto](https://quarto.org/) to generate a technical book. Most of the book can be edited in any markdown editor, but it is recommended to use RStudio or Quarto for contribution that includes codes. The key chapters include:

-   `index.qmd`: Introduction and overview

-   `glossary.qmd`: Key terminology

-   `musiccomparators.qmd`: Overview of the background and model variables

-   `surveying.qmd`: Surveying and building register datasets

-   `references.qmd`: Bibliography and references

The documentation is continuously updated to support the development of linked open datasets and practical register management tools.

## Bibliography Files

The `bib/` folder contains all the bibliographic references used throughout the documentation. Each `.bib` file is organized by thematic areas related to administrative data, cultural data spaces, economic classification systems, and music sector metadata standards.

-   **bib/administrativedata.bib**: References on the usage of administrative data for economic and social measurements.

-   **bib/datagovernance.bib**: Key references on data governance frameworks and practices relevant to music economy datasets.

-   **bib/datamodels.bib**: Bibliography on conceptual and logical data models, including those used for registers and identifiers.

-   **bib/dataspace.bib**: Resources focusing on the European Data Spaces initiative and related technical frameworks.

-   **bib/ddi.bib**: References on the Data Documentation Initiative (DDI) standards, especially metadata for social, behavioral, and economic sciences.

-   **bib/eulaw.bib**: Relevant European Union legislation, directives, and regulations impacting data spaces, copyright, and cultural sectors.

-   **bib/ILO.bib**: References to International Labour Organization (ILO) standards, classifications, and surveys.

-   **bib/ISOdata.bib**: Bibliography for ISO standards relevant to music metadata, publishing, and administrative records.

-   **bib/metadata.bib**: General references on metadata standards and practices across multiple domains.

-   **bib/OpenMusE.bib**: Publications and references specifically related to the [Open Music Europe](https://openmuse.eu/) (OpenMusE) project.

-   **bib/ontologies.bib**: Bibliography on ontologies for cultural heritage, creative industries, and linked open data.

-   **bib/privatelyhelddata.bib**: Literature on the governance, access, and use of privately-held data relevant to cultural economy research.

-   **bib/esco_nace.bib**: Bibliography concerning European Skills, Competences, Qualifications and Occupations (ESCO) and NACE economic classifications.

-   **bib/thesauri.bib**: Resources on thesauri and controlled vocabularies used for cultural data description and interoperability.

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

-   **Asmah Frederico** (Reprex) - data modelling and data management support

-   **Anna Márta Mester** (Reprex) - data modelling and data stewardship

-   **Edite Punka** (Reprex) - metadata support


## License

This documentation and its source code are shared under the Creative Commons Attribution 4.0 International (CC BY 4.0) license, unless otherwise noted.

## Images

We save visualisations in folders corresponding to the file format.

`png`: contains visualisations in Portable Network Graphics format (our preferred format.)

`jpg`: contains visualisations in JPEG formats 

## Exceptions

The `.gitignore` contains the exceptions that are not synchronized to the repository. These are the rendered html files and their supporting JavaScript, CSS and other auxiliary files. They should build on everybody's computer flawlessly.

