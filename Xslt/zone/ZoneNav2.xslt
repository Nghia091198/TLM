<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[IsActive='true']/Zone[IsActive='true']"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="heading">
			<div class="title-center">
				<div class="section-title main backInDown text-center"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
			</div>
			<div class="sub-tab"> 
				<ul class="type-none">
					<xsl:apply-templates select="Zone" mode="ZoneChild"></xsl:apply-templates>
				</ul>
			</div>
		</div>

	</xsl:template>
	<xsl:template match="Zone" mode="ZoneChild">
		<li>
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>
