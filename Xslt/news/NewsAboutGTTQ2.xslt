<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		
		<section class="section tong-quan-1" setBackground="/Data/Sites/1/media/gioi-thieu/bg-2.png">
			<div class="container">
				<div class="row"> 
					<div class="col-lg-6 col-md-12">
						<div class="wrap-left">
							<xsl:apply-templates select="Zone[2]/News" mode="Zone2-News"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section tong-quan-2" setBackground="/Data/Sites/1/media/gioi-thieu/bg-3.png">
			<div class="container">
				<div class="title-center"> 
					<div class="section-title"><xsl:value-of select="Zone[3]/Title" disable-output-escaping="yes"></xsl:value-of></div>
				</div>
				<div class="box-timeline">
					<xsl:apply-templates select="Zone[3]/News" mode="Zone3-News"></xsl:apply-templates>
				</div>
			</div>
		</section>
		<xsl:apply-templates select="Zone[4]/News" mode="Zone4-News"></xsl:apply-templates>
		<xsl:apply-templates select="Zone[5]/News" mode="Zone5-News"></xsl:apply-templates>
		
		
	</xsl:template>
	<xsl:template match="News" mode="Zone2-News">
		<div class="wrap-top">
			<xsl:if test="position()=2">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">wrap-bottom</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<div class="section-title"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
			<div class="des">
				<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone3-News">
		<div class="item-timeline">
			<div class="wrap-content">
				<div class="title-lg"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
				<div class="des">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Zone4-News">
		<section class="section tong-quan-3" setBackground="/Data/Sites/1/media/gioi-thieu/bg-4.jpg">
			<div class="container">
				<div class="title-center"> 
					<div class="section-title"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
				</div>
				<div class="text-center img-tong-quan-3">
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
		</section>
	</xsl:template>
	<xsl:template match="News" mode="Zone5-News">
		<section class="section tong-quan-4" setBackground="/Data/Sites/1/media/gioi-thieu/bg-5.png" id="tong-quan-5">
			<div class="container">
				<div class="title-center"> 
					<div class="section-title white"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
				</div>
				<div class="des white text-center">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="swiper-tong-quan">
					<div class="swiper-container"> 
						<div class="swiper-wrapper"> 
							<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
							
						</div>
					</div>
					<div class="wrap-button white">
						<div class="button-next"></div>
						<div class="button-prev"></div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="NewsImages">
		<div class="swiper-slide">
			<div class="item"> 
				<a class="img" href="javascript:;"> 
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
		</div>
	</xsl:template>
</xsl:stylesheet>
