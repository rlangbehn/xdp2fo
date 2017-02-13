<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: bind.xsl,v 1.3 2008/07/13 20:48:42 rlangbehn Exp $
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
 | Version: $Revision: 1.3 $ $Date: 2008/07/13 20:48:42 $
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
	<!-- bind element                                                      -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:bind[@match='once']">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:bind[@match='none']">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:bind[@match='global']">
		<xsl:call-template name="log:trace"/>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:bind[@match='dataRef']">
		<xsl:call-template name="log:trace"/>
<!--		
		<xsl:variable name="shortcut">
			<xsl:value-of select="substring-before(@ref, '.')"/>
		</xsl:variable>

		<xsl:variable name="path">
			<xsl:value-of select="substring-after(@ref, '.')"/>
		</xsl:variable>
		
		<xsl:variable name="fqname">
			<xsl:choose>
				<xsl:when test="$shortcut='$data'">
					<xsl:value-of select="concat('xfa.datasets.data.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$template'">
					<xsl:value-of select="concat('xfa.template.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$connectionSet'">
					<xsl:value-of select="concat('xfa.connectionSet.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$form'">
					<xsl:value-of select="concat('xfa.form.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$layout'">
					<xsl:value-of select="concat('xfa.layout.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$host'">
					<xsl:value-of select="concat('xfa.host.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$record'">
					<xsl:value-of select="concat('xfa.record.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='$event'">
					<xsl:value-of select="concat('xfa.event.', $path)"/>
				</xsl:when>
				<xsl:when test="$shortcut='!'">
					<xsl:value-of select="concat('xfa.datasets.', $path)"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
-->		
	</xsl:template>
	
</xsl:stylesheet>
