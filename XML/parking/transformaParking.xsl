<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match='/'>
        <html>
            <head>
                <title>
                    <xsl:value-of select="parking/@lugar" />
                </title>
            </head>
            <body>
                <h1>PARKING</h1>
                <p>Lugar = <xsl:value-of select="lugar" /></p>
                <p>Info en = <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="parking/@web" />
                        </xsl:attribute>
                        <xsl:value-of select="parking/@web" />
                    </a>
                </p>
                <p>Más info en = <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="@web" />
                        </xsl:attribute>
                        <xsl:value-of select="@web" />
                    </a>
                </p>
                <ul>
                    <xsl:apply-templates select="parking/planta" />
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="planta">
        <li> Planta <xsl:value-of select="@numero" />
            <ol>
                <xsl:apply-templates select="plaza" />
            </ol>
        </li>
    </xsl:template>
    <xsl:template match="plaza">
        <li>
            <xsl:value-of select="vehiculo" />
             (<xsl:value-of select="../@numero" />)
        </li>
    </xsl:template>
</xsl:stylesheet>