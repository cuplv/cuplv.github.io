<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE stylesheet [
<!ENTITY space
"<xsl:text> </xsl:text>">
<!ENTITY laquo 
"<xsl:text disable-output-escaping='yes'>&amp;laquo;</xsl:text>">
<!ENTITY lsaquo 
"<xsl:text disable-output-escaping='yes'>&amp;lsaquo;</xsl:text>">
]>

<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="cvx.bib.xsl" />

<xsl:output method="text" />
<xsl:output method="html"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
indent="yes"
name="html" />

<xsl:include href="cvx.keys.xsl" />

<xsl:template name="site-banner">
</xsl:template>
<xsl:template name="site-header">
</xsl:template>
<xsl:template name="site-header-tail">
</xsl:template>

<!-- Main -->

<xsl:template match="/">
  <!-- Top-Level Pages -->
  <xsl:for-each select="$pages/page">
    <xsl:variable name="href">
      <xsl:choose>
	<xsl:when test="href"><xsl:value-of select="href" /></xsl:when>
	<xsl:when test="url"><xsl:value-of select="url" /></xsl:when>
      </xsl:choose>
    </xsl:variable>
<xsl:value-of select="$href" /><xsl:text>
</xsl:text>
    <xsl:result-document href="{$href}" format="html">
      <xsl:apply-templates select="." />
    </xsl:result-document>
  </xsl:for-each>
  <!-- Paper Pages -->
  <xsl:for-each select="cv/publications/pub">
    <xsl:variable name="href">papers/<xsl:value-of select="@id" />.html</xsl:variable>
<xsl:value-of select="$href" /><xsl:text>
</xsl:text>
    <xsl:result-document href="{$href}" format="html">
      <xsl:apply-templates select="." mode="page" />
    </xsl:result-document>
  </xsl:for-each>
</xsl:template>

<!-- HTML -->

<xsl:template match="page" name="page">
  <xsl:param name="this" select="."/>
  <xsl:comment>
    Automatically generated. Do not edit directly!
  </xsl:comment>
  <xsl:text>
  </xsl:text>
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
   <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   <title>
     <xsl:if test="$this/title">
       <xsl:value-of select="$this/title" />
       &space; | &space;
     </xsl:if>
     <xsl:value-of select="$site/title" />
     <xsl:if test="$this/subtitle">:
       <xsl:value-of select="$this/subtitle" />
     </xsl:if>
   </title>
   <xsl:copy-of select="$this/head/node()" />
   <xsl:copy-of select="$site/head/node()" />
 </head>
 	
 <body>
 <div id="container">

 <div id="lsidebarfloat"><div id="lsidebar">
   <xsl:copy-of select="$this/lsidebar/node()" />
 </div></div>

 <div id="rsidebarfloat"><div id="rsidebar">
   <xsl:copy-of select="$this/rsidebar/node()" />
 </div></div>

 <div id="banner">
   <xsl:call-template name="site-banner" />
 </div>
 
 <div id="content">
  <xsl:copy-of select="$site/content-top/node()" />
  <div id="header">
    <xsl:call-template name="site-header" />
    <xsl:choose>
      <xsl:when test="$this/header">
	<xsl:copy-of select="$this/header/node()" />
      </xsl:when>
      <xsl:when test="$this/title">
	<div class="title"><xsl:value-of select="$this/title" /></div>
      </xsl:when>
    </xsl:choose>
    <xsl:call-template name="site-header-tail" />
  </div>

  <xsl:copy-of select="$this/content/node()" />
 </div>
 
 </div>
 </body>
 </html>
</xsl:template>

<xsl:template match="page" mode="nav">
  <xsl:param name="here" />
  <xsl:choose>
    <xsl:when test="name = $here">
      <li><span class="link-here">
	<xsl:value-of select="name" />
      </span></li>
    </xsl:when>
    <xsl:otherwise>
      <li>
	<xsl:apply-templates select="url" />
      </li>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Elements -->

<!-- Item -->

