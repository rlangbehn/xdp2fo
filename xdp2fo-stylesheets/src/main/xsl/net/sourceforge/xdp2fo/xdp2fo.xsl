<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: xdp2fo.xsl,v 1.9 2008/07/11 08:23:40 rlangbehn Exp $
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
 | Version: $Revision: 1.9 $ $Date: 2008/07/11 08:23:40 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:log="http://xdp2fo.sourceforge.net/logging"
    exclude-result-prefixes="log"
    version="1.0">

    <!-- ================================================================= -->
    <!-- imports                                                           -->
    <!-- ================================================================= -->
    <xsl:import href="util/date.xsl"/>
    
    <!-- ================================================================= -->
    <!-- includes                                                          -->
    <!-- ================================================================= -->
    <xsl:include href="util/logging.xsl"/>
    <xsl:include href="xdp/xdp.xsl"/>

    <!-- ================================================================= -->
    <!-- output properties                                                 -->
    <!-- ================================================================= -->
    <xsl:output method="xml" indent="no"/>

    <!-- ================================================================= -->
    <!-- params                                                            -->
    <!-- ================================================================= -->
    <xsl:param name="xdp2fo.version" select="'not available'"/>

    <!-- ================================================================= -->
    <!-- MAIN ROOT TRANSFORM                                               -->
    <!-- ================================================================= -->
	<xsl:template match="/">
		<xsl:call-template name="createStartMessage" />
		<xsl:call-template name="createFileComment" />
		<xsl:call-template name="createStylesheetElement" />
	</xsl:template>

    <!-- ================================================================= -->
    <!-- createFileComment                                                 -->
    <!-- ================================================================= -->
    <xsl:template name="createFileComment">
        <xsl:text>&#xA;</xsl:text>
        <xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> | This file was generated by the XDP To XSL-FO (XDP2FO) stylesheet distribution, </xsl:text>
            <xsl:value-of select="concat('version ', $xdp2fo.version, '.')"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> | See &lt;a href="http://xdp2fo.sourceforge.net"&gt;http://xdp2fo.sourceforge.net&lt;/a&gt; for details.</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> | Any modifications to this file will be lost upon transformation of the source file.</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> | Generated on: </xsl:text>
            <xsl:call-template name="date-time"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> |</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> | XSLT processor implementation used:</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> |   - XSLT Version = </xsl:text>
            <xsl:copy-of select="system-property('xsl:version')"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> |   - XSLT Vendor = </xsl:text>            
            <xsl:copy-of select="system-property('xsl:vendor')"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> |   - XSLT Vendor URL = </xsl:text>
            <xsl:copy-of select="system-property('xsl:vendor-url')"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text> +</xsl:text>
        </xsl:comment>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

    <!-- ================================================================= -->
    <!-- createParamElements                                               -->
    <!-- ================================================================= -->
	<xsl:template name="createParamElements">
		<xsl:element name="xsl:param">
			<xsl:attribute name="name">
           		<xsl:text>xdp2fo.formatter.type</xsl:text>
           	</xsl:attribute>
			<xsl:attribute name="select">
           		<xsl:text>''</xsl:text>
           	</xsl:attribute>
		</xsl:element>
		<xsl:element name="xsl:param">
			<xsl:attribute name="name">
           		<xsl:text>xdp2fo.formatter.vendor-name</xsl:text>
           	</xsl:attribute>
			<xsl:attribute name="select">
           		<xsl:text>''</xsl:text>
           	</xsl:attribute>
		</xsl:element>
		<xsl:element name="xsl:param">
			<xsl:attribute name="name">
           		<xsl:text>xdp2fo.formatter.vendor-url</xsl:text>
           	</xsl:attribute>
			<xsl:attribute name="select">
           		<xsl:text>''</xsl:text>
           	</xsl:attribute>
		</xsl:element>
		<xsl:element name="xsl:param">
			<xsl:attribute name="name">
           		<xsl:text>xdp2fo.formatter.version</xsl:text>
           	</xsl:attribute>
			<xsl:attribute name="select">
           		<xsl:text>''</xsl:text>
           	</xsl:attribute>
		</xsl:element>
	</xsl:template>

    <!-- ================================================================= -->
    <!-- createStartMessage                                                -->
    <!-- ================================================================= -->
	<xsl:template name="createStartMessage">
		<xsl:call-template name="log:debug">
			<xsl:with-param name="message">
				<xsl:text>XSLT processor implementation used:</xsl:text>
				<xsl:text>&#xA;</xsl:text>
				<xsl:text>   XSLT Version = </xsl:text>
				<xsl:copy-of select="system-property('xsl:version')" />
				<xsl:text>&#xA;</xsl:text>
				<xsl:text>   XSLT Vendor = </xsl:text>
				<xsl:copy-of select="system-property('xsl:vendor')" />
				<xsl:text>&#xA;</xsl:text>
				<xsl:text>   XSLT Vendor URL = </xsl:text>
				<xsl:copy-of select="system-property('xsl:vendor-url')" />
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

    <!-- ================================================================= -->
    <!-- createStylesheetElement                                           -->
    <!-- ================================================================= -->
	<xsl:template name="createStylesheetElement">
		<xsl:element name="xsl:stylesheet">
			<xsl:attribute name="version">
                <xsl:text>1.0</xsl:text>
            </xsl:attribute>

			<xsl:call-template name="createParamElements"/>            
            
			<xsl:element name="xsl:template">
				<xsl:attribute name="match">
                    <xsl:text>/*</xsl:text>
                </xsl:attribute>
				<xsl:apply-templates />
			</xsl:element>
		</xsl:element>
	</xsl:template>
			
</xsl:stylesheet>