<?xml version="1.0" encoding="UTF-8"?>

<!--
     Nombre: June Mendigain
     Fecha: 05/12/2025
     Módulo: Lenguaje de marcas y sistemas de gestión de la información (LMSGI)
     UD: UD4 - Transformación de datos
     Tarea: Tarea de evaluación 2 - XSLT
     Enlace GitHub: https://jmendigain.github.io/TareaEvaluativa02_UD04/
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8"/>

  <xsl:template match="/jardinBotanico">
      <html lang="es">
        <head>
          <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
          <meta charset="utf-8"/>
          <meta name="description" content="Página principal" />
          <title>titulo de la web</title>
        </head>
      
        <body>
          <header>
            <!--Encabezado-->
            <img src= "../img/logotipo.png" alt= "Reservas" />
            <a href="../xml/zonas.xml">Zonas</a>
            <a href="../xml/plantas.xml">Plantas</a>
            <a href="../xml/actividades.xml">Actividades</a>
          </header>
        
          <main>
            <h1>ZONAS</h1>
            <table>
              <tr>
                <th>ZONA</th>
                <th>Ubicación</th>
                <th>Horario</th>
              </tr>
            <!--Aplicar la platilla únicamente a las zonas con horario de apertura anterior o igual a 10:00-->
            <xsl:apply-templates select="zonas/zona[number(substring-before(normalize-space(horarioapertura),':'))*60+number(substring-after(normalize-space(horarioapertura),':'))&lt;=600]"/>
            </table>	
          </main>
        
          <footer>
          <!--Pie de página-->
            <address>&#169; Desarrollado por info@birt.eus</address>
          </footer>
        </body>
      </html>
  </xsl:template>
  
  <!--Plantilla del nodo zona-->
  <xsl:template match="zona">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <!--Condición para marcar en azúl las ubicaciones que contengan la palabra 'Exterior'-->
      <xsl:choose>
        <xsl:when test="contains(ubicacion,'Exterior')">
          <td style="color:blue"><xsl:value-of select="ubicacion"/></td>
        </xsl:when>
        <xsl:otherwise>
          <td><xsl:value-of select="ubicacion"/></td>
        </xsl:otherwise>
      </xsl:choose>
      <td><xsl:value-of select="horarioapertura"/>-<xsl:value-of select="horariocierre"/></td>
    </tr>    
  </xsl:template>

</xsl:stylesheet>
