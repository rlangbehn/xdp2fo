<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: xhtml.xsl,v 1.1 2008/07/07 21:58:16 rlangbehn Exp $
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
 | Version: $Revision: 1.1 $ $Date: 2008/07/07 21:58:16 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log html"
	version="1.0">

	<xsl:attribute-set name="b">
		<xsl:attribute name="font-weight">bolder</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="i">
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="sub">
		<xsl:attribute name="baseline-shift">sub</xsl:attribute>
		<xsl:attribute name="font-size">smaller</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="sup">
		<xsl:attribute name="baseline-shift">super</xsl:attribute>
		<xsl:attribute name="font-size">smaller</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- ================================================================= -->
	<!-- html element                                                      -->
	<!-- ================================================================= -->
	<xsl:template match="html:html">
		<xsl:apply-templates/>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- body element                                                      -->
	<!-- ================================================================= -->
	<xsl:template match="html:body">
		<xsl:apply-templates/>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- p element                                                         -->
	<!-- ================================================================= -->
	<xsl:template match="html:p">
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- b element                                                         -->
	<!-- ================================================================= -->
	<xsl:template match="html:b">
		<fo:inline xsl:use-attribute-sets="b">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- i element                                                         -->
	<!-- ================================================================= -->
	<xsl:template match="html:i">
		<fo:inline xsl:use-attribute-sets="i">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- br element                                                        -->
	<!-- ================================================================= -->
	<xsl:template match="html:br">
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- span element                                                      -->
	<!-- ================================================================= -->
	<xsl:template match="html:span">
		<fo:inline>
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- sub element                                                       -->
	<!-- ================================================================= -->
	<xsl:template match="html:sub">
		<fo:inline xsl:use-attribute-sets="sub">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- sup element                                                       -->
	<!-- ================================================================= -->
	<xsl:template match="html:sup">
		<fo:inline xsl:use-attribute-sets="sup">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
</xsl:stylesheet>
