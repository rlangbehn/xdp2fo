<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: color.xsl,v 1.9 2008/07/14 13:48:12 rlangbehn Exp $
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
 | Version: $Revision: 1.9 $ $Date: 2008/07/14 13:48:12 $
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
	<!-- color element                                                     -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:color">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<!-- properties -->
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:extras" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:color" mode="svg">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match"/>
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[2]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<!-- properties -->
		<xsl:apply-templates select="@*" mode="svg" />
		<xsl:apply-templates select="xft:extras" mode="svg" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- color properties                                                  -->
	<!-- ================================================================= -->
	<xsl:template match="xft:color/@cSpace">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:corner/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
	<xsl:template match="xft:corner/xft:color/@value" mode="svg">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
<!--		
	<xsl:template match="xft:edge/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
-->		
	<xsl:template match="xft:edge/xft:color/@value" mode="svg">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
	<xsl:template match="xft:fill/xft:color/@value[ancestor::xft:font]">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="color">
			<xsl:value-of select="concat('rgb(', ., ')')"/>
		</xsl:attribute>
	</xsl:template>
		
	<xsl:template match="xft:fill/xft:color/@value[not(ancestor::xft:font)]">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="background-color">
			<xsl:value-of select="concat('rgb(', ., ')')"/>
		</xsl:attribute>
	</xsl:template>
		
	<xsl:template match="xft:fill/xft:color/@value" mode="svg">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="fill">
			<xsl:value-of select="concat('rgb(', ., ')')"/>
		</xsl:attribute>
	</xsl:template>
		
	<xsl:template match="xft:linear/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
	<xsl:template match="xft:pattern/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
	<xsl:template match="xft:proto/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
	<xsl:template match="xft:radial/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
	<xsl:template match="xft:stipple/xft:color/@value">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
</xsl:stylesheet>
