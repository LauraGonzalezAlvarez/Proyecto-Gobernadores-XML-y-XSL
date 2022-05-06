<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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

          <!-- Tabla Votaciones departamentales -->
          <table bgcolor="#FEF5E7" style="text-align:center">

            <!--Encabezado de las celdas-->
            <tr bgcolor="#EDBB99"><!--Primer fila -->
              <th>Departamentos</th><!--Cada una de las columnas -->
              <th>Inscritos</th>
              <th>Partido1</th>
              <th>Partido2</th>
              <th>Partido3</th>
              <th>Blanco</th>
              <th>Porcentaje Abstencion</th>
              <th>Cantidad letras</th>
            </tr> <!--Fin encabezado celdas -->

            <!--Selecciona nodos votantes -->
            <xsl:for-each select="//Votantes">
               <tr> <!--Recorre por filas -->
                <td>
                  <xsl:value-of select="Departamentos" />
                </td>
                <td>
                  <xsl:value-of select="Inscritos" />
                </td>
                <td>
                  <xsl:value-of select="Partido1" />
                </td>
                <td>
                  <xsl:value-of select="Partido2" />
                </td>
                <td>
                  <xsl:value-of select="Partido3" />
                </td>
                <td>
                  <xsl:value-of select="Blanco" />
                </td>
                <td>
                  <xsl:value-of select='format-number(((Blanco + Partido1 + Partido2 + Partido3 - Inscritos)*-1 div Inscritos), "#.0%")'/>
                  <!-- XSLT format-number() Function  -->
                </td>
                
                <xsl:if test="@region='andina'"><!--Si atributo=andina -->
                  <td>
                    <xsl:value-of select=" string-length(Departamentos)"/> <!--Informa cantidad de letras -->
                  </td>
                </xsl:if><!--Fin condicional -->
              </tr><!--Fin recorrido filas -->
            </xsl:for-each ><!--Fin ciclo nodo votantes -->
            
            <tr><!--Inicio fila -->
              <th >Totales</th>              
              <td></td><!--Columna vacía -->

              <td >
                <xsl:value-of select="sum(//Partido1/@value)" /><!--Suma el valor del atributo value del nodo Partido1 -->
              </td>
              <td >
                <xsl:value-of select="sum(//Partido2/@value)" />
              </td>
              <td >
                <xsl:value-of select="sum(//Partido3/@value)" />
              </td>
            </tr>

            <th >Informe Caribe</th>
            <xsl:for-each select="//Votantes"><!--Ruta del Nodo Votantes -->

              <xsl:if test="@region='caribe'"><!--Si el atributo region = caribe -->

                <td>
                  <xsl:value-of select="Inscritos" />
                </td>

                <td>
                  <xsl:value-of select="Partido1" />
                </td>

                <td>
                  <xsl:value-of select="Partido2" />
                </td>
                <td>
                  <xsl:value-of select="Partido3" />
                </td>
                <td>
                  <xsl:value-of select="Blanco" />
                </td>
                <td>
                  <xsl:value-of select='format-number(((Blanco + Partido1 + Partido2 + Partido3 - Inscritos)*-1 div Inscritos), "#.0%")'/>
                </td> <!--Fin Celda -->
              </xsl:if> <!--Fin condicional atributo caribe -->
            </xsl:for-each ><!--Fin ciclo informe caribe-->
          </table>
        </center>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
