<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: occur.xsl,v 1.3 2008/06/23 15:32:12 rlangbehn Exp $
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
 | Version: $Revision: 1.3 $ $Date: 2008/06/23 15:32:12 $
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
	<!-- occur element                                                     -->
	<!-- ================================================================= -->
	<xsl:template match="xft:pageArea/xft:occur">
		<xsl:call-template name="log:trace" />
		<!-- properties -->
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates select="xft:extras"/>
		
		<xsl:choose>
			<xsl:when test="not(@max)">
				<xsl:choose>
					<xsl:when test="not(@min)">
						<xsl:value-of select="'no-limit'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@min" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@max" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="xft:pageSet/xft:occur">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates select="xft:extras"/>
	</xsl:template>
	
	<xsl:template match="xft:proto/xft:occur">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates select="xft:extras"/>
	</xsl:template>
	
	<xsl:template match="xft:subform/xft:occur">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates select="xft:extras"/>
	</xsl:template>
	
	<xsl:template match="xft:subformSet/xft:occur">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates select="xft:extras"/>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- occur properties                                                  -->
	<!-- ================================================================= -->
	<xsl:template match="xft:occur/@initial">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:occur/@max">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:occur/@min">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
</xsl:stylesheet>
