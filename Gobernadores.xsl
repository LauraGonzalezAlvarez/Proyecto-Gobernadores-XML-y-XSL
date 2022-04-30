<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:output method="html"/>    
<xsl:template match="/">
  <html>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong"></link>
  <body>
      <style>
body {

font-family: "Trirong", serif;
background: #FDEBD0
}
</style>

      <center> 
    <h1>Votaciones Departamentales</h1>
    <p>A continuacion se muestra toda la tabla.</p>
    <table  bgcolor="#FEF5E7" style="text-align:center">
	
      <tr bgcolor="#EDBB99"  >
        <th>Departamentos</th>
        <th>Inscritos</th>
        <th>Partido1</th>
        <th>Partido2</th>
        <th>Partido3</th>
        <th>Blanco</th>
      </tr>
	<xsl:for-each select="//Votantes" >
      <tr>
        	
        <td><xsl:value-of select="Departamentos" /></td>	
        <td><xsl:value-of select="Inscritos" /></td>
        <td><xsl:value-of select="Partido1" /></td>
        <td><xsl:value-of select="Partido2" /></td>
        <td><xsl:value-of select="Partido3" /></td>
        <td><xsl:value-of select="Blanco" /></td>
	
      </tr>
	</xsl:for-each >
    </table>
    </center> 
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
