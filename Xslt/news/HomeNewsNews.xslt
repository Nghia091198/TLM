<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="container animation-right">
			<div class="title-center">
				<div class="section-title main backInDown text-center"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
			</div>
			<div class="swiper-news backInDown">
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
			<div class="btn btn-primary mx-auto">
				<a class=" ">
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
	</xsl:template>
	<xsl:template match="News">
		<div class="swiper-slide"> 
			<div class="item">	
				<a class="img" href="">
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
				<div class="box-content">
					<a class="title sm" href="">
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
					<div class="inner-date">
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
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