<xsl:template name="item">
  <xsl:param name="title" select="title/node()" />
  <xsl:param name="date" select="date/node()" />
  <xsl:param name="icon">
    <xsl:apply-templates select="icon" />
  </xsl:param>
  <xsl:param name="lines" />
  <xsl:param name="notes" />
  <xsl:param name="nohanging" />
  <div class="item">
    <div class="item-icon"><xsl:copy-of select="$icon" /></div>
    <div class="item-block">
      <div class="item-date"><xsl:copy-of select="$date" /></div>
      <ul class="hlinks">
	<li>
	  <xsl:apply-templates select="." mode="ref">
	    <xsl:with-param name="text">detail</xsl:with-param>
	  </xsl:apply-templates>
	</li>
	<xsl:apply-templates select="urls" />
      </ul>
      <div class="item-header hanging">
	<xsl:copy-of select="$title" />
      </div>
      <xsl:if test="$lines">
	<xsl:for-each select="$lines">
	  <xsl:choose>
	    <xsl:when test="$nohanging">
	      <div><xsl:apply-templates select="." /></div>
	    </xsl:when>
	    <xsl:otherwise>
	      <div class="hanging"><xsl:apply-templates select="." /></div>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:for-each>
      </xsl:if>
      <xsl:if test="$notes">
	<xsl:for-each select="$notes">
	  <div class="item-note"><xsl:apply-templates select="." /></div>
	</xsl:for-each>
      </xsl:if>
    </div>
  </div>
</xsl:template>

<xsl:template match="line|note">
  <xsl:apply-templates select="child::*|child::text()" />
</xsl:template>

<xsl:template match="*" mode="ref">
  <!-- Any element with no ref mode is empty.  For the 'detail' link in 'item'. -->
</xsl:template>

<xsl:template match="*" mode="icon">
  <!-- The icon of any element is to search for a descendant with an 'icon' element. -->
  <xsl:apply-templates select="descendant::icon[1]" />
</xsl:template>

<!-- News -->

<xsl:template match="news-list">
  <xsl:apply-templates select="news" />
</xsl:template>

<xsl:template match="news-list" mode="display-recent">
  <div id="news">
    <div id="news-box">
      <xsl:apply-templates select="descendant::news-snippet[15 >= position()]" mode="as-detail"/>
    </div>
    <xsl:apply-templates select="descendant::news-snippet[15 >= position()]" mode="as-item"/>
  </div>
</xsl:template>

<xsl:template match="news" mode="p-list">
  <p>
    <xsl:value-of select="@date" />:
    <xsl:apply-templates select="child::node()" />
  </p>
</xsl:template>

<xsl:template match="news">
  <xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
  <h2 id="{$id}"><xsl:value-of select="@date"/></h2>
  <p>
    <xsl:apply-templates select="news-snippet" mode="get-detail" />
  </p>
  <xsl:apply-templates select="(news-snippet|news-detail)[last()]/following-sibling::*" />
</xsl:template>

<xsl:template match="news-snippet" mode="as-item">
  <xsl:variable name="id">
    <xsl:value-of select="parent::news/@id" />
  </xsl:variable>
  <div class="news-item" id="{$id}">
    <xsl:value-of select="parent::news/@date" />:
    <xsl:apply-templates select="." />
  </div>
</xsl:template>
<xsl:template match="news-snippet" mode="as-detail">
  <div class="news-detail">
    <xsl:value-of select="parent::news/@date" />:
    <xsl:apply-templates select="." mode="get-detail" />
  </div>
</xsl:template>
<xsl:template match="news-snippet" mode="get-detail">
  <xsl:choose>
    <xsl:when test="parent::news/child::news-detail">
      <xsl:apply-templates select="parent::news/child::news-detail" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="float-or-persons" />
      <xsl:apply-templates select="." />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="news-detail">
  <xsl:call-template name="float-or-persons" />
  <xsl:apply-templates select="child::node()" />
</xsl:template>

<xsl:template name="float-or-persons">
  <xsl:choose>
    <xsl:when test="float">
    </xsl:when>
    <xsl:otherwise>
      <div class="float-right">
	<xsl:for-each select="ref['person'=@table]">
	  <xsl:apply-templates select=".">
	    <xsl:with-param name="mode">medium-face</xsl:with-param>
	  </xsl:apply-templates>
	  &space;
	</xsl:for-each>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="float">
  <div class="float-right">
    <xsl:apply-templates select="child::node()" />
  </div>    
</xsl:template>

