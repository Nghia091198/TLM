<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[1]/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<div class="title-center"> 
			<div class="section-title"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
		</div>
		<div class="des">
			<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<div class="img"> 
			<img class="lazyload">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</div>
	</xsl:template>
</xsl:stylesheet>
