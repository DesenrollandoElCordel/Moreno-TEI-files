<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    xpath-default-namespace="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    exclude-result-prefixes="xs page"
    version="2.0">
    <xsl:output method="xml" indent="yes" xpath-default-namespace="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title></title>
                    <respStmt>
                        <name></name>
                        <resp>Codificación TEI</resp>
                    </respStmt>
                </titleStmt>
                <publicationStmt>
                    <authority>Bibliothèque Universitaire de Genève</authority>
                    <availability><p>CC-BY-NC-SA</p></availability>
                </publicationStmt>
                <sourceDesc>
                    <biblFull>
                        <titleStmt>
                            <title type="titulo_completo"/>
                            <title type="titulo_breve"/>
                        </titleStmt>
                        <editionStmt><p></p></editionStmt>
                        <publicationStmt>
                            <publisher>José María Moreno</publisher>
                            <pubPlace>Carmona (Sevilla)</pubPlace>
                            <date/>
                        </publicationStmt>
                    </biblFull>
                    <msDesc>
                        <msIdentifier>
                            <country>Suisse</country>
                            <settlement>Genève</settlement>
                            <repository>Bibliothèque Universitaire de Genève <ref target="https://unige.swisscovery.slsp.ch/permalink/41SLSP_UGE/kjkm12/alma991002834309705502"/></repository>
                            <idno type="cote">Ant*Pli Car BFLA 257813</idno>
                            <altIdentifier>
                                <idno type="num_impresor">Número </idno>
                            </altIdentifier>
                        </msIdentifier>
                        <msContents>
                            <summary></summary>
                            <msItem>
                                <locus></locus>
                                <title></title>
                            </msItem>
                        </msContents>
                        <physDesc>
                            <objectDesc>
                                <supportDesc>
                                    <support>
                                        <dim>in-4</dim>
                                    </support>
                                    <extent>4 p.</extent>
                                    <condition>Bueno</condition>
                                </supportDesc>
                                <layoutDesc>
                                    <p>2 columnas</p>
                                </layoutDesc>
                            </objectDesc>
                            <decoDesc>
                                <decoNote>
                                    <p></p>
                                </decoNote>
                            </decoDesc>
                        </physDesc>
                    </msDesc>
                </sourceDesc>
            </fileDesc>
            <encodingDesc>
                <editorialDecl>
                    <correction>
                        <p>OCR non corregido</p>
                    </correction>
                    <normalization>
                        <p>Se conservan la ortografía, las mayúsculas y las cursivas del texto original.</p>
                    </normalization>
                    <punctuation>
                        <p>Se conserva la puntuación original.</p>
                    </punctuation>
                </editorialDecl>
            </encodingDesc>
            <profileDesc>
                <langUsage>
                    <language ident="es">Español</language>
                </langUsage>
                <textClass>
                    <keywords xml:base="http://datos.bne.es/tema/">
                        <term type="tipo_texto"></term>
                        <term type="tipo_estrofa"></term>
                        <term type="verso_prosa">Verso</term>
                        <term type="sagrado_profano"></term>
                    </keywords>
                </textClass>
            </profileDesc>
            <revisionDesc>
                <change/>
            </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <div>
                        <xsl:apply-templates/>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="page:Metadata"/>
    
    <!--<xsl:template match="TextRegion/TextLine/TextEquiv/Unicode">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>-->
    
    <xsl:template match="page:Page">
        <xsl:element name="pb" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="facs">
                <xsl:value-of select="@imageFilename"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="preceding-sibling::page:Metadata/TranskribusMetadata/@pageNr"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="page:TextRegion/page:TextLine/page:TextEquiv/page:Unicode">
        <xsl:choose>
        <xsl:when test="matches(., '^[0-9]+$')">
            <xsl:element name="fw" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="type">
                    <xsl:text>paginaNum</xsl:text>
                </xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:when>
        <xsl:when test="matches(., '^[\(]?[Nú]')">
            <xsl:element name="fw" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="type">
                    <xsl:text>impresorNum</xsl:text>
                </xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:when>
        <xsl:otherwise>
            <xsl:element name="l" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="page:TextRegion/page:TextEquiv/page:Unicode"/>
    
    <xsl:template match="page:TextRegion/page:TextLine/page:Word/page:TextEquiv/page:Unicode"/>
    
</xsl:stylesheet>