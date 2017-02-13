<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: pageSet.xsl,v 1.8 2008/07/13 12:20:45 rlangbehn Exp $
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
 | Version: $Revision: 1.8 $ $Date: 2008/07/13 12:20:45 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

	<xsl:attribute-set name="page-sequence-master">
		<xsl:attribute name="master-name">
			<xsl:text>MasterPages</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- ================================================================= -->
	<!-- pageSet element                                                   -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:pageSet[not(@relation) or @relation='orderedOccurrence']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:layout-master-set>
			<xsl:apply-templates select="xft:pageArea" />
			<xsl:apply-templates select="xft:pageSet" />
			
			<fo:page-sequence-master xsl:use-attribute-sets="page-sequence-master">
				<xsl:apply-templates select="@*" />
				<xsl:apply-templates select="xft:extras" />
				
				<!-- TODO this assumption is only correct for the E-Ticket.xdp sample -->
				<fo:single-page-master-reference
					master-reference="{xft:pageArea[1]/@name}" />

				<!-- TODO also respect subformSet elements for paging -->					
				<xsl:for-each select="/descendant::xft:subform[xft:break/@before='pageArea']">
					<!-- TODO respect the occur element if any -->
					<fo:single-page-master-reference>
						<!-- TODO respect the breakBefore element; the break element is deprecated -->
						<!-- TODO same for brekAfter element -->
						<xsl:variable name="oid">
							<xsl:value-of select="substring-after(xft:break/@beforeTarget, '#')" />
						</xsl:variable>
						<xsl:attribute name="master-reference">
							<xsl:value-of select="/descendant::xft:pageArea[@id=$oid]/@name" />
						</xsl:attribute>
					</fo:single-page-master-reference>
				</xsl:for-each>
			</fo:page-sequence-master>
		</fo:layout-master-set>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:pageSet[@relation='simplexPaginated']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:layout-master-set>
			<xsl:apply-templates select="xft:pageArea" />
			<xsl:apply-templates select="xft:pageSet" />

			<fo:page-sequence-master xsl:use-attribute-sets="page-sequence-master">
				<xsl:apply-templates select="@*" />
				<xsl:apply-templates select="xft:extras" />
				
				<xsl:for-each select="xft:pageArea">
					<xsl:variable name="maximum-repeats">
						<xsl:apply-templates select="xft:occur" />
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$maximum-repeats=''">
							<fo:repeatable-page-master-reference
								master-reference="{@name}" />
						</xsl:when>
						<xsl:when test="$maximum-repeats='no-limit'">
							<fo:repeatable-page-master-reference
								master-reference="{@name}" />
						</xsl:when>
						<xsl:otherwise>
							<fo:repeatable-page-master-reference
								master-reference="{@name}" maximum-repeats="{$maximum-repeats}" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</fo:page-sequence-master>
		</fo:layout-master-set>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:pageSet[@relation='duplexPaginated']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[3]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:layout-master-set>
			<xsl:apply-templates select="xft:pageArea" />
			<xsl:apply-templates select="xft:pageSet" />

			<fo:page-sequence-master xsl:use-attribute-sets="page-sequence-master">
				<xsl:apply-templates select="@*" />
				<xsl:apply-templates select="xft:extras" />
				
				<xsl:for-each select="xft:pageArea">
					<xsl:variable name="maximum-repeats">
						<xsl:apply-templates select="xft:occur" />
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$maximum-repeats=''">
							<fo:repeatable-page-master-reference
								master-reference="{@name}" />
						</xsl:when>
						<xsl:when test="$maximum-repeats='no-limit'">
							<fo:repeatable-page-master-reference
								master-reference="{@name}" />
						</xsl:when>
						<xsl:otherwise>
							<fo:repeatable-page-master-reference
								master-reference="{@name}" maximum-repeats="{$maximum-repeats}" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</fo:page-sequence-master>
		</fo:layout-master-set>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!-- pageSet properties                                                -->
	<!-- ================================================================= -->
	<xsl:template match="xft:pageSet/@name">
        <xsl:call-template name="log:trace"/>
        <xsl:attribute name="master-name">
        	<xsl:value-of select="."/>
        </xsl:attribute>
	</xsl:template>

	<xsl:template match="xft:pageSet/@relation">
        <xsl:call-template name="log:trace"/>
        <!-- Already handled by predicate -->
	</xsl:template>
		
	<xsl:template match="xft:pageSet/@relevant">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
		
</xsl:stylesheet>
