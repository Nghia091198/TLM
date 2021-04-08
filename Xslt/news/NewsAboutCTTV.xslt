<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[IsActive='true']"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="heading">
			<div class="title-center">
				<div class="section-title main backInDown text-center"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
			</div>
		</div>
		<div class="box-wrap">
			<xsl:apply-templates select="News"></xsl:apply-templates>
			
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="wrap-content">
			<div class="row">
				<div class="col-lg-6">
					<div class="box-img">
						<div class="img">
							<img class="lazyload">
								<xsl:attribute name="data-src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
							</img>
						</div>
						<div class="brief-content">
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="box-text">
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
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
						<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
