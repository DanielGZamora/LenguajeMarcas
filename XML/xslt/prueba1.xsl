<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <a href="https://www.google.com/">
                    <xsl:value-of select="e" />
                </a>
                <table border="1">
                    <tr>
                        <th>
                            Texto1</th>
                        <th>atributo</th>
                    </tr>
                </table>

            </body>
        </html>
    </xsl:template>
    <xsl:template match="b">
        <xsl:value-of select="a/b" />
    <tr>
            <td>
                <xsl:value-of select="b/@atr" />
            </td>
            <td>
                <xsl:value-of select="c" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>