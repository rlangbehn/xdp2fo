<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: sourceset.xsl,v 1.2 2008/06/23 15:31:17 rlangbehn Exp $
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
 | Version: $Revision: 1.2 $ $Date: 2008/06/23 15:31:17 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xfss="http://www.xfa.org/schema/xfa-source-set/1.0/"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="xfss"
	version="1.0">

    <!-- ================================================================= -->
    <!-- sourceSet element                                                 -->
    <!-- ================================================================= -->
    <xsl:template match="xfss:sourceSet">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'"/>
        </xsl:call-template>
    </xsl:template>
	
</xsl:stylesheet>
