<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE stylesheet [
<!ENTITY space
"<xsl:text> </xsl:text>">
]>

<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="cvx/cvx.html.xsl" />

<xsl:output method="text" />
<xsl:output method="html"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
indent="yes"
name="html" />

<!-- Global page declarations -->

<xsl:variable name="site">
  <title>CUPLV</title>
  <head>
   <link href="pl.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
     var _gaq = _gaq || [];
     _gaq.push(['_setAccount', 'UA-25127606-1']);
     _gaq.push(['_trackPageview']);
     (function() {
     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();
   </script>
  </head>
</xsl:variable>

<xsl:template name="site-banner">
  <ul>
    <xsl:apply-templates select="$pages/page" mode="nav">
      <xsl:with-param name="here">
	<xsl:value-of select="name" />
      </xsl:with-param>
    </xsl:apply-templates>
  </ul>
  <img src="pics/banner.jpg" height="50"/>
</xsl:template>

<xsl:variable name="basehref">http://pl.cs.colorado.edu/</xsl:variable>
<xsl:variable name="trackPageviewRoot"></xsl:variable>

<xsl:variable name="pages">
  <page>
    <name>Welcome</name>
    <href>index.html</href>
    <url>.</url>
    <subtitle>Programming Languages and Verification at the University of Colorado Boulder</subtitle>
    <head>
      <script src="lib/jquery-1.5.1.min.js" type="text/javascript"></script>
      <script src="lib/news.js" type="text/javascript"></script>
    </head>
    <header>
      <div>
	<span class="title">CUPLV</span>
	<span class="subtitle">
	  Programming Languages and Verification
	  at the University of Colorado Boulder
	</span>
      </div>
      <div class="tagline">
	Expressivity, Performance, Dependability, and Understanding
	of Computational Systems
      </div>
    </header>
    <content>
      <xsl:apply-templates select="cv/news-list" mode="display-recent" />
      <div class="contentbox" style="width: 98%;">
	<a
	href="http://www.colorado.edu/cs/admissions/how-apply"><b>Ph.D. Positions</b></a>.
	We are looking for strong students to join our diverse and
	dynamic group in programming languages and verification.
	Application deadline is December 15, 2013.
      </div>
      <hr></hr>
      <h4>Projects</h4>
      <xsl:apply-templates select="cv/projects" mode="line" />
      <hr></hr>
      <h4>Publications</h4>
      <xsl:apply-templates select="cv/publications" mode="recent-by-event" />
    </content>
    <rsidebar>
      <h3>Faculty</h3>
      <xsl:for-each select="cv/persons/person[@group='faculty']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <h3>Students</h3>
      <h4>PhD</h4>
      <xsl:for-each select="cv/persons/person[@group='phd']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <xsl:if test="cv/persons/person[@group='bsms']">
	<h4>BS/BA+MS</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='bsms']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <xsl:if test="cv/persons/person[@group='ms']">
	<h4>MS</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='ms']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <xsl:if test="cv/persons/person[@group='bs']">
	<h4>BS/BA</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='bs']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <h3>Alumni</h3>
      <h4>Faculty</h4>
      <xsl:for-each select="cv/persons/person[@group='faculty-alumni']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>PhD</h4>
      <xsl:for-each select="cv/persons/person[@group='phd-alumni']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>BS/BA+MS</h4>
      <xsl:for-each select="cv/persons/person[@group='bsms-alumni']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>MS</h4>
      <xsl:for-each select="cv/persons/person[@group='ms-alumni']">
	<div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <!-- <h3>Focus Areas</h3> -->

      <h3>Affiliates</h3>
      <div class="hanging"><a href="http://systems.cs.colorado.edu/"><b>Computer Systems</b> @ Colorado</a></div>
      <div class="hanging"><a href="http://www.cs.colorado.edu/">Department of <b>Computer Science</b></a></div>
      <div class="hanging"><a href="http://ecee.colorado.edu/">Department of <b>Electrical, Computer, and Energy Engineering</b></a></div>
      <div class="hanging"><a href="http://engineering.colorado.edu/">College of <b>Engineering and Applied Science</b></a></div>
      <div class="hanging"><a href="http://www.colorado.edu/">University of Colorado <b>Boulder</b></a></div>
    </rsidebar>
  </page>
  <page>
    <name>News</name>
    <title>News</title>
    <url>news.html</url>
    <content>
      <xsl:apply-templates select="cv/news-list" />
    </content>
  </page>
  <page>
    <name>People</name>
    <title>People</title>
    <url>people.html</url>
    <content>
      <h2>Faculty</h2>
      <xsl:apply-templates select="cv/persons/person[@group='faculty']" mode="detail" />
      <div class="clearer" />

      <h2>Students</h2>
      <h3>PhD</h3>
      <xsl:apply-templates select="cv/persons/person[@group='phd']" mode="detail" />
      <div class="clearer" />

      <xsl:if test="cv/persons/person[@group='bsms']">
	<h3>BS/BA+MS</h3>
      </xsl:if>
      <xsl:apply-templates select="cv/persons/person[@group='bsms']" mode="detail" />
      <div class="clearer" />

      <xsl:if test="cv/persons/person[@group='ms']">
	<h3>MS</h3>
      </xsl:if>
      <xsl:apply-templates select="cv/persons/person[@group='ms']" mode="detail" />
      <div class="clearer" />

      <xsl:if test="cv/persons/person[@group='bs']">
	<h3>BS/BA</h3>
      </xsl:if>
      <xsl:apply-templates select="cv/persons/person[@group='bs']" mode="detail" />
      <div class="clearer" />

      <h2>Alumni</h2>
      <h3>Faculty</h3>
      <xsl:apply-templates select="cv/persons/person[@group='faculty-alumni']" mode="detail" />
      <div class="clearer" />

      <h3>PhD</h3>
      <xsl:apply-templates select="cv/persons/person[@group='phd-alumni']" mode="detail" />
      <div class="clearer" />

      <h3>BS/BA+MS</h3>
      <xsl:apply-templates select="cv/persons/person[@group='bsms-alumni']" mode="detail" />
      <div class="clearer" />

      <h3>MS</h3>
      <xsl:apply-templates select="cv/persons/person[@group='ms-alumni']" mode="detail" />
      <div class="clearer" />
    </content>
  </page>
  <page>
    <name>Papers</name>
    <title>Papers</title>
    <url>papers.html</url>
    <content>
      <xsl:apply-templates select="cv/publications/pub" />
    </content>
  </page>
  <page>
    <name>Projects</name>
    <title>Projects</title>
    <url>projects.html</url>
    <content>
      <xsl:apply-templates select="cv/projects/project" />
    </content>
  </page> 
</xsl:variable>

</xsl:stylesheet>
