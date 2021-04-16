<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[2]"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<section class="tuyeng-dung-2" setBackground="/Data/Sites/1/media/tuyen-dung/tdbn2.png">
			<div class="container">
				<div class="title-center">
					<div class="section-title main backInDown text-center"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
				</div>
				<div class="box-wrap">
					<div class="row">
						<!-- <xsl:value-of select="count(News)" disable-output-escaping="yes"></xsl:value-of> -->
						<xsl:apply-templates select="News"></xsl:apply-templates>
						
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-lg-6">
			<a class="box-content">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
				<p class="title">
					
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</p>
				<ul class="info">
					<xsl:if test="SubTitle!=''">
						<li>
							<div class="item">
								<em class="material-icons">fmd_good</em>
								<p><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></p>
							</div>
						</li>
					</xsl:if>
					<xsl:if test="EndDate!=''">
						<li>
							<div class="item"><em class="material-icons">event_available</em>
								<p><xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of></p>
							</div>
						</li>
					</xsl:if>
					<xsl:if test="BriefContent!=''">
						<li>
							<div class="item green"><em class="material-icons">attach_money</em>
								<p><xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of></p>
							</div>
						</li>
					</xsl:if>
				</ul>
				<div class="view-more">
					<xsl:text disable-output-escaping="yes">Xem Thêm</xsl:text>
				</div>
			</a>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>
</xsl:stylesheet>
