<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: image.xsl,v 1.7 2008/07/07 14:51:17 rlangbehn Exp $
 |
 | This file is part of the XSL XDP Stylesheet distribution xdp2fo.
 | See ../../../README.txt or http://xdp2fo.sourceforge.net/ for
 | copyright and other information.
 |
 | Copyright (c) 2007 The XDP To XSL-FO Development Team.
 | Also see acknowledgements in README.txt.
 |
 | xdp2fo is free software; you can redistribute it and/or modify
 | it under the terms of the GNU Lesser General Public License as
 | published by the Free Software Foundation; either version 3 of
 | the License, or (at your option) any later version.
 |
 | xdp2fo is distributed in the hope that it will be useful,
 | but WITHOUT ANY WARRANTY; without even the implied warranty of
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 | GNU Lesser General Public License for more details.
 |
 | You should have received a copy of the GNU Lesser General Public License
 | along with this program.  If not, see <http://www.gnu.org/licenses/>.
 |
 | Version: $Revision: 1.7 $ $Date: 2008/07/07 14:51:17 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">
	
	<xsl:attribute-set name="default-image-properties">
		<xsl:attribute name="content-height">
			<xsl:text>scale-to-fit</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="content-width">
			<xsl:text>scale-to-fit</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ================================================================= -->
	<!-- image element                                                     -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:image[@href]">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="w" select="../../@w" />
		<xsl:variable name="h" select="../../@h" />

		<fo:block>
			<fo:external-graphic xsl:use-attribute-sets="default-image-properties">
				<xsl:apply-templates select="@aspect" />
				<xsl:attribute name="height">
					<xsl:value-of select="$h"/>
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="$w"/>
				</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:text>url('</xsl:text>
					<xsl:apply-templates select="@href" />
					<xsl:text>')</xsl:text>
				</xsl:attribute>
			</fo:external-graphic>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:image[not(@href)]">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="w" select="../../@w" />
		<xsl:variable name="h" select="../../@h" />

		<fo:block>
			<fo:external-graphic xsl:use-attribute-sets="default-image-properties">
				<xsl:apply-templates select="@aspect" />
				<xsl:attribute name="height">
					<xsl:value-of select="$h"/>
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="$w"/>
				</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:text>url('data:</xsl:text>
					<xsl:apply-templates select="@contentType" />
					<xsl:text>;base64,</xsl:text>
					<xsl:value-of select="." />
					<xsl:text>')</xsl:text>
				</xsl:attribute>
			</fo:external-graphic>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:variables/xft:image">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[3]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:element name="xsl:variable">
			<xsl:attribute name="name">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<xsl:attribute name="select">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- image properties                                                  -->
	<!-- ================================================================= -->
	<xsl:template match="xft:image/@aspect">
		<xsl:call-template name="log:trace"/>
		<xsl:choose>
			<xsl:when test=".='fit'">
				<xsl:attribute name="content-height">
					<xsl:text>scale-to-fit</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="content-width">
					<xsl:text>scale-to-fit</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test=".='none'">
				<xsl:attribute name="content-height">
					<xsl:text>auto</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="content-width">
					<xsl:text>auto</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test=".='actual'">
				<xsl:attribute name="content-height">
					<xsl:text>auto</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="content-width">
					<xsl:text>auto</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test=".='width'">
				<xsl:attribute name="content-width">
					<xsl:text>auto</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test=".='height'">
				<xsl:attribute name="content-height">
					<xsl:text>auto</xsl:text>
				</xsl:attribute>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="xft:image/@contentType">
		<xsl:call-template name="log:trace" />
		<xsl:choose>
			<xsl:when test=".='image/tif'">
				<xsl:text>image/tiff</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="." />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="xft:image/@href">
		<xsl:call-template name="log:trace"/>
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="xft:image/@name">
		<xsl:call-template name="log:trace"/>
		<!-- noop -->
	</xsl:template>
	
	<xsl:template match="xft:image/@transferEncoding">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
</xsl:stylesheet>
