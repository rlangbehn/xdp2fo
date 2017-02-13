<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: medium.xsl,v 1.6 2008/07/13 12:20:45 rlangbehn Exp $
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
 | Version: $Revision: 1.6 $ $Date: 2008/07/13 12:20:45 $
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
	<!-- medium element                                                    -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'portrait' orientation                                            -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:medium[not(@orientation) or @orientation='portrait']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>

		<!-- properties -->
		<xsl:apply-templates select="@imagingBBox|@stock|@trayIn|@trayOut" />
		<xsl:attribute name="page-height">
			<xsl:apply-templates select="@long" />
		</xsl:attribute>
		<xsl:attribute name="page-width">
			<xsl:apply-templates select="@short" />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:medium[not(@orientation) or @orientation='portrait']" mode="getPageHeight">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[2]/@mode" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="@long" />
	</xsl:template>
	
	<xsl:template match="xft:medium[not(@orientation) or @orientation='portrait']" mode="getPageWidth">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[3]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[3]/@mode" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="@short" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'landscape' orientation                                           -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:medium[@orientation='landscape']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[4]/@match" />
			</xsl:with-param>
		</xsl:call-template>

		<!-- properties -->
		<xsl:apply-templates select="@imagingBBox|@stock|@trayIn|@trayOut" />
		<xsl:attribute name="page-height">
			<xsl:apply-templates select="@short" />
		</xsl:attribute>
		<xsl:attribute name="page-width">
			<xsl:apply-templates select="@long" />
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:medium[@orientation='landscape']" mode="getPageHeight">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[5]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[5]/@mode" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="@short" />
	</xsl:template>
	
	<xsl:template match="xft:medium[@orientation='landscape']" mode="getPageWidth">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[6]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[6]/@mode" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="@long" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- medium properties                                                 -->
	<!-- ================================================================= -->
	<xsl:template match="xft:medium/@imagingBBox">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>

    <xsl:template match="xft:medium/@long">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
    </xsl:template>
	
	<xsl:template match="xft:medium/@orientation">
		<xsl:call-template name="log:trace" />
		<!-- Already handled by predicate -->
	</xsl:template>
	
	<xsl:template match="xft:medium/@short">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="xft:medium/@stock">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:medium/@trayIn">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xft:medium/@trayOut">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
</xsl:stylesheet>
