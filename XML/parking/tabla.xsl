<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match='/'>
    <html>
        <table>
            <tr>
                <th>Planta</th>
                <th>Plaza</th>
                <th>Vehículo</th>
                <th>Libre</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="parking/planta/@numero" />
                </td>
                <td>
                    <xsl:value-of select="parking/planta/plaza/@numero" />
                </td>
                <td>
                    <xsl:value-of select="parking/planta/plaza/vehiculo" />
                </td>
                
            </tr>
        </table>
    </html>
    </xsl:template>
</xsl:stylesheet>
