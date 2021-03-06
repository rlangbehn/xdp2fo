<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: font.xsl,v 1.9 2008/07/09 17:15:16 rlangbehn Exp $
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
 | Version: $Revision: 1.9 $ $Date: 2008/07/09 17:15:16 $
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
	<!-- default font properties                                           -->
	<!-- ================================================================= -->
	<xsl:attribute-set name="default-font-properties">
		<xsl:attribute name="font-size">
			<xsl:text>10pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="font-style">
			<xsl:text>normal</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="font-weight">
			<xsl:text>normal</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ================================================================= -->
	<!-- font element                                                      -->
	<!-- ================================================================= -->
	<xsl:template match="xft:font">
		<xsl:call-template name="log:trace" />
		<!-- properties -->
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:extras" />
		<xsl:apply-templates select="xft:fill" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- font properties                                                   -->
	<!-- ================================================================= -->
	<xsl:template match="xft:font/@baselineShift">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="baseline-shift">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@lineThrough">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="text-decoration">
			<xsl:choose>
				<xsl:when test=".='0'">
					<xsl:text>none</xsl:text>
				</xsl:when>
				<xsl:when test=".='1'">
					<xsl:text>line-through</xsl:text>
				</xsl:when>
				<xsl:when test=".='2'">
					<xsl:text>line-through</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@lineThroughPeriod">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:font/@overline">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="text-decoration">
			<xsl:choose>
				<xsl:when test=".='0'">
					<xsl:text>none</xsl:text>
				</xsl:when>
				<xsl:when test=".='1'">
					<xsl:text>overline</xsl:text>
				</xsl:when>
				<xsl:when test=".='2'">
					<xsl:text>overline</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@overlinePeriod">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:font/@posture">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="font-style">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@size">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="font-size">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@typeface">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="font-family">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@underline">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="text-decoration">
			<xsl:choose>
				<xsl:when test=".='0'">
					<xsl:text>none</xsl:text>
				</xsl:when>
				<xsl:when test=".='1'">
					<xsl:text>underline</xsl:text>
				</xsl:when>
				<xsl:when test=".='2'">
					<xsl:text>underline</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:font/@underlinePeriod">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:font/@weight">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="font-weight">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>

</xsl:stylesheet>
