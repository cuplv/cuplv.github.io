<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
<!ENTITY space
"<xsl:text> </xsl:text>">
]>

<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />
<xsl:output method="text"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
indent="yes"
name="text" />

<!-- Generate Text -->

<xsl:template match="*" mode="make-words">
  <!-- Make an icon if one is not specified. -->
  <xsl:if test="@id">
    <xsl:variable name="href">clouds/<xsl:value-of select="@id" />.words.txt</xsl:variable>
    <xsl:result-document href="{$href}" format="text">
      <xsl:apply-templates select="title" />
      <xsl:choose>
        <xsl:when test="abstract">
          <xsl:apply-templates select="abstract" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="name"/>&space;<xsl:value-of select="name"/>&space;
          <xsl:value-of select="name"/>&space;<xsl:value-of select="name"/>&space;
          <xsl:value-of select="name"/>&space;<xsl:value-of select="name"/>&space;
          <xsl:value-of select="name"/>&space;<xsl:value-of select="name"/>&space;
          <xsl:value-of select="name"/>&space;<xsl:value-of select="name"/>&space;
          <xsl:value-of select="descendant::*[name()!='url']"/>
        </xsl:otherwise>
      </xsl:choose>
</xsl:result-document>
  </xsl:if>
</xsl:template>

<xsl:template match="p">
<xsl:value-of select="." /><xsl:text>

</xsl:text>
</xsl:template>

<!-- Main -->

<xsl:template match="/">
  <!-- Words for all projects -->
  <xsl:apply-templates select="cv/projects/project" mode="make-words" />
  <!-- Abstracts for all papers -->
  <xsl:apply-templates select="cv/publications/pub" mode="make-words" />
</xsl:template>

</xsl:stylesheet>
