<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="formulario/titulo"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="formulario"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="formulario">
        <form>
            <xsl:apply-templates select="conjunto"/>
        </form>
    </xsl:template>

    <xsl:template match="conjunto">
        <fieldset>
            <legend>
                <xsl:value-of select="leyenda"/>
            </legend>
            <xsl:apply-templates select="campo"/>
        </fieldset>
    </xsl:template>

    <xsl:template match="campo">
        <p>
            <input>
                <xsl:attribute name="type">
                    <xsl:value-of select="entrada/@tipo"/>
                </xsl:attribute>
                <xsl:if test="etiqueta">       <!-- Si, nunca hemos usado xsl:if -->
                    <xsl:attribute name="placeholder">
                        <xsl:value-of select="etiqueta"/>
                    </xsl:attribute>
                </xsl:if>
            </input>
        </p>
    </xsl:template>

    <xsl:template match="titulo">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>
