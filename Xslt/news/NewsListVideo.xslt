<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="thuvien-list">
			<div class="row">
				<xsl:apply-templates select="News[position()&gt;0 and position()&lt;4]"></xsl:apply-templates>
			</div>
			<div class="row">
				<xsl:apply-templates select="News[position()&gt;3]" mode="News2"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-4 box">
			<div class="box-wrap">
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				<a class="img" data-fancybox="">
					<xsl:attribute name="href">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
				<div class="info"> 
					<a>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="data-fancybox">
						<xsl:text disable-output-escaping="yes">gallery-</xsl:text>
						<xsl:value-of select="NewsId"></xsl:value-of>
					</xsl:attribute>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="col-lg-6 box">
			<div class="box-wrap">
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				<a class="img" data-fancybox="">
					<xsl:attribute name="href">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
				<div class="info"> 
					<a href="">
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="data-fancybox">
						<xsl:text disable-output-escaping="yes">gallery-</xsl:text>
						<xsl:value-of select="NewsId"></xsl:value-of>
					</xsl:attribute>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
