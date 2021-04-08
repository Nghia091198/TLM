<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<section class="section du-an" setBackground="/Data/Sites/1/media/du-an/bg.jpg">
			<div class="container">
				<div class="wrap-container">
					<xsl:apply-templates select="Zone[IsActive='true']/Zone"></xsl:apply-templates>
					
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="wrap-box"> 
			<div class="wrap-left">
				<div class="img zoom-img"> 
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
			</div>
			<div class="wrap-right">
				<div class="wrap-content">
					<div class="section-title"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
					<div class="content">
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<xsl:if test="Url!='#'">

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
								<xsl:text disable-output-escaping="yes">Xem thêm</xsl:text>
							</a>
						</div>
					</xsl:if>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