<xsl:template match="news-page">
  <xsl:choose>
    <xsl:when test="@header">
      <h3><xsl:value-of select="@header"/></h3>
    </xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="child::node()" />
</xsl:template>

<xsl:template match="talk-announcement">
  <h3>PLV Seminar</h3>
  <div class="item">
    <div class="item-icon">
      <xsl:apply-templates select="speaker" mode="face"/>
    </div>
    <div class="item-block">
      <xsl:call-template name="div-list">
	<xsl:with-param name="items" select="speaker|affiliation" />
      </xsl:call-template>
      <br/>
      <xsl:call-template name="div-list">
	<xsl:with-param name="items" select="when|where" />
      </xsl:call-template>
      <h4><em><xsl:apply-templates select="title" /></em></h4>
      <xsl:call-template name="div-list">
	<xsl:with-param name="items" select="abstract|bio" />
      </xsl:call-template>
    </div>
  </div>
</xsl:template>
<xsl:template match="bio">
  <h4>Biography</h4>
  <xsl:apply-templates />
</xsl:template>
<xsl:template match="speaker" mode="face">
  <xsl:apply-templates select="child::node()">
    <xsl:with-param name="mode">face</xsl:with-param>
  </xsl:apply-templates>
</xsl:template>

<!-- Students -->

<xsl:template match="students">
  <table class="columns">
    <xsl:apply-templates select="student" />
  </table>
</xsl:template>

<xsl:template match="student">
  <tr><td>
    <xsl:apply-templates select="key('person', @person)" />
    <xsl:if test="coadvisor">
      (co-advised with
      <xsl:call-template name="text-list">
	<xsl:with-param name="items" select="key('person', coadvisor/@person)" />
      </xsl:call-template>)</xsl:if>.
    <xsl:apply-templates select="child::node()" />
  </td></tr>
</xsl:template>

<!-- Courses -->

<xsl:template match="courses">
  <table class="columns line-spaced">
    <xsl:apply-templates select="series" mode="long-right">
      <xsl:with-param name="sub">course</xsl:with-param>
    </xsl:apply-templates>
  </table>
</xsl:template>

<xsl:template match="course">
  <xsl:call-template name="withurl">
    <xsl:with-param name="text"><xsl:value-of select="semester" /></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- Activities -->

<xsl:template match="activities">
  <table class="columns line-spaced">
    <xsl:apply-templates select="child::*" />
  </table>
</xsl:template>

<xsl:template match="committee">
  <tr>
    <td>
      <xsl:apply-templates select="key('event',@event)" mode="abbrev" /> 
    </td>
    <td>
      <div><xsl:value-of select="." /></div>
      <div class="item-note">
	<xsl:apply-templates select="key('event',@event)" mode="name" /> 
      </div>
    </td>
  </tr>
</xsl:template>

<!-- Projects -->

<xsl:template match="project">
  <xsl:call-template name="item">
    <xsl:with-param name="title">
      <xsl:call-template name="withurl">
	<xsl:with-param name="text" select="name" />
      </xsl:call-template>
      <span style="position: relative; left: 100px;"><xsl:value-of select="title"/></span>
    </xsl:with-param>
    <xsl:with-param name="lines" select="snippet" />
    <xsl:with-param name="notes" select="authors|references" />
    <xsl:with-param name="nohanging">t</xsl:with-param>
    <xsl:with-param name="icon">
      <xsl:call-template name="icon-or-words"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="project" mode="line">
  <div class="item">
    <div>
      <xsl:call-template name="withurl">
	<xsl:with-param name="text" select="name" />
      </xsl:call-template>
      <span style="position: relative; left: 60px;">
	  <xsl:value-of select="title"/>
	  <span style="margin-left: 1em">
	    <xsl:apply-templates select="authors/author" mode="small-face"/>
	  </span>
      </span>
    </div>
  </div>
</xsl:template>

<xsl:template match="icon" name="icon">
  <xsl:param name="imgsrc" select="child::text()" />
  <xsl:call-template name="withurl">
    <xsl:with-param name="text">
      <img src="{$imgsrc}" class="icon"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="icon-or-words">
  <xsl:variable name="iconsrc">
    <xsl:choose>
      <xsl:when test="icon"><xsl:value-of select="icon"/></xsl:when>
      <xsl:otherwise>clouds/<xsl:value-of select="@id"/>.words.png</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:call-template name="icon">
    <xsl:with-param name="imgsrc" select="$iconsrc"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="references">
  <xsl:text>References:
