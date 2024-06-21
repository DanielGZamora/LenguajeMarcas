<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
<!-- Lo mismo que champions 2 pero usando for:each -->
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
                <xsl:for-each select="goles_l/goleador_l">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select="goles_v/goleador_v">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
            <td><xsl:value-of select="equipo_v"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>