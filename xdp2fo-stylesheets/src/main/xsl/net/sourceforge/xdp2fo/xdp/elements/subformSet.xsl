<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: subformSet.xsl,v 1.7 2008/07/13 16:40:54 rlangbehn Exp $
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
 | Version: $Revision: 1.7 $ $Date: 2008/07/13 16:40:54 $
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
	<!-- subformSet element                                                -->
	<!-- ================================================================= -->
	<xsl:template match="xft:subformSet">
		<xsl:call-template name="log:trace"/>
		<xsl:call-template name="process-subformSet-properties"/>
		<xsl:call-template name="process-subformSet-children"/>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- subformSet properties                                             -->
	<!-- ================================================================= -->
	<xsl:template match="xft:subformSet/@name">
		<xsl:call-template name="log:trace" />
	</xsl:template>

	<xsl:template match="xft:subformSet/@relation">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="message" select="'TODO'" />
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:subformSet/@relevant">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!--                                                                   -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-subformSet-properties">
       	<xsl:apply-templates select="@*"/>
       	<xsl:apply-templates select="xft:bookend"/>
       	<xsl:apply-templates select="xft:break"/>
       	<xsl:apply-templates select="xft:desc"/>
       	<xsl:apply-templates select="xft:extras"/>
       	<xsl:apply-templates select="xft:occur"/>
       	<xsl:apply-templates select="xft:overflow"/>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-subformSet-children">
		<xsl:apply-templates
			select="*[not(
				self::xft:bookend or
				self::xft:break or
				self::xft:desc or
				self::xft:extras or
				self::xft:occur or
				self::xft:overflow
			)]" />
	</xsl:template>
	
</xsl:stylesheet>
