<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: corner.xsl,v 1.4 2008/07/03 09:13:31 rlangbehn Exp $
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
 | Version: $Revision: 1.4 $ $Date: 2008/07/03 09:13:31 $
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
	<!-- corner element                                                    -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:corner">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:color" />
		<xsl:apply-templates select="xft:extras" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:corner" mode="svg">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:color" mode="svg" />
		<xsl:apply-templates select="xft:extras" mode="svg" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- corner properties                                                 -->
	<!-- ================================================================= -->
	<xsl:template match="xft:corner/@inverted">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:corner/@join">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:corner/@radius">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:corner/@stroke">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<xsl:template match="xft:corner/@thickness">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
		
</xsl:stylesheet>
