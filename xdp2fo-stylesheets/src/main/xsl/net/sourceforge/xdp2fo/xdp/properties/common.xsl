<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: common.xsl,v 1.4 2008/07/09 17:13:18 rlangbehn Exp $
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
 | Version: $Revision: 1.4 $ $Date: 2008/07/09 17:13:18 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

	<xsl:attribute-set name="block">
	</xsl:attribute-set>
	
	<xsl:attribute-set name="block-container">
<!--	
		<xsl:attribute name="min-height">
			<xsl:text>0in</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="min-width">
			<xsl:text>0in</xsl:text>
		</xsl:attribute>
-->		
	</xsl:attribute-set>
	
	<!-- ================================================================= -->
	<!-- common properties                                                 -->
	<!-- ================================================================= -->
	<xsl:template match="@id">
		<xsl:call-template name="log:trace"/>
		<xsl:attribute name="id">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="@presence">
		<xsl:call-template name="log:trace"/>
		<xsl:choose>
			<xsl:when test=".='visible'">
				<xsl:attribute name="visibility">
					<xsl:text>visible</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test=".='invisible'">
				<xsl:attribute name="visibility">
					<xsl:text>hidden</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test=".='hidden'">
				<!--xsl:attribute name="display">
					<xsl:text>none</xsl:text>
				</xsl:attribute-->
			</xsl:when>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template match="@use">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="@usehref">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
</xsl:stylesheet>
