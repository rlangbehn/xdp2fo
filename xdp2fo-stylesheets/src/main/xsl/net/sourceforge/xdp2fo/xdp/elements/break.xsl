<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: break.xsl,v 1.4 2008/06/25 16:13:44 rlangbehn Exp $
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
 | Version: $Revision: 1.4 $ $Date: 2008/06/25 16:13:44 $
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
	<!-- break element                                                     -->
	<!-- ================================================================= -->
	<xsl:template match="xft:break">
		<xsl:call-template name="log:trace"/>
		<xsl:call-template name="log:warn">
			<xsl:with-param name="message">
				<xsl:text>(DEPRECATED) As of XFA 2.4 this element has been deprecated.</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:apply-templates select="@*" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- break properties                                                  -->
	<!-- ================================================================= -->
	<xsl:template match="xft:break/@after">
		<xsl:attribute name="break-after">
			<xsl:choose>
				<xsl:when test=".='auto'">
					<xsl:text>auto</xsl:text>
				</xsl:when>
				<xsl:when test=".='contentArea'">
					<xsl:text>auto</xsl:text>
				</xsl:when>
				<xsl:when test=".='pageArea'">
					<xsl:text>page</xsl:text>
				</xsl:when>
				<xsl:when test=".='pageEven'">
					<xsl:text>even-page</xsl:text>
				</xsl:when>
				<xsl:when test=".='pageOdd'">
					<xsl:text>odd-page</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="log:warn">
						<xsl:with-param name="message">
							<xsl:text>Unable to identify break constraint</xsl:text>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="xft:break/@afterTarget">
	</xsl:template>
		
	<xsl:template match="xft:break/@before">
		<xsl:attribute name="break-before">
			<xsl:choose>
				<xsl:when test=".='auto'">
					<xsl:text>auto</xsl:text>
				</xsl:when>
				<xsl:when test=".='contentArea'">
					<xsl:text>auto</xsl:text>
				</xsl:when>
				<xsl:when test=".='pageArea'">
					<xsl:text>page</xsl:text>
				</xsl:when>
				<xsl:when test=".='pageEven'">
					<xsl:text>even-page</xsl:text>
				</xsl:when>
				<xsl:when test=".='pageOdd'">
					<xsl:text>odd-page</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="log:warn">
						<xsl:with-param name="message">
							<xsl:text>Unable to identify break constraint</xsl:text>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
		
	<xsl:template match="xft:break/@beforeTarget">
	</xsl:template>
		
	<xsl:template match="xft:break/@bookendLeader">
	</xsl:template>
		
	<xsl:template match="xft:break/@bookendTrailer">
	</xsl:template>
		
	<xsl:template match="xft:break/@overflowLeader">
	</xsl:template>
		
	<xsl:template match="xft:break/@overflowTarget">
	</xsl:template>
		
	<xsl:template match="xft:break/@overflowTrailer">
	</xsl:template>
		
	<xsl:template match="xft:break/@startNew">
	</xsl:template>
		
</xsl:stylesheet>
