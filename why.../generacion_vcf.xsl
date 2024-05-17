<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:apply-templates select="root/element"/>
    </xsl:template>
    <xsl:template match="element">
    BEGIN:VCARD
    N:<xsl:value-of select="apellidos"/>;<xsl:value-of select="nombre"/>
    FN:<xsl:value-of select="nombre"/>;<xsl:value-of select="apellidos"/>
    EMAIL:<xsl:value-of select="email"/>
    ORG:<xsl:value-of select="grupos"/>
    END:VCARD
    </xsl:template>
</xsl:stylesheet>
