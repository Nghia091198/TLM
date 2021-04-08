<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<xsl:apply-templates select="News"></xsl:apply-templates>
			
	</xsl:template>
	<xsl:template match="News">
		<div class="container animation-bottom">
			<div class="wrap-box">
				<div class="wrap-left">
					<div class="img">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="section-title backInDown no-icon">
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="des fadeInTopLeft">
						<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="btn btn-primary">
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
							Xem thêm 
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="wrap-right backInUp">
			<a class="img" data-fancybox="video-1">
				<xsl:attribute name="href">
					<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
				<div class="btn-play"></div>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
