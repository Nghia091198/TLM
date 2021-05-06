<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/NewsList">
		<section class="tlm-tailieu">
			<div class="container">
				<div class="main-table">
					<table>
						<thead>
							<tr>
								<th>STT</th>
								<th>Tên tài liệu</th>
								<th>Tải về</th>
							</tr>
						</thead>
						<tbody>
							<xsl:apply-templates select="News"></xsl:apply-templates>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News">
		<tr>
			<td>
				<xsl:if test="position()&lt;10">
					<xsl:text disable-output-escaping="yes">0</xsl:text>
				</xsl:if>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</td>
			<td>
				<a class=" ">
					<xsl:attribute name="href">
						<xsl:value-of select="FileUrl"></xsl:value-of>
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
			</td>
			<td>
				<a class=" " download="">
					<xsl:attribute name="href">
						<xsl:value-of select="FileUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<em class="mdi mdi-download"></em>
				</a>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
