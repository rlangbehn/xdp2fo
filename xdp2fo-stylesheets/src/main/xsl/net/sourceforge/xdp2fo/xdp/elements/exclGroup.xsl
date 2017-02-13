<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: exclGroup.xsl,v 1.5 2008/07/24 19:05:20 rlangbehn Exp $
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
 | Version: $Revision: 1.5 $ $Date: 2008/07/24 19:05:20 $
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
	<!-- exclGroup element                                                 -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup[not(@layout) or @layout='position']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="createBeginElementProcessingComment" />
		<xsl:choose>
			<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
				<fo:block-container absolute-position="absolute"
					xsl:use-attribute-sets="other-objects-borders">
					<xsl:call-template name="process-exclGroup-properties" />
					<xsl:call-template name="process-exclGroup-children" />
				</fo:block-container>
			</xsl:when>
			<xsl:otherwise>
				<fo:block-container absolute-position="absolute">
					<xsl:call-template name="process-exclGroup-properties" />
					<xsl:call-template name="process-exclGroup-children" />
				</fo:block-container>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="createEndElementProcessingComment" />
	</xsl:template>

	<!-- ================================================================= -->
	<!-- exclGroup properties                                              -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@access">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@accessKey">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@anchorType">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@colSpan">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@h">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="height">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@layout">
		<xsl:call-template name="log:trace" />
		<!-- Already handled by predicate -->
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@maxH">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(../@h) or ../@h=''">
			<xsl:attribute name="max-height">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@maxW">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(../@w) or ../@w=''">
			<xsl:attribute name="max-width">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@minH">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(../@h) or ../@h=''">
			<xsl:attribute name="min-height">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@minW">
		<xsl:call-template name="log:trace" />
		<xsl:if test="not(../@w) or ../@w=''">
			<xsl:attribute name="min-width">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@name">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@presence">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@relevant">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@w">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="width">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@x">
		<xsl:call-template name="log:trace" />
		<xsl:choose>
			<xsl:when test="../@anchorType='topLeft'">
				<xsl:attribute name="left">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="../@anchorType='bottomCenter'">
				<xsl:choose>
					<xsl:when test="../@w">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@w"/>
							<xsl:text> div 2)</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="left">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='bottomLeft'">
				<xsl:attribute name="left">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="../@anchorType='bottomRight'">
				<xsl:choose>
					<xsl:when test="../@w">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@w" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="left">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='middleCenter'">
				<xsl:choose>
					<xsl:when test="../@w">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@w"/>
							<xsl:text> div 2)</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="left">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='middleLeft'">
				<xsl:attribute name="left">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="../@anchorType='middleRight'">
				<xsl:choose>
					<xsl:when test="../@w">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@w" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="left">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='topCenter'">
				<xsl:choose>
					<xsl:when test="../@w">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@w"/>
							<xsl:text> div 2)</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="left">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='topRight'">
				<xsl:choose>
					<xsl:when test="../@w">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@w" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="left">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="left">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:exclGroup/@y">
		<xsl:call-template name="log:trace" />
		<xsl:choose>
			<xsl:when test="../@anchorType='topLeft'">
				<xsl:attribute name="top">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="../@anchorType='bottomCenter'">
				<xsl:choose>
					<xsl:when test="../@h">
						<xsl:attribute name="top">
							<xsl:value-of select="." />
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@h"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="top">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='bottomLeft'">
				<xsl:choose>
					<xsl:when test="../@h">
						<xsl:attribute name="top">
							<xsl:value-of select="." />
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@h"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="top">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='bottomRight'">
				<xsl:choose>
					<xsl:when test="../@h">
						<xsl:attribute name="top">
							<xsl:value-of select="." />
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@h"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="top">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='middleCenter'">
				<xsl:choose>
					<xsl:when test="../@h">
						<xsl:attribute name="top">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@h"/>
							<xsl:text> div 2)</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="top">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='middleLeft'">
				<xsl:choose>
					<xsl:when test="../@h">
						<xsl:attribute name="top">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@h"/>
							<xsl:text> div 2)</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="top">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='middleRight'">
				<xsl:choose>
					<xsl:when test="../@h">
						<xsl:attribute name="top">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@h"/>
							<xsl:text> div 2)</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="top">
							<xsl:value-of select="." />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="../@anchorType='topCenter'">
				<xsl:attribute name="top">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="../@anchorType='topRight'">
				<xsl:attribute name="top">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="top">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!--                                                                   -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-exclGroup-properties">
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:assist" />
		<xsl:apply-templates select="xft:bind" />
		<xsl:apply-templates select="xft:border" />
		<xsl:apply-templates select="xft:calculate" />
		<xsl:apply-templates select="xft:caption" />
		<xsl:apply-templates select="xft:desc" />
		<xsl:apply-templates select="xft:extras" />
		<xsl:apply-templates select="xft:margin" />
		<xsl:apply-templates select="xft:para" />
		<xsl:apply-templates select="xft:traversal" />
		<xsl:apply-templates select="xft:validate" />
	</xsl:template>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-exclGroup-children">
		<xsl:apply-templates
			select="*[not(
				self::xft:assist or
				self::xft:bind or
				self::xft:border or
				self::xft:calculate or
				self::xft:caption or
				self::xft:desc or
				self::xft:extras or
				self::xft:margin or
				self::xft:para or
				self::xft:traversal or
				self::xft:validate
			)]" />
	</xsl:template>
		
</xsl:stylesheet>
