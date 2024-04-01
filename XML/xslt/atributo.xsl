<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    version="2.0">

    <xsl:template match="raiz/elemento"> Contenido del elemento = <strong>
            <xsl:value-of select="." />
        </strong>
    <hr/> Valor del atributo = <strong>
            <xsl:value-of select="@atributo" />
        </strong>
    </xsl:template>
</xsl:stylesheet>