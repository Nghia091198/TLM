<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<ul>
			<xsl:apply-templates select="Zone"></xsl:apply-templates>
		</ul>
	</xsl:template>
	<xsl:template match="Zone">
		<li>
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="count(Zone)&gt;0">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">dropdown-menu</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="IsActive = 'true' and count(Zone)&gt;0">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">dropdown-menu active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<div class="title">
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
				<xsl:if test="count(Zone)&gt;0">
					<em class="ri-arrow-down-s-line"></em>
				</xsl:if>
			</div>
			<xsl:if test="count(Zone)&gt;0">
				<div class="dropdown">
					<xsl:apply-templates select="Zone" mode="ZoneChild"></xsl:apply-templates>
					
				</div>
			</xsl:if>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="ZoneChild">
		<div class="dropdown-item">
			<xsl:if test="IsActive = 'true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">dropdown-item active</xsl:text>
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
		</div>
	</xsl:template>
</xsl:stylesheet>