</xsl:text>
  <xsl:call-template name="text-list">
    <xsl:with-param name="sep"> | </xsl:with-param>
    <xsl:with-param name="conj" />
  </xsl:call-template>
</xsl:template>

<!-- Publications -->

<xsl:template match="publications" mode="recent-by-event">
  <!-- Hard wired to last two years of publications and showing only events. -->

  <xsl:for-each select="pub[descendant::proceedings]">
    <xsl:variable name="pub-year">
      <xsl:call-template name="get-year" />
    </xsl:variable>
    <xsl:if test="$pub-year >= year-from-date(current-date()) - 1">
      <xsl:if test="(position() = 1) or (preceding-sibling::*[1]/descendant::proceedings[1]/@event != descendant::proceedings[1]/@event)">
	<xsl:apply-templates select="descendant::proceedings" mode="header" />
      </xsl:if>
      <xsl:apply-templates select="." />
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="pub" mode="ref">
  <xsl:param name="mode" />
  <xsl:param name="text" /> 
  <xsl:variable name="text">
    <xsl:choose>
      <xsl:when test="$text"><xsl:value-of select="$text" /></xsl:when>
      <xsl:when test="'abbrev'=$mode"><xsl:apply-templates select="howpub" mode="abbrev" /></xsl:when>
      <xsl:when test="'authors'=$mode"><xsl:apply-templates select="." mode="authors" /></xsl:when>
      <xsl:otherwise><xsl:apply-templates select="." mode="title" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="href">papers/<xsl:value-of select="@id" />.html</xsl:variable>
  <a href="{$href}"><xsl:value-of select="$text" /></a>
</xsl:template>

<xsl:template match="pub" mode="authors">
  <xsl:variable name="author-list">
    <xsl:call-template name="etal-list">
      <xsl:with-param name="items" select="descendant::author" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:call-template name="withurl">
    <xsl:with-param name="text" select="$author-list" />
  </xsl:call-template>
</xsl:template>
<xsl:template match="pub" mode="title">
  <xsl:call-template name="withurl">
    <xsl:with-param name="text" select="title" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="pub">
  <xsl:call-template name="item">
    <xsl:with-param name="date">
      <xsl:call-template name="get-year" />
    </xsl:with-param>
    <xsl:with-param name="lines" select="authors|howpub" />
    <xsl:with-param name="notes" select="note" />
    <xsl:with-param name="icon">
      <xsl:call-template name="icon-or-words"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="pub" mode="page">
  <xsl:call-template name="page">
    <xsl:with-param name="this">
      <head>
	<script type="text/javascript" src="lib/sh_main.min.js" />
	<script type="text/javascript" src="lib/sh_bib.js" />
	<link href="lib/sh_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	  (function(w) { var p = w.onload;
	     w.onload = function() {
	       sh_highlightDocument(); if (p != undefined){ p(); }
	     };
	  })(window)
	</script>
	<base href="{$basehref}" />
      </head>
      <header>
	<div class="small-title"><xsl:value-of select="title"/></div>
	<div class="subtitle"><xsl:apply-templates select="howpub" mode="abbrev"/></div>
      </header>
      <title>
	<xsl:apply-templates select="howpub" mode="abbrev"/>:
	<xsl:value-of select="title"/>
      </title>
      <content>
	<h4>Reference</h4>
	<xsl:apply-templates select="." />
	<xsl:apply-templates select="abstract" />
	<xsl:apply-templates select="." mode="bib-section" />
      </content>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="pub" mode="bib-section">
  <xsl:variable name="bibtexhtml">
    <xsl:apply-templates select="." mode="bib" />
  </xsl:variable>
  <xsl:if test="$bibtexhtml != ''">
    <h4>BibTeX</h4>
    <pre class="sh_bib">
      <xsl:value-of select="$bibtexhtml"/>
    </pre>
  </xsl:if>
</xsl:template>

<xsl:template match="abstract">
  <h4>Abstract</h4>
  <xsl:apply-templates/>
