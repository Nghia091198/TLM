<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="container animation-top">
			<div class="box-wrap">
				<div class="row">
					<div class="col-xl-4 col-lg-12">
						<div class="wrap-left fadeInTopLeft">
							<div class="section-title green backInDown"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
							<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
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
					<div class="col-xl-8 col-lg-12"> 
						<div class="wrap-right fadeInTopRight">
							<xsl:apply-templates select="News"></xsl:apply-templates>
							
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
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
			<div class="wrap-inner"> 
				<div class="icon">
					<img>
						<xsl:attribute name="src">
							<!-- <xsl:value-of select="ImageUrl"></xsl:value-of> -->
							<xsl:value-of select="ThumbnailUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				<a class="content" href="">
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
		</div>
	</xsl:template>
</xsl:stylesheet>
