<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/champions">
        <html>
            <head>
                <title>Partidos</title>
            </head>
            <body>
                <h1>Partidos</h1>
                <table border="1">
                    <tr>
                        <th>Equipo L</th>
                        <th>Goles L</th>
                        <th>Goles V</th>
                        <th>Equipo V</th>
                    </tr>
                    <xsl:apply-templates select="octavos/partido"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="partido">
        <tr>
            <td><xsl:value-of select="equipo_l"/></td>
            <td>
                <xsl:apply-templates select="goles_l/goleador_l"/>
            </td>
            <td>
                <xsl:apply-templates select="goles_v/goleador_v"/>
            </td>
            <td><xsl:value-of select="equipo_v"/></td>
        </tr>
    </xsl:template>

    <xsl:template match="goles_l/goleador_l">
        <xsl:value-of select="."/>
        <xsl:if test="following-sibling::goleador_l">
            <xsl:text>, </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="goles_v/goleador_v">
        <xsl:value-of select="."/>
        <xsl:if test="following-sibling::goleador_v">
            <xsl:text>, </xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>