<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: text.xsl,v 1.5 2008/07/04 13:29:38 rlangbehn Exp $
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
 | Version: $Revision: 1.5 $ $Date: 2008/07/04 13:29:38 $
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
	<!-- text element                                                      -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:text">
		<xsl:call-template name="log:trace" />
		<fo:block linefeed-treatment="preserve" white-space-collapse="false"
			white-space-treatment="preserve">
			<!-- properties -->
			<xsl:apply-templates select="@*" />
			<xsl:element name="xsl:text">
				<xsl:apply-templates />
			</xsl:element>
		</fo:block>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:text" mode="text-only">
		<xsl:call-template name="log:trace" />
		<xsl:element name="xsl:text">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:variables/xft:text">
		<xsl:call-template name="log:trace" />
		<xsl:element name="xsl:variable">
			<xsl:attribute name="name">
				<xsl:value-of select="@name" />
			</xsl:attribute>
			<xsl:element name="xsl:text">
				<xsl:value-of select="." />
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- text properties                                                   -->
	<!-- ================================================================= -->
	<xsl:template match="xft:text/@maxChars">
		<xsl:call-template name="log:trace" />
		<!-- noop -->
	</xsl:template>
	
	<xsl:template match="xft:text/@rid">
		<xsl:call-template name="log:trace" />
		<!-- noop -->
	</xsl:template>
	
</xsl:stylesheet>