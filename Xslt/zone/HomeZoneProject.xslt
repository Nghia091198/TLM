<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>

	</xsl:template>
	<xsl:template match="Zone">
		<div class="container animation-right">
			<div class="wrap-title">
				<div class="section-title white"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
				<a class="seemore" href="">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					
					Xem tất cả
				</a>
			</div>
		</div>
		<div class="s4-left animation-left">
			<div class="index-3-slide">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="Zone" mode="ZoneChild"></xsl:apply-templates>
					</div>
				</div>
				<div class="wrap-button white">
					<div class="button-next"></div>
					<div class="button-prev"></div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="ZoneChild">
		<div class="swiper-slide">
			<div class="box-img">
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
			<div class="wrap-inner">
				<div class="wrap-left">
					<div class="sub-title white">
						<xsl:value-of select="SecondImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="title white">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
				<div class="wrap-right">
					<div class="des">
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<a class="seemore" href="">
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
	</xsl:template>
</xsl:stylesheet>
