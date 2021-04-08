<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[1]"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="wrap-post">
			<div class="row no-gutters">
				<xsl:apply-templates select="News[1]"></xsl:apply-templates>
				<xsl:apply-templates select="News[position()&gt;1]" mode="News2"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-6 col-sm-12">
			<div class="box-wrap bg-gradient3">
				<h2 class="section-title white"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h2>
				<div class="desc">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="col-lg-6 col-sm-12">
			<div class="wrapper-img">
				<div class="img">
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
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="text-desc">
					<div class="img">
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</div>
					
					<a class="title">
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
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					<div class="desc">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