</xsl:template>

<!-- Talks -->

<xsl:template match="talk">
  <xsl:call-template name="item">
    <xsl:with-param name="date">
      <xsl:call-template name="get-formatted-date" />
    </xsl:with-param>
    <xsl:with-param name="lines" select="where|key('event',where/@event)/location|location|line" />
    <xsl:with-param name="notes" select="note" />
  </xsl:call-template>
</xsl:template>

<!-- References -->

<xsl:template match="ref">
  <xsl:param name="mode" select="@mode"/>
  <xsl:choose>
    <xsl:when test="@text">
      <xsl:apply-templates select="key(@table, @key)" mode="ref">
	<xsl:with-param name="mode" select="$mode"/>
	<xsl:with-param name="text" select="@text" />
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="key(@table, @key)" mode="ref">
	<xsl:with-param name="mode" select="$mode"/>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="author">
 <xsl:apply-templates select="key('person', @person)" /> 
</xsl:template>
<xsl:template match="author" mode="lastname">
 <xsl:apply-templates select="key('person', @person)" mode="lastname" /> 
</xsl:template>
<xsl:template match="author" mode="small-face">
 <xsl:apply-templates select="key('person', @person)" mode="small-face" /> 
</xsl:template>
<xsl:template match="authors">
  <xsl:call-template name="text-list" />
</xsl:template>
<xsl:template match="authors" mode="etal">
  <xsl:call-template name="etal-list" />
</xsl:template>

<xsl:template match="howpub">
  <xsl:apply-templates select="node()" />
</xsl:template>
<xsl:template match="howpub" mode="abbrev">
  <xsl:apply-templates select="node()" mode="abbrev" />
</xsl:template>
<xsl:template match="proceedings">
  <xsl:apply-templates select="key('event', @event)" />
</xsl:template>
<xsl:template match="proceedings" mode="abbrev">
  <xsl:apply-templates select="key('event', @event)" mode="abbrev"/>
</xsl:template>
<xsl:template match="proceedings" mode="header">
  <xsl:apply-templates select="key('event', @event)" mode="header"/>
</xsl:template>

<xsl:template match="where">
  <xsl:choose>
    <xsl:when test="@event">
      <xsl:apply-templates select="key('event', @event)" />
    </xsl:when>
    <xsl:otherwise><xsl:copy-of select="node()" /></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="person">
  <xsl:call-template name="withurl" />
</xsl:template>
<xsl:template match="person" mode="lastname">
  <xsl:call-template name="withurl">
    <xsl:with-param name="text" select="tokenize(name, '\s+')[last()]"/>
  </xsl:call-template>
</xsl:template>
<xsl:template match="person" mode="ref">
  <xsl:param name="mode"/>
  <xsl:choose>
    <xsl:when test="'face'=$mode">
      <xsl:apply-templates select="face"/>
    </xsl:when>
    <xsl:when test="'medium-face'=$mode or 'small-face'=$mode">
      <xsl:apply-templates select="face">
	<xsl:with-param name="class"><xsl:value-of select="$mode"/></xsl:with-param>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="person" mode="with-small-face">
  <xsl:apply-templates select="." mode="small-face" />
  <xsl:call-template name="withurl" />
</xsl:template>
<xsl:template match="person" mode="small-face">
  <xsl:call-template name="withurl">
    <xsl:with-param name="text">
      <xsl:apply-templates select="face">
        <xsl:with-param name="class">small-face</xsl:with-param>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>
<xsl:template match="person" mode="detail">
  <div class="person">
    <xsl:call-template name="withurl">
      <xsl:with-param name="text">
	<div>
	  <xsl:apply-templates select="face"/>
	</div>
	<div><xsl:value-of select="name"/></div>
      </xsl:with-param>
    </xsl:call-template>
  </div>
</xsl:template>
<xsl:template match="face">
  <xsl:param name="class"/>
  <xsl:variable name="imgsrc" select="."/>
  <xsl:choose>
    <xsl:when test="$class">
      <img class="{$class}" src="{$imgsrc}"/>
    </xsl:when>
    <xsl:otherwise>
      <img class="face" src="{$imgsrc}"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="event" mode="header">
  <h2>
    <xsl:apply-templates select="." mode="ref" />
    <span class="subh">
      <xsl:apply-templates select="location" />
    </span>
    <span class="subh">
      <xsl:call-template name="get-formatted-date" />
    </span>
  </h2>
