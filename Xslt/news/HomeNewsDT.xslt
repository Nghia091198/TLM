<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="bg-fake" setBackground="/Data/Sites/1/media/icon.png">
			<div class="wrap-partner animation-right">
				<div class="container"> 
					<div class="section-title"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
					<div class="swiper-partner"> 
						<div class="swiper-container"> 
							<div class="swiper-wrapper">
								<xsl:apply-templates select="News"></xsl:apply-templates>
								
							</div>
						</div>
						<div class="wrap-button"> 
							<div class="button-next"></div>
							<div class="button-prev"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="swiper-slide"> 
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<div class="item"> 
				<div class="img">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
			</div>
		</div>
		
	</xsl:template>
</xsl:stylesheet>
