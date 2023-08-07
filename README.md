# TEI-files

This repository contains the XML-TEI digital editions of Spanish chapbooks, published by the same Andalusian printer, José María Moreno (19th c.).

## Schema
The schema used to validate the XML-TEI files can be found in [Schema](https://github.com/DesenrollandoElCordel/TEI-files/tree/main/Schema).

## First version of the digital edition
The folder [tei-files-v1](/tei-files-v1) contains the first version of the digital editions. Each TEI file was created from the PAGE-XML files produced by the OCR tool Transkribus, with the XSLT stylesheet [Page_TEI.xsl](https://github.com/DesenrollandoElCordel/Moreno-TEI-files/blob/main/xslt/Page_TEI.xsl), as described in [Moreno-OCR-files](https://github.com/DesenrollandoElCordel/Moreno-OCR-files). The XSLT transformation created a common architecture for all the chapbooks with a pre-filled \<teiHeader\>, the main \<div\> of the text, the page beginnings (\<pb\>) with the attributes @facs for the facsimiles and @n for the page number, \<fw\> for the number of the print and page numbers, \<l\> to encode each verse.

This structure have been enriched with several tags that fit the specificity of each chapbook:
* Addition of `<head>` to encode the different type of title (To distinguish the different types of titles, we use the attribute `@type` with pre-defined values. These values are described in the schema);
* Replacement of `<l>` by `<lb/>` in case of prose;
* Addition of `<p>` for the paragraphs in prose and `<lg>` for line groups (stanza, refrain, etc.);
* Addition of `<trailer>` to encode the closing title of a division;
* Addition of specific tags for plays (`<sp>`, `<speaker>`, `<castList>`);
* Encoding of inline caesuras with `<add>`;
* Encoding of damages and illisible letters (`<gap>` in case of illisible letters, `<damage>` and `<supplied>` if the letters can be reproduced);
* Encoding of typographic errors (`<sic>`/`<corr>`)
  
Regular patterns in a chapbook have been semi-automatically encoded with regular expressions, which are described in [regEx_TEI.txt](https://github.com/DesenrollandoElCordel/Moreno-TEI-files/blob/main/xslt/regEx_TEI.txt).

## Second version of the digital editions
The [second version](/tei-files-v2) of our digital edition contains geographical information that has been automatically detected thanks to Named Entity Recognition technologies. For more information about how we proceeded, check this [repository](https://github.com/DesenrollandoElCordel/pliegos-ner).
The geographical data are presented in two different ways in the TEI files:
- At a text level : the place names are encoded with a `<name>` element;
- At a `<teiHeader>` level: the place names are listed in `<listPlace>`. Each `<place>` element specifies the number of times a place appears in the text (`@n`), as well as its Wikidata identifier (`@corresp`). The normalised name is encoded with `<placeName>` and the geographical coordinates with `<location>`.
