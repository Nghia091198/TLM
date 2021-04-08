<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[IsActive='true']/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<div class="title-center"> 
			<div class="section-title"><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></div>
		</div>
		<div class="catalog-app">
			<div id="viewer">
				<div id="flipbook" class="ui-flipbook">
					<!-- Do not place the content here -->
					<a ignore="1" class="ui-arrow-control ui-arrow-next-page"></a>
					<a ignore="1" class="ui-arrow-control ui-arrow-previous-page"></a>
				</div>
			</div>
	
			<!-- controls -->
			<div id="controls">
				<div class="all">
					<div class="ui-slider" id="page-slider">
						<div class="bar">
							<div class="progress-width">
								<div class="progress">
									<div class="handler"></div>
								</div>
							</div>
						</div>
					</div>
	
					<div class="ui-options" id="options">
						<a class="ui-icon" id="ui-icon-table-contents">
							<i class="fa fa-bars"></i>
						</a>
						<a class="ui-icon show-hint" title="Miniatures" id="ui-icon-miniature">
							<i class="fa fa-th"></i>
						</a>
						<a class="ui-icon" id="ui-icon-zoom">
							<i class="fa fa-file-o"></i>
						</a>
						<a class="ui-icon show-hint" title="Share" id="ui-icon-share">
							<i class="fa fa-share"></i>
						</a>
						<a class="ui-icon show-hint" title="Full Screen" id="ui-icon-full-screen">
							<i class="fa fa-expand"></i>
						</a>
						<a class="ui-icon show-hint" id="ui-icon-toggle">
							<i class="fa fa-ellipsis-v"></i>
						</a>
					</div>
	
					<!-- zoom slider -->
					<div id="zoom-slider-view" class="zoom-slider">
						<div class="bg">
							<div class="ui-slider" id="zoom-slider">
								<div class="bar">
									<div class="progress-width">
										<div class="progress">
											<div class="handler"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- / zoom slider -->
				</div>
	
				<div id="ui-icon-expand-options">
					<a class="ui-icon show-hint">
						<i class="fa fa-ellipsis-h"></i>
					</a>
				</div>
	
			</div>
			<!-- / controls -->
	
			<!-- miniatures -->
			<div id="miniatures" class="ui-miniatures-slider">
	
			</div>
		</div>
		<!-- <div class="ifame">
			<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
		</div> -->
		<!-- <div class="swiper-nang-luc">
			<div class="swiper-container"> 
				<div class="swiper-wrapper"> 
					<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
					
				</div>
			</div>
			<div class="wrap-button">
				<div class="button-next"></div>
				<div class="button-prev"></div>
			</div>
		</div> -->
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
