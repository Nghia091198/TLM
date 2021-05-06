<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsDetail">
		<section class="tuyen-dung-ct" setBackground="/Data/Sites/1/media/tuyen-dung/bgtd.png">
			<div class="container">
				<div class="wrapper-box"> 
					<div class="row">
						<div class="col-lg-9 col-md-12">
							<div class="box-left-top">
								<div class="row no-gutters">
									<div class="col-lg-4 col-md-12">
										<div class="img">
											<xsl:apply-templates select="NewsImages[1]"></xsl:apply-templates>
											
										</div>
									</div>
									<div class="col-lg-8 col-md-12">
										<div class="wrap-content">
											<div class="heading">
												<div class="title"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
												<div class="fb">
													<a href="#">
														<xsl:attribute name="href">
															<xsl:text disable-output-escaping="yes">
																https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
															<xsl:value-of disable-output-escaping="yes" select="FullUrl">
															</xsl:value-of>
														</xsl:attribute>
														<i class="ri-facebook-box-fill"></i>
													</a>
												</div>
											</div>
											<div class="info">
												<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
											</div>
											<div class="wrap-option">
												<div class="btn btn-primary blue">
													<a href="javascript: ;">
														<xsl:attribute name="data-type">
															<xsl:text>iframe</xsl:text>
														</xsl:attribute>
														<xsl:attribute name="data-fancybox">
															<xsl:text>Form ứng tuyển</xsl:text>
														</xsl:attribute>
														<xsl:attribute name="data-src">
															<xsl:value-of select="ApplyUrl" disable-output-escaping="yes"/>
														</xsl:attribute>
														<xsl:attribute name="title">
															<xsl:value-of select="Title"></xsl:value-of>
														</xsl:attribute>
														<xsl:value-of select="Apply"></xsl:value-of>
														<xsl:text disable-output-escaping="yes">Ứng tuyển</xsl:text>
													</a>
												</div>
												
												<xsl:if test="FileUrl!=''">
													<div class="btn btn-primary green">
														<a href="" download="">
															<xsl:attribute name="href">
																<xsl:value-of select="FileUrl" disable-output-escaping="yes"></xsl:value-of>
															</xsl:attribute>
															Tải mẫu thông tin ứng viên
														</a>
													</div>
												</xsl:if>
											</div>
											<div class="form-apply">
												<iframe>
													<xsl:attribute name="src">
														<xsl:value-of select="ApplyUrl"></xsl:value-of>
													</xsl:attribute>
												</iframe>
											</div>
										</div>
									</div>
								</div>
							</div>
							<xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
						</div>
						<xsl:if test="count(NewsOther)&gt;0">
							<div class="col-lg-3">
								<div class="box-right">
									<div class="heading">
										<div class="title">Tuyển dụng khác</div>
									</div>
									<div class="box-content">
										<xsl:apply-templates select="NewsOther"></xsl:apply-templates>

						
									</div>
								</div>
							</div>
						</xsl:if>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="NewsImages">
		<img class="lazyload">
			<xsl:attribute name="data-src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		</img>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<div class="box-left-top">
			<div class="wrap-desc">
				<div class="heading">
					<div class="title"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
				</div>
				<div class="wrap-desc-content">
					<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsOther">
		<a class="box-list">
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
			<xsl:if test="SubTitle!=''">
				<div class="address">
					<em class="material-icons">fmd_good</em>
					<p><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></p>
				</div>
			</xsl:if>
			<xsl:if test="BriefContent!=''">
				<div class="number"><em class="material-icons">attach_money</em>
					<p><xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of></p>
				</div>
			</xsl:if>
		</a>
	</xsl:template>
</xsl:stylesheet>
