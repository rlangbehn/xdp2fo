<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: str.xsl,v 1.3 2008/07/06 19:55:08 rlangbehn Exp $
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
 | Version: $Revision: 1.3 $ $Date: 2008/07/06 19:55:08 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:str="http://exslt.org/strings"
	extension-element-prefixes="str"
	version="1.0">

	<xsl:import href="../../../../org/exslt/str/functions/split/str.split.template.xsl"/>
	
    <!-- ================================================================= -->
    <!-- split                                                             -->
    <!-- ================================================================= -->
    <xsl:template name="split">
    	<xsl:param name="string" select="''"/>
    	<xsl:param name="pattern" select="' '"/>
		<xsl:choose>
			<xsl:when test="function-available('str:split')">
				<xsl:apply-templates select="str:split($string, $pattern)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="str:split">
					<xsl:with-param name="string" select="$string"/>
					<xsl:with-param name="pattern" select="$pattern"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
	
</xsl:stylesheet>
