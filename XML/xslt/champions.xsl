<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Champions</title>
      </head>
      <body>
        <h1>Resultados</h1>
        <table border="1">
          <tr>
            <th>Equipo local</th>
            <th>Goles Local</th>
            <th>Equipo Visitante</th>
            <th>Goles Visitante</th>
          </tr>
          <xsl:apply-templates select="champions/octavos/partido"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="partido">
    <tr>
      <th>Equipo_1</th>
      <th>goleador_l</th>
      <th>goleador_v</th>
      <th>Equipo_v</th>
  </tr>
  </xsl:template>
  <xsl:template match="goles_1">
    <xsl:apply-templates select="goleador_1" />
  </xsl:template>

  <xsl:template match="goles_v">
    <xsl:apply-templates select="goleador_v" />
  </xsl:template>

  <xsl:template match="goleador_1 | goleador_v">
    <img src="Balon futbol.jpg" width="30" />
 <xsl:value-of select="." />
  </xsl:template>
  
</xsl:stylesheet> 