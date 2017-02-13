<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: pageArea.xsl,v 1.8 2008/07/13 12:20:45 rlangbehn Exp $
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
 | Version: $Revision: 1.8 $ $Date: 2008/07/13 12:20:45 $
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
	<!-- pageArea element                                                  -->
	<!-- ================================================================= -->
	<xsl:template match="xft:pageArea">
		<xsl:call-template name="log:trace" />

		<xsl:variable name="page-height">
			<xsl:apply-templates select="xft:medium" mode="getPageHeight" />
		</xsl:variable>

		<xsl:variable name="page-width">
			<xsl:apply-templates select="xft:medium" mode="getPageWidth" />
		</xsl:variable>

		<fo:simple-page-master>
			<!-- properties -->
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates select="xft:desc" />
			<xsl:apply-templates select="xft:extras" />
			<xsl:apply-templates select="xft:medium" />
			<!--xsl:apply-templates select="xft:occur" /-->
			<!-- children -->
			<!--xsl:apply-templates select="xft:area" mode="static-content" /-->
			<xsl:apply-templates select="xft:contentArea">
				<xsl:with-param name="page-height" select="$page-height" />
				<xsl:with-param name="page-width" select="$page-width" />
			</xsl:apply-templates>
			<!--xsl:apply-templates select="xft:draw" mode="static-content" /-->
			<!--xsl:apply-templates select="xft:exclGroup" mode="static-content" /-->
			<!--xsl:apply-templates select="xft:field" mode="static-content" /-->
			<!--xsl:apply-templates select="xft:subform" mode="static-content" /-->
		</fo:simple-page-master>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- pageArea properties                                               -->
	<!-- ================================================================= -->
	<xsl:template match="xft:pageArea/@blankOrNotBlank">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:pageArea/@initialNumber">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>

	<xsl:template match="xft:pageArea/@name">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="master-name">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="xft:pageArea/@numbered">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:pageArea/@oddOrEven">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:pageArea/@pagePosition">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:pageArea/@relevant">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
		
</xsl:stylesheet>