</xsl:template>
<xsl:template match="event" mode="ref">
  <xsl:apply-templates select="." mode="abbrev" />
</xsl:template>
<xsl:template match="event" mode="abbrev">
  <xsl:apply-templates select=".">
    <xsl:with-param name="abbrev">t</xsl:with-param>
  </xsl:apply-templates>
</xsl:template>
<xsl:template match="event" mode="name">
  <xsl:apply-templates select="parent::series" />
</xsl:template>
<xsl:template match="event">
  <xsl:param name="abbrev"/>
  <xsl:choose>
    <xsl:when test="parent::series">
      <xsl:call-template name="withurl">
	<xsl:with-param name="text">
	  <xsl:apply-templates select=".." mode="abbrev" />
	  &space;
	  <xsl:call-template name="get-year" />
        </xsl:with-param>
      </xsl:call-template>
      <xsl:if test="not($abbrev)">:
        <xsl:apply-templates select="." mode="name" />
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="withurl" />
      <xsl:apply-templates select="name/following-sibling::*" />
    </xsl:otherwise>
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
      <xsl:apply-templates select="abbrev" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="translate(@id,
			    'abcdefghijklmnopqrstuvwxyz',
			    'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="series" mode="long">
  <xsl:param name="sub" />
  <tr>
    <td>
      <xsl:call-template name="withurl">
	<xsl:with-param name="text">
	  <xsl:apply-templates select="." mode="abbrev" />
	</xsl:with-param>
      </xsl:call-template>
    </td>
    <td>
      <div><xsl:value-of select="name" /></div>
      <div class="item-note">
	<xsl:call-template name="text-list">
	  <xsl:with-param name="items" select="child::*[name()=$sub]" />
	</xsl:call-template>
      </div>
    </td>
  </tr>
</xsl:template>

<xsl:template match="series" mode="long-right">
  <xsl:param name="sub" />
  <tr>
    <td>
      <div><xsl:value-of select="name" /></div>
      <div class="item-note">
	<xsl:call-template name="text-list">
	  <xsl:with-param name="items" select="child::*[name()=$sub]" />
	</xsl:call-template>
      </div>
    </td>
    <td>
      <xsl:call-template name="withurl">
	<xsl:with-param name="text">
	  <xsl:apply-templates select="." mode="abbrev" />
	</xsl:with-param>
      </xsl:call-template>
    </td>
  </tr>
</xsl:template>

<xsl:template match="tr">
  <xsl:apply-templates select="number/preceding-sibling::*" />
  Technical Report
  <xsl:choose>
    <xsl:when test="url">
      <xsl:apply-templates select="url[1]">
	<xsl:with-param name="text" select="number" />
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="number" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="extendedtr">
  Extended Version:
</xsl:template>

<xsl:template match="url">
  <xsl:param name="text" />
  <xsl:variable name="anchor">
    <xsl:choose>
      <xsl:when test="$text"><xsl:copy-of select="$text" /></xsl:when>
      <xsl:when test="@name"><xsl:value-of select="@name" /></xsl:when>
      <xsl:when test="../name"><xsl:value-of select="../name" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:call-template name="make-a">
    <xsl:with-param name="anchor" select="$anchor" />
  </xsl:call-template>
</xsl:template>
<xsl:template name="make-a">
  <xsl:param name="href" select="child::text()" />
  <xsl:param name="anchor" />
