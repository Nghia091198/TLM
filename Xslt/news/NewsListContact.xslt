<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<section class="lien-he" setBackground="/Data/Sites/1/media/home-2/bg.png">
			<div class="container-16">
				<div class="title-center">
					<div class="section-title main backInDown text-center"><xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of></div>
				</div>
				<div class="row">
					<div class="col-xl-4 col-lg-6">
						<div class="wrap-left">
							<div class="title"><xsl:value-of select="ModuleTitle" disable-output-escaping="yes"></xsl:value-of></div>
							<xsl:apply-templates select="News"></xsl:apply-templates>
						
						</div>
					</div>
					<div class="col-xl-8 col-lg-6">
						<xsl:apply-templates select="News[1]" mode="NewsMaps"></xsl:apply-templates>
						
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News">
		<div class="wrap-text-lh">
			<xsl:attribute name="data-iframe">
				<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active wrap-text-lh</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<div class="title-lh">
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="NewsMaps">
		<div class="wrap-right">
			<iframe width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0">
				<xsl:attribute name="src">
					<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
			</iframe>
		</div>
	</xsl:template>
</xsl:stylesheet>
