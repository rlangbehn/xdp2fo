<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: ui.xsl,v 1.3 2008/06/24 23:04:17 rlangbehn Exp $
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
 | Version: $Revision: 1.3 $ $Date: 2008/06/24 23:04:17 $
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
	<!-- ui element                                                        -->
	<!-- ================================================================= -->
	<xsl:template match="xft:ui">
		<xsl:call-template name="log:trace"/>
		<!-- properties -->
		<xsl:apply-templates select="xft:extras"/>
		<xsl:apply-templates select="xft:picture"/>
		<!-- one-of properties -->
		<xsl:apply-templates select="xft:barcode"/>
		<xsl:apply-templates select="xft:button"/>
		<xsl:apply-templates select="xft:checkButton"/>
		<xsl:apply-templates select="xft:choiceList"/>
		<xsl:apply-templates select="xft:dateTimeEdit"/>
		<xsl:apply-templates select="xft:defaultUI"/>
		<xsl:apply-templates select="xft:imageEdit"/>
		<xsl:apply-templates select="xft:numericEdit"/>
		<xsl:apply-templates select="xft:passwordEdit"/>
		<xsl:apply-templates select="xft:signature"/>
		<xsl:apply-templates select="xft:textEdit"/>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- ui properties                                                     -->
	<!-- ================================================================= -->
	
</xsl:stylesheet>
