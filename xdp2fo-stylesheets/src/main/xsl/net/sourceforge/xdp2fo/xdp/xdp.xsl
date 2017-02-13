<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: xdp.xsl,v 1.6 2008/07/15 10:28:51 rlangbehn Exp $
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
 | Version: $Revision: 1.6 $ $Date: 2008/07/15 10:28:51 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xdp="http://ns.adobe.com/xdp/"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:x="adobe:ns:meta/"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xdp xft"
    version="1.0">

    <!-- ================================================================= -->
    <!-- XDP packets                                                       -->
    <!-- ================================================================= -->
	<xsl:include href="config.xsl" />
	<xsl:include href="connectionset.xsl" />
	<xsl:include href="datasets.xsl" />
	<xsl:include href="localeset.xsl" />
	<xsl:include href="pdf.xsl" />
	<xsl:include href="sourceset.xsl" />
	<xsl:include href="template.xsl" />
	<xsl:include href="xdc.xsl" />
	<xsl:include href="xfdf.xsl" />
	<xsl:include href="xmpmeta.xsl" />

	<xsl:preserve-space elements="xft:text" />
	    
    <!-- ================================================================= -->
    <!-- xdp element                                                       -->
    <!-- ================================================================= -->
    <xsl:template match="xdp:xdp">
        <xsl:call-template name="log:trace" />
        <xsl:apply-templates select="@*" />

        <xsl:variable name="xmpmeta">
        	<xsl:apply-templates select="x:xmpmeta" />
        </xsl:variable>

        <xsl:apply-templates select="xft:template" />
    </xsl:template>
    
    <!-- ================================================================= -->
    <!-- xdp element properties                                            -->
    <!-- ================================================================= -->
    <xsl:template match="xdp:xdp/@uuid">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="xdp:xdp/@timeStamp">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
