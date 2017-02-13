<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: edge.xsl,v 1.8 2008/07/08 16:09:24 rlangbehn Exp $
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
 | Version: $Revision: 1.8 $ $Date: 2008/07/08 16:09:24 $
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
	<!-- default edge properties                                           -->
	<!-- ================================================================= -->
	<xsl:attribute-set name="border">
		<xsl:attribute name="border">
			<xsl:text>0.5pt solid black</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-bottom">
		<xsl:attribute name="border-bottom">
			<xsl:text>0.5pt solid black</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-color">
		<xsl:attribute name="border-color">
			<xsl:text>black</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-left">
		<xsl:attribute name="border-left">
			<xsl:text>0.5pt solid black</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-right">
		<xsl:attribute name="border-right">
			<xsl:text>0.5pt solid black</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-style">
		<xsl:attribute name="border-style">
			<xsl:text>solid</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-top">
		<xsl:attribute name="border-top">
			<xsl:text>0.5pt solid black</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="border-width">
		<xsl:attribute name="border-width">
			<xsl:text>0.5pt</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ================================================================= -->
	<!-- edge element                                                      -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[1]">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(@presence='hidden')">
			<xsl:attribute name="border-top">
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates select="@*">
				<xsl:with-param name="edge-index" select="1" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:color/@*">
				<xsl:with-param name="edge-index" select="1" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:extras" />
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[2]">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(@presence='hidden')">
			<xsl:attribute name="border-right">
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates select="@*">
				<xsl:with-param name="edge-index" select="2" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:color/@*">
				<xsl:with-param name="edge-index" select="2" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:extras" />
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[3]">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(@presence='hidden')">
			<xsl:attribute name="border-bottom">
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates select="@*">
				<xsl:with-param name="edge-index" select="3" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:color/@*">
				<xsl:with-param name="edge-index" select="3" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:extras" />
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[4]">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(@presence='hidden')">
			<xsl:attribute name="border-left">
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates select="@*">
				<xsl:with-param name="edge-index" select="4" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:color/@*">
				<xsl:with-param name="edge-index" select="4" />
			</xsl:apply-templates>
			<xsl:apply-templates select="xft:extras" />
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[1]" mode="svg">
		<xsl:call-template name="log:trace" />
		<!-- properties -->
		<xsl:apply-templates select="@*" mode="svg">
			<xsl:with-param name="edge-index" select="1" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:color/@*" mode="svg">
			<xsl:with-param name="edge-index" select="1" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:extras" mode="svg" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[2]" mode="svg">
		<xsl:call-template name="log:trace" />
		<!-- properties -->
		<xsl:apply-templates select="@*" mode="svg">
			<xsl:with-param name="edge-index" select="2" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:color/@*" mode="svg">
			<xsl:with-param name="edge-index" select="2" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:extras" mode="svg" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[3]" mode="svg">
		<xsl:call-template name="log:trace" />
		<!-- properties -->
		<xsl:apply-templates select="@*" mode="svg">
			<xsl:with-param name="edge-index" select="3" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:color/@*" mode="svg">
			<xsl:with-param name="edge-index" select="3" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:extras" mode="svg" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:edge[4]" mode="svg">
		<xsl:call-template name="log:trace" />
		<!-- properties -->
		<xsl:apply-templates select="@*" mode="svg">
			<xsl:with-param name="edge-index" select="4" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:color/@*" mode="svg">
			<xsl:with-param name="edge-index" select="4" />
		</xsl:apply-templates>
		<xsl:apply-templates select="xft:extras" mode="svg" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- edge properties                                                   -->
	<!-- ================================================================= -->
	<xsl:template match="xft:edge/@cap">
		<xsl:param name="edge-index" />
		<xsl:call-template name="log:trace" />
	</xsl:template>

	<xsl:template match="xft:edge/@presence[.='invisible']">
		<xsl:param name="edge-index" />
		<xsl:call-template name="log:trace" />

		<xsl:choose>
			<xsl:when test="$edge-index = 1">
				<xsl:attribute name="border-top-color">
					<xsl:text>transparent</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 2">
				<xsl:attribute name="border-right-color">
					<xsl:text>transparent</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 3">
				<xsl:attribute name="border-bottom-color">
					<xsl:text>transparent</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 4">
				<xsl:attribute name="border-left-color">
					<xsl:text>transparent</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="log:warn">
					<xsl:with-param name="message">
						<xsl:text>Unable to identify edge element</xsl:text>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template match="xft:edge/@stroke">
		<xsl:param name="edge-index" />
		<xsl:call-template name="log:trace" />

		<xsl:choose>
			<xsl:when test="$edge-index = 1">
				<xsl:attribute name="border-top-style">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 2">
				<xsl:attribute name="border-right-style">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 3">
				<xsl:attribute name="border-bottom-style">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 4">
				<xsl:attribute name="border-left-style">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="log:warn">
					<xsl:with-param name="message">
						<xsl:text>Unable to identify edge element</xsl:text>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="xft:edge/@thickness">
		<xsl:param name="edge-index" />
		<xsl:call-template name="log:trace" />

		<xsl:choose>
			<xsl:when test="$edge-index = 1">
				<xsl:attribute name="border-top-width">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 2">
				<xsl:attribute name="border-right-width">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 3">
				<xsl:attribute name="border-bottom-width">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 4">
				<xsl:attribute name="border-left-width">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="log:warn">
					<xsl:with-param name="message">
						<xsl:text>Unable to identify edge element</xsl:text>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template match="xft:edge/xft:color/@value">
		<xsl:param name="edge-index" />
		<xsl:call-template name="log:trace" />

		<xsl:choose>
			<xsl:when test="$edge-index = 1">
				<xsl:attribute name="border-top-color">
					<xsl:value-of select="concat('rgb(', ., ')')" />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 2">
				<xsl:attribute name="border-right-color">
					<xsl:value-of select="concat('rgb(', ., ')')" />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 3">
				<xsl:attribute name="border-bottom-color">
					<xsl:value-of select="concat('rgb(', ., ')')" />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="$edge-index = 4">
				<xsl:attribute name="border-left-color">
					<xsl:value-of select="concat('rgb(', ., ')')" />
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="log:warn">
					<xsl:with-param name="message">
						<xsl:text>Unable to identify edge element</xsl:text>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
</xsl:stylesheet>
