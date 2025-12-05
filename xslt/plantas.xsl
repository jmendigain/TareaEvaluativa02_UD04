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
        <!--Encabezado-->
        <header>
          <img src="../img/logotipo.png" alt= "Reservas" />
          <a href="../xml/zonas.xml">Zonas</a>
          <a href="../xml/plantas.xml">Plantas</a>
          <a href="../xml/actividades.xml">Actividades</a>
        </header>
        
        <main id="jardinbotanico">
          <h1>PLANTAS</h1>
          <xsl:apply-templates select="plantas/planta"/>
        </main>
            
        <footer>
          <!--Pie de página-->
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>
  
  <!--Plantilla del nodo planta-->
  <xsl:template match="planta">
    <article class="articulo">
      <img class="imagen" src="../img/{@foto}" alt="{foto}"/>
      <!--Condición para insertar la imagen 'Alta.png' cuando la luminosidad sea alta-->
      <xsl:choose>
        <xsl:when test="luminosidad='Alta'">
          <img class="alta-icono" src="../img/Alta.png" alt="Alta"/>
        </xsl:when>
      </xsl:choose>
      <!--Enlace a wikipedia-->
      <h2><a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank"><xsl:value-of select="nombreComun"/></a></h2>
      <h3><xsl:value-of select="luminosidad"/></h3>
    </article>
  </xsl:template>

</xsl:stylesheet>
