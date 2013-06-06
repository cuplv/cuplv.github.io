<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE stylesheet [
<!ENTITY space
"<xsl:text> </xsl:text>">
]>

<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" />

<xsl:include href="cvx.keys.xsl" />

<!-- Main -->

<xsl:template match="/">
  <xsl:apply-templates select="cv/publications/pub" />
</xsl:template>

<!-- BibTeX -->

<xsl:template name="bib-inproceedings">
@string{<xsl:apply-templates select="descendant::proceedings" mode="abbrev-bib"/> = "<xsl:apply-templates select="descendant::proceedings" mode="bib"/>"}
@inproceedings{<xsl:value-of select="@id"/>,
  author = {<xsl:apply-templates select="authors" mode="bib"/>},
  title = {<xsl:apply-templates select="title"/>},
  booktitle = <xsl:apply-templates select="descendant::proceedings" mode="abbrev-bib"/>,
  year = {<xsl:call-template name="get-year"/>},<xsl:if test="pages">
  pages = {<xsl:apply-templates select="pages"/>},
  </xsl:if>
}
</xsl:template>

<xsl:template match="proper">{<xsl:apply-templates/>}</xsl:template>

<!-- Elements -->

<xsl:template match="pub">
  <xsl:apply-templates select="." mode="bib"/>
</xsl:template>
<xsl:template match="pub" mode="bib">
  <xsl:choose>
    <xsl:when test="descendant::proceedings">
      <xsl:call-template name="bib-inproceedings" />
    </xsl:when>
    <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="author" mode="bib">
 <xsl:apply-templates select="key('person', @person)" mode="bib"/> 
</xsl:template>
<xsl:template match="authors" mode="bib">
  <xsl:call-template name="and-list-bib" />
</xsl:template>

<xsl:template match="proceedings" mode="abbrev-bib">
  <xsl:apply-templates select="key('event', @event)" mode="abbrev-bib" />
</xsl:template>
<xsl:template match="proceedings" mode="bib">
  <xsl:apply-templates select="key('event', @event)" mode="bib" />
</xsl:template>

<xsl:template match="event" mode="abbrev-bib">
  <xsl:apply-templates select="." mode="bib">
    <xsl:with-param name="abbrev">t</xsl:with-param>
  </xsl:apply-templates>
</xsl:template>
<xsl:template match="event" mode="name">
  <xsl:apply-templates select="parent::series" />
</xsl:template>
<xsl:template match="event" mode="bib">
  <xsl:param name="abbrev"/>
  <xsl:choose>
    <xsl:when test="parent::series">
      <xsl:choose>
	<xsl:when test="$abbrev">
	  <xsl:apply-templates select=".." mode="abbrev" />
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="." mode="name" /> (<xsl:apply-templates select=".." mode="abbrev" />)</xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="series">
  <xsl:if test="longPrefix">
    <xsl:value-of select="longPrefix" />
    &space;
  </xsl:if>
  <xsl:value-of select="name" />
</xsl:template>
<xsl:template match="series" mode="abbrev">
  <xsl:choose>
    <xsl:when test="abbrev">
      <xsl:value-of select="abbrev" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="translate(@id,
			    'abcdefghijklmnopqrstuvwxyz',
			    'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="person" mode="bib">
  <xsl:value-of select="name" />
</xsl:template>

<!-- Utilities -->

<xsl:template name="and-list-bib">
  <xsl:param name="items" select="child::*" />
  <xsl:call-template name="text-list-bib">
    <xsl:with-param name="items" select="$items" />
    <xsl:with-param name="sep"> and </xsl:with-param>
    <xsl:with-param name="conj"></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="text-list-bib">
  <xsl:param name="items" select="child::*" />
  <xsl:param name="sep">, </xsl:param>
  <xsl:param name="conj"> and </xsl:param>
  <xsl:if test="count($items) > 0">
    <xsl:apply-templates select="$items[1]" mode="bib" />
    <xsl:for-each select="$items[position() > 1]">
      <xsl:if test="count($items) > 2">
	<xsl:value-of select="$sep" />
      </xsl:if>
      <xsl:if test="position() = last()">
	<xsl:value-of select="$conj" />
      </xsl:if>
      <xsl:apply-templates select="." mode="bib" />
    </xsl:for-each>
  </xsl:if>
</xsl:template>

<xsl:template name="get-year">
  <xsl:choose>
    <xsl:when test="descendant::date|key('event',descendant::*[@event]/@event)/date">
      <xsl:call-template name="year-of-date">
	<xsl:with-param name="date" select="descendant::date|key('event',descendant::*[@event]/@event)/date" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="descendant::year|key('event',descendant::*[@event]/@event)/year">
      <xsl:value-of select="descendant::year|key('event',descendant::*[@event]/@event)/year" />
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-formatted-date">
  <xsl:choose>
    <xsl:when test="descendant::date|key('event',@event)/date|key('event',descendant::*[@event]/@event)/date">
      <xsl:call-template name="format-date">
	<xsl:with-param name="date" select="descendant::date|key('event',@event)/date|key('event',descendant::*[@event]/@event)/date" />
      </xsl:call-template>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="year-of-date">
  <xsl:param name="date" select="text()" />
  <xsl:value-of select="tokenize($date[1], '-')[1]" />
</xsl:template>
<xsl:template name="month-of-date">
  <xsl:param name="date" select="text()" />
  <xsl:value-of select="replace(tokenize($date[1], '-')[2], '^0+', '')" />
</xsl:template>
<xsl:template name="day-of-date">
  <xsl:param name="date" select="text()" />
  <xsl:value-of select="replace(tokenize($date[1], '-')[3], '^0+', '')" />
</xsl:template>

<xsl:template name="format-date">
  <xsl:param name="date" select="." />
  <xsl:choose>
    <xsl:when test="count(tokenize($date[1], '-')) = 3">
      <xsl:call-template name="month-name">
	<xsl:with-param name="m">
	  <xsl:call-template name="month-of-date">
	    <xsl:with-param name="date" select="$date" />
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
      &space;
      <xsl:call-template name="day-of-date">
	<xsl:with-param name="date" select="$date" />
      </xsl:call-template>,
      <xsl:call-template name="year-of-date">
	<xsl:with-param name="date" select="$date" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$date" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="month-name">
  <xsl:param name="m" />

  <xsl:if test="$m != ''"><xsl:choose>
    <xsl:when test="$m = 1">January</xsl:when>
    <xsl:when test="$m = 2">February</xsl:when>
    <xsl:when test="$m = 3">March</xsl:when>
    <xsl:when test="$m = 4">April</xsl:when>
    <xsl:when test="$m = 5">May</xsl:when>
    <xsl:when test="$m = 6">June</xsl:when>
    <xsl:when test="$m = 7">July</xsl:when>
    <xsl:when test="$m = 8">August</xsl:when>
    <xsl:when test="$m = 9">September</xsl:when>
    <xsl:when test="$m = 10">October</xsl:when>
    <xsl:when test="$m = 11">November</xsl:when>
    <xsl:when test="$m = 12">December</xsl:when>
    <xsl:otherwise>error: <xsl:value-of select="$m"/> is not a month</xsl:otherwise>
  </xsl:choose></xsl:if>
</xsl:template>

</xsl:stylesheet>
