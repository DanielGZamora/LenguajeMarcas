<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>Formulario</h2>
    <form action="{form/accion/@url}" method="post">
      <xsl:for-each select="form/entrada">
        <div>
          <label><xsl:value-of select="."/></label>
          <input type="text" name="{translate(., ' ', '_')}" />
        </div>
      </xsl:for-each>
      <input type="submit" value="Submit" />
    </form>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>