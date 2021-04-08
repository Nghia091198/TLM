<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsList">
		<div class="post-wrap">
			<div class="section-title2">
				<div class="img">
					<img src="/Data/Sites/1/media/bg-title.png" alt=""/>
				</div>
				<h1>
					<xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
				</h1>
			</div>
			<div class="row">
				<xsl:apply-templates select="News"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-4 col-md-6">
			<div class="box-item">
				<div class="img zoom-img">
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
				<div class="wrap-text">
					<h2>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						<a class="title">
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
					</h2>
					<div class="desc">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<a class="view-detail" href="#">
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
					<time><xsl:value-of select="CreatedDD" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedMM" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedYYYY" disable-output-escaping="yes"></xsl:value-of> </time>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
