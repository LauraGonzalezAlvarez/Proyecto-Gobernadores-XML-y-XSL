<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:output method="html"/>    
<xsl:template match="/">
  <html>
      
        <body>
            <head>
                <center>
                    <h1>Votaciones Departamentales</h1>
                </center>
            </head>
            <style>
                  #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 70%;
                }

                #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
                }

                #customers tr:nth-child(even){background-color: #f2f2f2;}

                #customers tr:hover {background-color: #ddd;}

                #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
                }
                .negrilla {
                font-weight: bold;                
                }
                .verde {
                background-color: #e4ffe5;
                }
                .rojo {
                background-color: #ffeded;
                }
             </style>

            
              
              <p>A continuacion se muestra toda la tabla.</p>
              <table border="1" align="center" id="customers">

                <tr bgcolor="#EDBB99"  >
                  <th>Departamentos</th>
                  <th>Inscritos</th>
                  <th>Partido1</th>
                  <th>Partido2</th>
                  <th>Partido3</th>
                  <th>Blanco</th>
                  <th>Porcentaje abtencion</th>
                  <th>Cantidad letras</th>
                </tr>
                  <xsl:for-each select="//Votantes/Votante" >

                
                        <tr>                
                            <td class="negrilla verde">
                                <xsl:value-of select="@type" />
                            </td>
                            
                            <xsl:for-each select="li" >
                                <td> 
                                    <xsl:value-of select="." /> 
                                </td>
                            </xsl:for-each>      
                            <xsl:variable name="nodes" select="li" />  
                             
                            <td class="negrilla"> 
                                <xsl:value-of select="sum(li/@value)"/> 
                            </td>
                        </tr>
                  </xsl:for-each >
                 <tr>
                        <td class="negrilla">Totales</td>
                        <td></td>                        
                        
                        <td class="negrilla">                          
                            <xsl:value-of select="sum(//li[@col='2']/@value)" /> 
                        </td>  
                        <td class="negrilla">                          
                            <xsl:value-of select="sum(//li[@col='3']/@value)" /> 
                        </td>  
                        <td class="negrilla">                          
                            <xsl:value-of select="sum(//li[@col='4']/@value)" /> 
                        </td>  
                        <td class="negrilla">                          
                            <xsl:value-of select="sum(//li[@col='5']/@value)" /> 
                        </td>                                             
                    </tr>       
              </table>
          
        </body>
  </html>
</xsl:template>

</xsl:stylesheet>
