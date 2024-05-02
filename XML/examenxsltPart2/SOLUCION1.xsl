<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match='/'>
        <html>
            <head>
                <title>Formualrio AAN</title>
            </head>
            <body>
                <xsl:apply-templates select="formulario" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="formulario">
        <form>
            <xsl:apply-templates select="conjunto" />
        </form>
    </xsl:template>
    <xsl:template match="conjunto">
        <fieldset>
            <legend>
                <xsl:value-of select="leyenda" />
            </legend>
            <xsl:apply-templates select="campo" />
        </fieldset>
    </xsl:template>
    <xsl:template match="campo">
        <p>
            <input>
                <xsl:attribute name="placeholder">
                    <xsl:value-of select="texto" />
                    <xsl:value-of select="etiqueta" />
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of select="entrada/@tipo" />
                </xsl:attribute>
            </input>
        </p>
    </xsl:template>
</xsl:stylesheet>