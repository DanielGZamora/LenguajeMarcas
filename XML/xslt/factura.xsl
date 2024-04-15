<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Factura</title>
            </head>
            <body>
                <h1>Facturas</h1>
                <h2>Emision: <xsl:value-of select="factura/emision" /></h2>
                <table border="1">
                    <tr>
                        <th>Denominacion</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                    </tr>
                    <xsl:apply-templates select="factura/articulos/articulo" />
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="factura/emision">
    <tr>
        <td>
            <xsl:value-of select="denominacion" />
        </td>
        <td>
            <xsl:value-of select="precio" />
        </td>
        <td>
            <xsl:value-of select="cantidad" />
        </td>
    </tr>
 </xsl:template>
</xsl:stylesheet>