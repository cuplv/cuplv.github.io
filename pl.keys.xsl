<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="person" match="person" use="@id" />
<xsl:key name="event" match="event" use="@id" />
<xsl:key name="pub" match="pub" use="@id" />

</xsl:stylesheet>