<a>
    <xsl:attribute name="href"><xsl:apply-templates select="child::node()" /></xsl:attribute>
    <xsl:if test="not(starts-with($href, 'http') or ends-with($href,'html') or ends-with($href,'/') or ends-with($href,'.'))">
      <xsl:attribute name="onClick">
	<xsl:text>_gaq.push(['_trackPageview', '/</xsl:text><xsl:value-of select="$trackPageviewRoot"/>
	<xsl:apply-templates select="child::node()" />
	<xsl:text>']);</xsl:text>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="$anchor/node()"/>
</a>
</xsl:template>
<xsl:template match="urls">
  <xsl:call-template name="li-list" />
</xsl:template>

<xsl:template match="snippet">
  <xsl:apply-templates select="child::node()" />
</xsl:template>

<xsl:template match="p|em|span|div">
  <xsl:copy-of select="."/>
</xsl:template>

<!-- Special Formatting -->

<xsl:template match="fmt">
  <xsl:variable name="kind" select="@kind" />
  <span class="fmt-{$kind}"><xsl:value-of select="." /></span>
</xsl:template>

<!-- Utilities -->

<xsl:template name="recent">
  <xsl:param name="items" select="child::*" />
  <xsl:param name="href" />
  <xsl:apply-templates select="$items" />
  <div>[<a href="{$href}">more</a>]</div>
</xsl:template>

<xsl:template name="withurl">
  <xsl:param name="text" select="name/node()" />
  <xsl:choose>
  <xsl:when test="descendant::url[1]">
    <xsl:apply-templates select="descendant::url[1]">
      <xsl:with-param name="text" select="$text" />
    </xsl:apply-templates>
  </xsl:when>
  <xsl:when test="../child::url[1]">
    <xsl:apply-templates select="../child::url[1]">
      <xsl:with-param name="text" select="$text" />
    </xsl:apply-templates>
  </xsl:when>
  <xsl:otherwise>
    <xsl:copy-of select="$text" />
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="text-list">
  <xsl:param name="items" select="child::*" />
  <xsl:param name="sep">, </xsl:param>
  <xsl:param name="conj"> and </xsl:param>
  <xsl:if test="count($items) > 0">
    <xsl:apply-templates select="$items[1]" />
    <xsl:for-each select="$items[position() > 1]">
      <xsl:if test="count($items) > 2">
	<xsl:copy-of select="$sep" />
      </xsl:if>
      <xsl:if test="position() = last()">
	<xsl:copy-of select="$conj" />
      </xsl:if>
      <xsl:apply-templates select="." />
    </xsl:for-each>
  </xsl:if>
</xsl:template>

<xsl:template name="etal-list">
  <xsl:param name="items" select="child::*" />
  <xsl:param name="conj"><xsl:text> and </xsl:text></xsl:param>
  <xsl:if test="count($items) > 0">
    <xsl:apply-templates select="$items[1]" mode="lastname" />
    <xsl:choose>
      <xsl:when test="count($items) = 2">
        <xsl:value-of select="$conj" />
        <xsl:apply-templates select="$items[2]" mode="lastname" />
      </xsl:when>
      <xsl:otherwise>&space; et al.</xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<xsl:template name="li-list">
  <xsl:param name="items" select="child::*" />
  <xsl:for-each select="$items">
    <li><xsl:apply-templates select="." /></li>
  </xsl:for-each>
</xsl:template>
<xsl:template name="div-list">
  <xsl:param name="items" select="child::*" />
  <xsl:param name="class" />
  <xsl:for-each select="$items">
    <div>
      <xsl:if test="$class">
	<xsl:attribute name="class">{$class}</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="." />
    </div>
  </xsl:for-each>
</xsl:template>

<xsl:template name="clean-text">
  <xsl:apply-templates select="." mode="clean-text" />
</xsl:template>
<xsl:template match="*" mode="clean-text">
  <xsl:copy>
    <xsl:for-each select="@*">
      <xsl:variable name="name" select="name()" />
      <xsl:attribute name="{$name}"><xsl:value-of select="." /></xsl:attribute>
    </xsl:for-each>
    <xsl:apply-templates mode="clean-text"/>
  </xsl:copy>
</xsl:template>
<xsl:template match="text()" mode="clean-text">
  <xsl:value-of select="normalize-space()"/>
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
  <xsl:variable name="ntokens" select="count(tokenize($date[1], '-'))" />
  <xsl:choose>
    <xsl:when test="$ntokens >= 2">
      <xsl:call-template name="month-name">
	<xsl:with-param name="m">
	  <xsl:call-template name="month-of-date">
	    <xsl:with-param name="date" select="$date" />
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
      &space;
      <xsl:if test="$ntokens >= 3">
	<xsl:call-template name="day-of-date">
	  <xsl:with-param name="date" select="$date" />
	  </xsl:call-template>,
      </xsl:if>
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
