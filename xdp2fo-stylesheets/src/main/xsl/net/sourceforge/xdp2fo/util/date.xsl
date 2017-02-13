<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: date.xsl,v 1.2 2008/07/06 19:55:08 rlangbehn Exp $
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
 | Version: $Revision: 1.2 $ $Date: 2008/07/06 19:55:08 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date"
	version="1.0">

	<xsl:import href="../../../../org/exslt/date/functions/date/date.date.template.xsl"/>
	<xsl:import href="../../../../org/exslt/date/functions/time/date.time.template.xsl"/>
	
    <!-- ================================================================= -->
    <!-- date                                                              -->
    <!-- ================================================================= -->
	<xsl:template name="date">
		<xsl:param name="date-time"/>
		<xsl:choose>
			<xsl:when test="function-available('date:date')">
				<xsl:value-of select="date:date($date-time)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="date:date">
					<xsl:with-param name="date-time" select="$date-time"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- date-time                                                         -->
    <!-- ================================================================= -->
	<xsl:template name="date-time">
        <xsl:choose>
            <xsl:when test="function-available('date:date-time')">
                <xsl:value-of select="date:date-time()"/>
            </xsl:when>
            <xsl:otherwise>
            	<xsl:text>Not Available</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- time                                                              -->
    <!-- ================================================================= -->
	<xsl:template name="time">
		<xsl:param name="date-time"/>
		<xsl:choose>
			<xsl:when test="function-available('date:time')">
				<xsl:value-of select="date:time($date-time)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="date:time">
					<xsl:with-param name="date-time" select="$date-time"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
