<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<xsl:apply-templates select="News[1]"></xsl:apply-templates>
		
		<xsl:if test="count(News)&gt;1">
			<section class="section duan-ct-2" setBackground="/Data/Sites/1/media/du-an/bg-3.jpg">
				<div class="container"> 
					<div class="title-center"> 
						<div class="section-title white">
							<xsl:text disable-output-escaping="yes">Hình ảnh về </xsl:text>
							<xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
					<div class="wrap-box">
						<xsl:apply-templates select="News[position()&gt;1]" mode="News2"></xsl:apply-templates>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News">
		<section class="section tong-quan-1 duan-ct">
			<xsl:attribute name="setBackground">
				<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="container">
				<div class="row"> 
					<div class="col-lg-6 col-md-12">
						<div class="wrap-left">
							<div class="wrap-top">
								<div class="section-title"><xsl:value-of select="/NewsList/ZoneTitle" disable-output-escaping="yes"></xsl:value-of></div>
							</div>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							<xsl:if test="SubTitle !=''">
								<div class="btn btn-primary"> 
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="SubTitle"></xsl:value-of>
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
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="item">
			<a class="img">
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="data-fancybox">
					<xsl:text disable-output-escaping="yes">gallery-</xsl:text>
					<xsl:value-of select="NewsId"></xsl:value-of>
				</xsl:attribute>
				<img >
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</a>
			<div class="inner">
				<div class="icon">
					<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<a class="title-small white" href="javascript:;">
					<!-- <xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute> -->
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</a>
			</div>
			<div class="hidden">
				<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages">
		<xsl:if test="position()&gt;1">
			<a class="img">
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="data-fancybox">
					<xsl:text disable-output-escaping="yes">gallery-</xsl:text>
					<xsl:value-of select="../NewsId"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</a>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
