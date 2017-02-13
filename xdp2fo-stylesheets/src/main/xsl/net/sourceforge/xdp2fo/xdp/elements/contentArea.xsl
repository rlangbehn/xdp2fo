<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: contentArea.xsl,v 1.8 2008/07/15 11:39:51 rlangbehn Exp $
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
 | Version: $Revision: 1.8 $ $Date: 2008/07/15 11:39:51 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

    <xsl:import href="../../util/utils.xsl"/>

	<!-- ================================================================= -->
	<!-- default region-body properties                                    -->
	<!-- ================================================================= -->
	<xsl:attribute-set name="region-body">
		<xsl:attribute name="region-name">
			<xsl:text>xsl-region-body</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- ================================================================= -->
	<!-- contentArea element                                               -->
	<!-- ================================================================= -->
	<xsl:template match="xft:contentArea">
		<xsl:param name="page-height" select="'0'" />
		<xsl:param name="page-width" select="'0'" />
		<xsl:call-template name="log:trace" />

		<xsl:variable name="page-height-value">
			<xsl:call-template name="convertMeasurement">
				<xsl:with-param name="measurement" select="$page-height" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="page-width-value">
			<xsl:call-template name="convertMeasurement">
				<xsl:with-param name="measurement" select="$page-width" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="region-body-height-value">
			<xsl:call-template name="convertMeasurement">
				<xsl:with-param name="measurement">
					<xsl:apply-templates select="@h" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="region-body-width-value">
			<xsl:call-template name="convertMeasurement">
				<xsl:with-param name="measurement">
					<xsl:apply-templates select="@w" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="margin-left-value">
			<xsl:call-template name="convertMeasurement">
				<xsl:with-param name="measurement">
					<xsl:apply-templates select="@x" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="margin-top-value">
			<xsl:call-template name="convertMeasurement">
				<xsl:with-param name="measurement">
					<xsl:apply-templates select="@y" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="margin-right-value">
			<xsl:value-of
				select="$page-width-value - $margin-left-value - $region-body-width-value" />
		</xsl:variable>

		<xsl:variable name="margin-bottom-value">
			<xsl:value-of
				select="$page-height-value - $margin-top-value - $region-body-height-value" />
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$xdp2fo.drawing-aids.showGrid='true'">
				<fo:region-body xsl:use-attribute-sets="region-body grid"
					margin-left="{concat($margin-left-value, $xdp2fo.measurement.unit)}"
					margin-top="{concat($margin-top-value, $xdp2fo.measurement.unit)}"
					margin-right="{concat($margin-right-value, $xdp2fo.measurement.unit)}"
					margin-bottom="{concat($margin-bottom-value, $xdp2fo.measurement.unit)}">
					<xsl:apply-templates select="@name"/>
				</fo:region-body>
			</xsl:when>
			<xsl:otherwise>
				<fo:region-body xsl:use-attribute-sets="region-body"
					margin-left="{concat($margin-left-value, $xdp2fo.measurement.unit)}"
					margin-top="{concat($margin-top-value, $xdp2fo.measurement.unit)}"
					margin-right="{concat($margin-right-value, $xdp2fo.measurement.unit)}"
					margin-bottom="{concat($margin-bottom-value, $xdp2fo.measurement.unit)}">
					<xsl:apply-templates select="@name"/>
				</fo:region-body>
			</xsl:otherwise>
		</xsl:choose>

		<fo:region-before
			extent="{concat($margin-top-value, $xdp2fo.measurement.unit)}" />
		<fo:region-after
			extent="{concat($margin-bottom-value, $xdp2fo.measurement.unit)}" />
		<fo:region-start
			extent="{concat($margin-left-value, $xdp2fo.measurement.unit)}" />
		<fo:region-end
			extent="{concat($margin-right-value, $xdp2fo.measurement.unit)}" />
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- contentArea element properties                                    -->
	<!-- ================================================================= -->
	<xsl:template match="xft:contentArea/@h">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="xft:contentArea/@name">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="region-name">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="xft:contentArea/@relevant">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:contentArea/@w">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="xft:contentArea/@x">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="xft:contentArea/@y">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
	</xsl:template>
	
</xsl:stylesheet>
