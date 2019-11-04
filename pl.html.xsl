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
      <div class="contentbox" style="width: 48%; float:right; height: 12ex;">
        <a href="http://www.colorado.edu/cs/apply/graduate-admissions"><b>Ph.D. Positions</b></a>.
        We are looking for strong students to join our diverse and dynamic group in programming languages and verification. Application deadline is December 15, 2019 (or November 15, 2019 to potentially waive application fees).
      </div>
      <div class="contentbox" style="width: 48%; height: 12ex;">
        <a href="news.html#faculty-2019"><b>Faculty Positions</b></a>.
        We are hiring for a tenure-track position in <em>trustworthy software</em>, as well as for instructor positions.
        Application deadline for the tenure-track position is December 1, 2019.
      </div>
 <!--
   <div class="contentbox" style="width: 48%; height: 12ex;">
  <a href="news.html#postdoc-call-2017-spring"><b>Postdoc Position</b></a>.
  There is a postdoctoral research associate position open
  with the opportunity to work with
  Profs.
  <xsl:apply-templates select="//person[@id='cernyp']"/>,
  <xsl:apply-templates select="//person[@id='bec']"/>,
  <xsl:apply-templates select="//person[@id='srirams']"/>, and
  <xsl:apply-templates select="//person[@id='atrivedi']"/>.
      </div>
