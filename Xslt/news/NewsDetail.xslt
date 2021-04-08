<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/NewsDetail">
		<section class="wrap-post-detail">
			<div class="container">
				<div class="post-content">
					<div class="heading-wrap">
						<h1 class="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<ul class="type-none">
							<li class="time">Ngày đăng :<span><xsl:value-of select="CreatedDD" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedMM" disable-output-escaping="yes"></xsl:value-of>.<xsl:value-of select="CreatedYYYY" disable-output-escaping="yes"></xsl:value-of></span></li>
							<li class="share"> 
								<p>Chia sẻ :</p>
								<!-- <div class="fb-share-button" >
									<xsl:attribute name="data-href">
										<xsl:value-of select="FullUrl" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="data-layout">
										<xsl:text disable-output-escaping="yes">button_count</xsl:text>
									</xsl:attribute>
								</div> -->
								<iframe width="86" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share">
									<xsl:attribute name="src">
										<xsl:text disable-output-escaping="yes">https://www.facebook.com/plugins/share_button.php?href=</xsl:text>
										<xsl:value-of select="FullUrl" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
								</iframe>
							</li>
						</ul>
					</div>
					<div class="wrap-content">
						<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
			</div>
			<xsl:if test="count(NewsOther)&gt;0">
				<div class="wrap-post-related">
					<div class="container">
						<div class="section-title2 white">
							<div class="img"><img src="/Data/Sites/1/media/bg-title-white.png" alt=""/></div>
							<h2>Tin tức khác</h2>
						</div>
						<div class="slider">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="NewsOther"></xsl:apply-templates>
								</div>
							</div>
							<div class="button-slider">
								<div class="button-prev">
									<div class="img"><img src="/Data/Sites/1/skins/default/img/icon-prev.png" alt=""/></div>
								</div>
								<div class="button-next">
									<div class="img"><img src="/Data/Sites/1/skins/default/img/icon-next.png" alt=""/></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:if>
		</section>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="swiper-slide">
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
					<h3>
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
					</h3>
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
