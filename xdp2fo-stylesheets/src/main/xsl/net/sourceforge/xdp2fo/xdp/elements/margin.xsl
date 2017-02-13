<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: margin.xsl,v 1.6 2008/07/10 08:07:10 rlangbehn Exp $
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
 | Version: $Revision: 1.6 $ $Date: 2008/07/10 08:07:10 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

	<xsl:attribute-set name="default-margin-properties">
	</xsl:attribute-set>
	
	<!-- ================================================================= -->
	<!-- margin element                                                    -->
	<!-- ================================================================= -->
	<xsl:template match="xft:margin">
		<xsl:call-template name="log:trace"/>
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates select="xft:extras"/>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- margin properties                                                 -->
	<!-- ================================================================= -->
	<xsl:template match="xft:margin/@bottomInset">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="margin-bottom">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:margin/@leftInset">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="margin-left">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:margin/@rightInset">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="margin-right">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:margin/@topInset">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="margin-top">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
		
</xsl:stylesheet>
