<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: para.xsl,v 1.5 2008/07/08 18:44:05 rlangbehn Exp $
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
 | Version: $Revision: 1.5 $ $Date: 2008/07/08 18:44:05 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

	<xsl:attribute-set name="default-para-properties">
<!--	
		<xsl:attribute name="display-align">
			<xsl:value-of select="'before'" />
		</xsl:attribute>
		<xsl:attribute name="text-align">
			<xsl:value-of select="'left'" />
		</xsl:attribute>
-->		
	</xsl:attribute-set>
	    
	<!-- ================================================================= -->
	<!-- para element                                                      -->
	<!-- ================================================================= -->
	<xsl:template match="xft:para">
		<xsl:call-template name="log:trace"/>
		<xsl:apply-templates select="@*"/>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- para properties                                                   -->
	<!-- ================================================================= -->
	<xsl:template match="xft:para/@hAlign">
		<xsl:attribute name="text-align">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@lineHeight">
		<xsl:attribute name="line-height">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@marginLeft">
		<xsl:attribute name="margin-left">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@marginRight">
		<xsl:attribute name="margin-right">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@preserve">
	</xsl:template>
	
	<xsl:template match="xft:para/@radixOffset">
	</xsl:template>
	
	<xsl:template match="xft:para/@spaceAbove">
		<xsl:attribute name="space-before">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@spaceBelow">
		<xsl:attribute name="space-after">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@tabDefault">
	</xsl:template>
	
	<xsl:template match="xft:para/@tabStops">
	</xsl:template>
	
	<xsl:template match="xft:para/@textIndent">
		<xsl:attribute name="text-indent">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:para/@vAlign">
		<xsl:attribute name="display-align">
			<xsl:choose>
				<xsl:when test=".='top'">
					<xsl:text>before</xsl:text>
				</xsl:when>
				<xsl:when test=".='middle'">
					<xsl:text>center</xsl:text>
				</xsl:when>
				<xsl:when test=".='bottom'">
					<xsl:text>after</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>

</xsl:stylesheet>
