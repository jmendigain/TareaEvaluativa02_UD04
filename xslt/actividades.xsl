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
        
       <main>
          <h1>Actividades del mes 11</h1>
            <!--Aplicar la plantilla únicamente a las actividades de noviembre-->
            <xsl:apply-templates select="actividades/actividad[substring(fechaHora,6,2)='11']">
              <!--Ordenar las actividades de manera ascendente-->
              <xsl:sort select="translate(substring-before(fechaHora,'T'),'-','')" data-type="number" order="ascending"/>
            </xsl:apply-templates>
        </main>
        
        <footer>
          <!--Pie de página-->
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>
  
  <!--Plantilla del nodo actividad-->
  <xsl:template match="actividad">
    <xsl:variable name="fechaHora" select="fechaHora"/>
    <xsl:variable name="fecha" select="substring-before($fechaHora,'T')"/>
    <xsl:variable name="hora" select="concat(substring-before(substring-after($fechaHora,'T'),':'),':',substring(substring-after($fechaHora,'T'),4,2))"/>
    <xsl:variable name="numresponsables" select="count(responsables/responsable)"/>
      <article class="actividades">
        <xsl:choose>
          <xsl:when test="$numresponsables>1">
            <h4><xsl:value-of select="titulo"/> - <xsl:value-of select="$numresponsables"/> RESPONSABLES</h4>
          </xsl:when>
          <xsl:otherwise>
          <h4><xsl:value-of select="titulo"/> - <xsl:value-of select="$numresponsables"/> RESPONSABLE</h4>
          </xsl:otherwise>
        </xsl:choose>
        <h2>Fecha: <xsl:value-of select="$fecha"/></h2>
        <h2>Hora: <xsl:value-of select="$hora"/></h2>
        <h2>Lugar: <xsl:value-of select="@sala"/></h2>
        <ul>
          <xsl:apply-templates select="responsables/responsable"/>
        </ul>
      </article>
  </xsl:template>
  
  <!--Plantilla del nodo responsable-->
  <xsl:template match="responsable">
    <li><xsl:value-of select="nomresponsable"/> - <xsl:value-of select="email"/></li>
  </xsl:template>

</xsl:stylesheet>
