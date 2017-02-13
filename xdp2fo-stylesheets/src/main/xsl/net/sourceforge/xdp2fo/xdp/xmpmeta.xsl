<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: xmpmeta.xsl,v 1.4 2008/07/15 10:28:51 rlangbehn Exp $
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
 | Version: $Revision: 1.4 $ $Date: 2008/07/15 10:28:51 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:x="adobe:ns:meta/"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="x"
	version="1.0">

    <!-- ================================================================= -->
    <!-- xmpmeta element                                                   -->
    <!-- ================================================================= -->
    <xsl:template match="x:xmpmeta">
		<xsl:call-template name="log:trace"/>
		<!-- Copy the current node -->
		<xsl:copy>
			<!-- Including any attributes it has and any child nodes -->
			<xsl:apply-templates select="@* | node()" mode="xmpmeta" />
		</xsl:copy>
	</xsl:template>

	<!-- Whenever you match any node or any attribute -->
	<xsl:template match="@* | node()" mode="xmpmeta">
		<!-- Copy the current node -->
		<xsl:copy>
			<!-- Including any attributes it has and any child nodes -->
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