-->
      <div style="clear: left;"></div>
      <hr></hr>
      <h4>Projects</h4>
      <xsl:apply-templates select="cv/projects" mode="line" />
      <hr></hr>
      <h4>Recent Publications</h4>
      <xsl:apply-templates select="cv/publications" mode="recent-by-event" />
    </content>
    <rsidebar>
      <div class="item">
        <ul class="hlinks">
    <li>
      <a href="https://github.com/cuplv">
        <img src="pics/github-octocat.png" class="small-icon"/>
      </a>
      <a href="https://twitter.com/cuplv">
        <img src="pics/twitter-bird.png" class="small-icon"/>
      </a>
      <a href="https://vimeo.com/channels/cuplv">
        <img src="pics/vimeo.png" class="small-icon"/>
      </a>
    </li>
        </ul>
      </div>

      <h3>Faculty</h3>
      <xsl:for-each select="cv/persons/person[@group='faculty']">
  <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <xsl:if test="cv/persons/person[@group='scientist']">
      <h3>Scientists</h3>
      <xsl:for-each select="cv/persons/person[@group='scientist']">
  <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      </xsl:if>

      <h3>Post-Docs</h3>
      <xsl:for-each select="cv/persons/person[@group='postdoc']">
  <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <h3>Students</h3>
      <h4>PhD</h4>
      <xsl:for-each select="cv/persons/person[@group='phd']">
      <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <xsl:if test="cv/persons/person[@group='bsms']">
      <h4>BS+MS</h4>
      <xsl:for-each select="cv/persons/person[@group='bsms']">
      <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      </xsl:if>

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

      <xsl:if test="cv/persons/person[@group='gradintern']">
      <h4>Graduate Interns</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='gradintern']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <xsl:if test="cv/persons/person[@group='visitor']">
      <h4>Visiting Scholars</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='visitor']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>

      <h3>Alumni</h3>
      <h4>Faculty</h4>
      <xsl:for-each select="cv/persons/person[@group='faculty-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h3>Scientists</h3>
      <xsl:for-each select="cv/persons/person[@group='scientist-alumni']">
  <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>Post-Docs</h4>
      <xsl:for-each select="cv/persons/person[@group='postdoc-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>PhD</h4>
      <xsl:for-each select="cv/persons/person[@group='phd-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>BS+MS</h4>
      <xsl:for-each select="cv/persons/person[@group='bsms-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <h4>MS</h4>
      <xsl:for-each select="cv/persons/person[@group='ms-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <xsl:if test="cv/persons/person[@group='bs-alumni']">
      <h4>BS/BA</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='bs-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>
      <xsl:if test="cv/persons/person[@group='visitor-alumni']">
      <h4>Visiting Scholars</h4>
      </xsl:if>
      <xsl:for-each select="cv/persons/person[@group='visitor-alumni']">
        <div><xsl:apply-templates select="." mode="with-small-face"/></div>
      </xsl:for-each>


      <!-- <h3>Focus Areas</h3> -->

      <h3>Affiliates</h3>
      <div class="hanging"><a href="http://systems.cs.colorado.edu/"><b>Computer Systems</b> @ Colorado</a></div>
      <div class="hanging"><a href="http://hcc.colorado.edu/"><b>Human-Centered Computing</b> @ Colorado</a></div>
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

      <h2>Scientists</h2>
      <xsl:apply-templates select="cv/persons/person[@group='scientist']" mode="detail" />
      <div class="clearer" />

      <h2>Post-Docs</h2>
      <xsl:apply-templates select="cv/persons/person[@group='postdoc']" mode="detail" />
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

      <h3>BS/BA</h3>
      <xsl:apply-templates select="cv/persons/person[@group='bs-alumni']" mode="detail" />
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
  <page>
    <name>Visiting</name>
    <title>Visiting CUPLV</title>
    <url>visiting.html</url>
    <content>
      <h2>Location and Directions</h2>
      <p>CUPLV is located in ECCS 121 in the Computer Science wing (ECCS) of the Engineering Center at
      <a href="https://www.google.com/maps/place/1111+Engineering+Drive,+Boulder,+CO+80309/">1111 Engineering Drive, Boulder, CO 80309</a>
      or the southwest corner of Colorado Avenue and Regent Drive.</p>
      <p>The main entrance of the Engineering Center is on the west side. From this entrance, 
      the Computer Science wing (ECCS) is found by going right and following signs, and
      the Office Tower (ECOT) elevators are immediately to your left.
      Alternatively, from the South Entrance (with the South Café),
      the Computer Science wing (ECCS) is to directly to your left, and
      the Office Tower (ECOT) elevators are found by roughly going straight (right and then immediately left to go down a hall towards the West Entrance).</p>
      <p>Visitor parking is accessed by turning left from US-36 on to Colorado and then the first left on to Regent Drive. Parking with permit is the first left from Regent Drive, and hourly parking is the second left.</p>
      <h2>Transportation</h2>
      <p>Fly into <a href="http://www.flydenver.com/">Denver International Airport</a> (DEN).  Boulder is about 45 minutes from the airport by car.</p>
      <p>To get from the airport, here are some options:
        <ul>
          <li>Take the express <a href="http://www.rtd-denver.com/services/airport">RTD SkyRide</a> that is both comfortable and convenient.
            The <a href="https://www.rtd-denver.com/app/route/AB1-AB2/schedule?direction=westbound">AB</a> routes go directly from the airport transit center to Boulder.
            The AB1 goes by campus on the west side and ends in downtown Boulder, while the AB2 goes by campus on the east side and ends in Boulder Junction.
            If you stay at the Hotel Boulderado, the downtown
              transit center where the AB1 bus ends is only a few blocks from the hotel.
            The fare is $10.50 one way and departs once or twice an hour.
            Follow the signs to the transit station for this bus in the airport terminal.
            Purchase tickets from the <a href="https://www.rtd-denver.com/fares-passes/mobile-ticketing">mobile</a> app or from the ticket machines in the transit center, or pay cash on the bus (but no change given).
            Get bus directions using Google Maps or the <a href="https://transitapp.com/">Transit</a> app.
          </li>
          <li>An app-based rideshare is to Boulder about $60, while taxi is about $88.</li>
          <li>Rent a car.  It is usually pretty inexpensive.  You need to take an airport bus to the rental car center.</li>
          <!--<li>Take the <a href="http://greenrideboulder.com/">Green Ride</a> airport shuttle. It's $30 one way.</li>-->
        </ul>
      </p>
      <p>If you drive from the airport, there is a north/toll route (<a href="http://goo.gl/maps/py3o">E-470 to Northwest Parkway to US-36</a>)
      or a south/free route along (<a href="http://goo.gl/maps/wkMb">I-70 to I-270 to US-36</a>). You should definitely take the toll route during morning/evening rush hours.
      </p>
      <p>Getting around Boulder by bus is quite easy. RTD is the transit system in the Denver-Boulder area, and there are express buses between Denver and Boulder (the <a href="https://www.rtd-denver.com/services/flatiron-flyer">Flatiron Flyer</a> routes).  You would get off at Broadway and Regent or Broadway and Euclid and then walk 10-15 minutes across campus to the Engineering Center. Get bus directions using Google Maps or the Transit app.</p>
      <h2>Accommodations</h2>
      <p>
        <a href="http://www.boulderado.com/">Hotel Boulderado</a>.
        <a href="https://www.google.com/maps/place/2115+13th+St,+Boulder,+CO+80302/">2115 13th St, Boulder, CO 80302</a>.
        The Hotel Boulderado is historical, nice, and in an excellent location for restaurants and shops; it is about 1.5 miles or 20-30 minutes walking to the department.
      </p>
      <p>
        <a href="http://www.millenniumhotels.com/millenniumboulder/">Millennium Harvest House</a>.
        <a href="https://www.google.com/maps/place/1345+28th+St,+Boulder,+CO+80302/">1345 28th St, Boulder, CO 80302</a>.
        The Millennium Harvest is very convenient to the department (almost right next to it).
      </p>
      <p>
        <a href="http://www.briarrosebb.com/">Briar Rose Bed and Breakfast</a>.
        <a href="https://www.google.com/maps/place/2151+Arapahoe+Ave,+Boulder,+CO+80302/">2151 Arapahoe Ave, Boulder, CO 80302</a>.
        The Briar Rose is a bed and breakfast that is about halfway between downtown and the department.
      </p>
      <p>
        <a href="http://www.chautauqua.com/">Chautauqua</a>.
        <a href="https://www.google.com/maps/place/900+Baseline+Rd,+Boulder,+CO+80302/">900 Baseline Rd, Boulder, CO 80302</a>.
        Chautauqua is a set of cottages and lodges that are more rustic.  The draw is that the location is right on open space where a bunch of hiking trails start.  It is about 1.5 miles or 20-30 minutes walking to the department, though there is a significant hill.
      </p>
      <p>
        <a href="http://boulderinn.com/">Best Western Plus Boulder Inn</a>.
        <a href="https://www.google.com/maps/place/770+28th+St,+Boulder,+CO+80303/">770 28th St, Boulder, CO 80303</a>.
        The Best Western Plus Boulder Inn is a nice option that is 0.6 miles or 10-15 minute walk from the department, but there's not as much next to it (e.g., restaurants).
      </p>
      <p>
        <a href="http://www.marriott.com/hotels/travel/denbo-boulder-marriott/">Boulder Marriott</a>.
        <a href="https://www.google.com/maps/place/2660+Canyon+Boulevard,+Boulder,+CO+80302/">2660 Canyon Boulevard, Boulder, CO 80302</a>.
        The Boulder Marriott is 1.0 miles or 15-20 minutes walking to the department. There are some places to eat nearby, but the location is not as nice as downtown.
      </p>
      <p>The downtown area of Boulder is a really nice area with the Pearl Street pedestrian mall, lots of restaurants, farmer's market, etc.  And it's about a 5 minute drive/20 minute bus ride/30 minute walk from the department.  It's roughly centered around Pearl St and Broadway St.</p>
      <h2>Restaurants</h2>
      <p>
        Some of Evan's favorite restaurants.
      </p>
      <p><a href="http://www.yelp.com/biz/amu-boulder">Amu</a>. Non-sushi Japanese. A small, cozy restaurant with not many spaces: just a bar and a tea room. On the expensive side.</p>
      <p><a href="http://www.yelp.com/biz/pizzeria-locale-boulder-boulder">Pizzeria Locale</a>. Neopolitan-style pizza.</p>
      <h2>Maps</h2>
      <h3>Main Entrance Map</h3>
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6112.140711963!2d-105.26413!3d40.006876!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDDCsDAwJzI2LjIiTiAxMDXCsDE1JzUwLjEiVw!5e0!3m2!1sen!2sus!4v1430866423233" width="600" height="450" frameborder="0" style="border:0"></iframe>
      <h3>Main Entrance Street View</h3>
      <iframe src="https://www.google.com/maps/embed?pb=!1m0!3m2!1sen!2sus!4v1430866484694!6m8!1m7!1swi2PHKaJIisJCLHlVHnwBg!2m2!1d40.007172!2d-105.263931!3f87.69!4f-0.6700000000000017!5f0.7820865974627469" width="600" height="450" frameborder="0" style="border:0"></iframe>
      <h3>Permit Parking Map</h3>
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3056.0424210572814!2d-105.261!3d40.0075!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDDCsDAwJzI3LjAiTiAxMDXCsDE1JzM5LjYiVw!5e0!3m2!1sen!2sus!4v1430866954660" width="600" height="450" frameborder="0" style="border:0"></iframe>
      <h3>Permit Parking Street View</h3>
      <iframe src="https://www.google.com/maps/embed?pb=!1m0!3m2!1sen!2sus!4v1430866976858!6m8!1m7!1sGDBYKir-Owjz8Zq--Ss1QQ!2m2!1d40.007508!2d-105.261391!3f149.06!4f-22.099999999999994!5f0.7820865974627469" width="600" height="450" frameborder="0" style="border:0"></iframe>
      <h3>Hourly Parking Map</h3>
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3056.100618407019!2d-105.261!3d40.00619999999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDDCsDAwJzIyLjMiTiAxMDXCsDE1JzM5LjYiVw!5e0!3m2!1sen!2sus!4v1430866924202" width="600" height="450" frameborder="0" style="border:0"></iframe>
      <h3>Hourly Parking Street View</h3>
      <iframe src="https://www.google.com/maps/embed?pb=!1m0!3m2!1sen!2sus!4v1430867048730!6m8!1m7!1scdrbf-aIRNk4Db8ilYlsHg!2m2!1d40.00662!2d-105.261397!3f168.75!4f-12.420000000000002!5f0.7820865974627469" width="600" height="450" frameborder="0" style="border:0"></iframe>
    </content>
  </page>
</xsl:variable>

</xsl:stylesheet>
