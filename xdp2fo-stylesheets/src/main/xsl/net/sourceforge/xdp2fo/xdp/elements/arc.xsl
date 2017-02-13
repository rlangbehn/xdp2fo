<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: arc.xsl,v 1.8 2008/07/01 15:40:41 rlangbehn Exp $
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
 | Version: $Revision: 1.8 $ $Date: 2008/07/01 15:40:41 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

	<!-- ================================================================= -->
	<!-- arc element                                                       -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'ellipse' shape                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:arc[not(@circular) or @circular='0']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:variable name="w" select="../../@w" />
		<xsl:variable name="h" select="../../@h" />

		<xsl:variable name="cx">
			<!-- TODO -->
			<xsl:value-of select="'0'" />
		</xsl:variable>

		<xsl:variable name="cy">
			<!-- TODO -->
			<xsl:value-of select="'0'" />
		</xsl:variable>

		<xsl:variable name="rx">
			<!-- TODO -->
			<xsl:value-of select="'0'" />
		</xsl:variable>

		<xsl:variable name="ry">
			<!-- TODO -->
			<xsl:value-of select="'0'" />
		</xsl:variable>

		<fo:block>
			<fo:instream-foreign-object>
				<svg xmlns="http://www.w3.org/2000/svg" width="{$w}"
					height="{$h}">
					<ellipse cx="{$cx}" cy="{$cy}" rx="{$rx}" ry="{$ry}">
						<xsl:apply-templates select="xft:edge" mode="svg" />
						<xsl:apply-templates select="xft:fill" mode="svg" />
					</ellipse>
				</svg>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'circle' shape                                                    -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:arc[@circular='1']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="w" select="../../@w" />
		<xsl:variable name="h" select="../../@h" />

		<xsl:variable name="r">
			<xsl:variable name="w-unit"
				select="translate($w, '-0123456789.', '')" />
			<xsl:variable name="w-value"
				select="number(substring-before($w, $w-unit))" />

			<xsl:variable name="h-unit"
				select="translate($h, '-0123456789.', '')" />
			<xsl:variable name="h-value"
				select="number(substring-before($h, $h-unit))" />

			<xsl:choose>
				<xsl:when test="$w-value &lt; $h-value">
					<xsl:value-of select="concat($w-value div 2, $w-unit)" />
				</xsl:when>
				<xsl:when test="$h-value &lt; $w-value">
					<xsl:value-of select="concat($h-value div 2, $h-unit)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($w-value div 2, $w-unit)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="cx">
			<xsl:value-of select="$r" />
		</xsl:variable>

		<xsl:variable name="cy">
			<xsl:value-of select="$r" />
		</xsl:variable>

		<fo:block>
			<fo:instream-foreign-object>
				<svg xmlns="http://www.w3.org/2000/svg" width="{$w}"
					height="{$h}">
					<circle cx="{$cx}" cy="{$cy}" r="{$r}">
						<xsl:apply-templates select="xft:edge" mode="svg" />
						<xsl:apply-templates select="xft:fill" mode="svg" />
					</circle>
				</svg>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- arc properties                                                    -->
	<!-- ================================================================= -->
	<xsl:template match="xft:arc/@circular">
		<xsl:call-template name="log:trace"/>
		<!-- Already handled by predicate -->
	</xsl:template>
	
	<xsl:template match="xft:arc/@hand">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:arc/@startAngle">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:arc/@sweepAngle">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
</xsl:stylesheet>
