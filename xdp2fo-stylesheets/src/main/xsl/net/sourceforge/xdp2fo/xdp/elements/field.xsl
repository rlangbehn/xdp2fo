<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: field.xsl,v 1.21 2008/07/24 19:05:20 rlangbehn Exp $
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
 | Version: $Revision: 1.21 $ $Date: 2008/07/24 19:05:20 $
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
	<!-- field element                                                     -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[not(xft:caption)]" priority="1.0">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:choose>
			<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
				<fo:block-container absolute-position="absolute"
					xsl:use-attribute-sets="block-container default-font-properties default-para-properties fields-borders">
					<xsl:call-template name="process-field-properties"/>
					<fo:block>
						<xsl:apply-templates select="xft:bind" />
						<xsl:apply-templates select="xft:ui" />
					</fo:block>
				</fo:block-container>
			</xsl:when>
			<xsl:otherwise>
				<fo:block-container absolute-position="absolute"
					xsl:use-attribute-sets="block-container default-font-properties default-para-properties">
					<xsl:call-template name="process-field-properties"/>
					<fo:block>
						<xsl:apply-templates select="xft:bind" />
						<xsl:apply-templates select="xft:ui" />
					</fo:block>
				</fo:block-container>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[not(xft:caption)]" mode="table-cell" priority="1.0">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[2]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<fo:block>
				<xsl:choose>
					<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
						<fo:block xsl:use-attribute-sets="fields-borders">
							<xsl:apply-templates select="xft:bind" />
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
						<fo:block>
							<xsl:apply-templates select="xft:bind" />
						</fo:block>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[not(xft:caption/@placement) or xft:caption/@placement='left']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[3]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:block-container absolute-position="absolute">
			<xsl:apply-templates select="@x|@y|@w|@h" />
			<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="{xft:caption/@reserve}" />
				<fo:table-column column-width="{@w} - {xft:caption/@reserve}" />
				<fo:table-body>
					<fo:table-row>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{@h}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{@h}">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{@h}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{@h}">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block-container>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[not(xft:caption/@placement) or xft:caption/@placement='left']" mode="table-cell">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[4]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[4]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<fo:block>
				<fo:table table-layout="fixed" width="100%">
					<fo:table-column column-width="{xft:caption/@reserve}" />
					<fo:table-column
						column-width="{@w} - {xft:caption/@reserve}" />
					<fo:table-body>
						<fo:table-row>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell height="{@h}"
										xsl:use-attribute-sets="fields-borders">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell height="{@h}">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell height="{@h}"
										xsl:use-attribute-sets="fields-borders">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell height="{@h}">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='right']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[5]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:block-container absolute-position="absolute">
			<xsl:apply-templates select="@x|@y|@w|@h" />
			<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="{@w} - {xft:caption/@reserve}" />
				<fo:table-column column-width="{xft:caption/@reserve}" />
				<fo:table-body>
					<fo:table-row>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{@h}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{@h}">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{@h}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{@h}">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block-container>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='right']" mode="table-cell">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[6]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[6]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<fo:block>
				<fo:table table-layout="fixed" width="100%">
					<fo:table-column
						column-width="{@w} - {xft:caption/@reserve}" />
					<fo:table-column column-width="{xft:caption/@reserve}" />
					<fo:table-body>
						<fo:table-row>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell height="{@h}"
										xsl:use-attribute-sets="fields-borders">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell height="{@h}">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell height="{@h}"
										xsl:use-attribute-sets="fields-borders">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell height="{@h}">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='top']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[7]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:block-container absolute-position="absolute">
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates select="xft:assist" />
			<xsl:apply-templates select="xft:border" />
			<xsl:apply-templates select="xft:calculate" />
			<xsl:apply-templates select="xft:desc" />
			<xsl:apply-templates select="xft:extras" />
			<xsl:apply-templates select="xft:font" />
			<xsl:apply-templates select="xft:format" />
			
			<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="{@w}" />
				<fo:table-body>
					<fo:table-row>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{xft:caption/@reserve}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{xft:caption/@reserve}">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
					<fo:table-row>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{@h} - {xft:caption/@reserve}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{@h} - {xft:caption/@reserve}">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block-container>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='top']" mode="table-cell">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[8]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[8]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<fo:block>
				<fo:table table-layout="fixed" width="100%">
					<fo:table-column column-width="{@w}" />
					<fo:table-body>
						<fo:table-row>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell
										height="{xft:caption/@reserve}"
										xsl:use-attribute-sets="fields-borders">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell
										height="{xft:caption/@reserve}">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-row>
						<fo:table-row>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell
										height="{@h} - {xft:caption/@reserve}"
										xsl:use-attribute-sets="fields-borders">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell
										height="{@h} - {xft:caption/@reserve}">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='bottom']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[9]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:block-container absolute-position="absolute">
			<xsl:apply-templates select="@x|@y|@w|@h" />
			<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="{@w}" />
				<fo:table-body>
					<fo:table-row>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{@h} - {xft:caption/@reserve}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{@h} - {xft:caption/@reserve}">
									<xsl:apply-templates select="xft:para" />
									<fo:block>
										<xsl:apply-templates select="xft:margin" />
										<xsl:apply-templates select="xft:bind" />
										<xsl:apply-templates select="xft:event" />
									</fo:block>
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
					<fo:table-row>
						<xsl:choose>
							<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
								<fo:table-cell height="{xft:caption/@reserve}"
									xsl:use-attribute-sets="fields-borders">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-cell height="{xft:caption/@reserve}">
									<xsl:apply-templates select="xft:caption" />
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block-container>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='bottom']" mode="table-cell">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[10]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[10]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<fo:block>
				<fo:table table-layout="fixed" width="100%">
					<fo:table-column column-width="{@w}" />
					<fo:table-body>
						<fo:table-row>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell
										height="{@h} - {xft:caption/@reserve}"
										xsl:use-attribute-sets="fields-borders">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell
										height="{@h} - {xft:caption/@reserve}">
										<fo:block>
											<xsl:apply-templates
												select="xft:bind" />
										</fo:block>
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-row>
						<fo:table-row>
							<xsl:choose>
								<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
									<fo:table-cell
										height="{xft:caption/@reserve}"
										xsl:use-attribute-sets="fields-borders">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:when>
								<xsl:otherwise>
									<fo:table-cell
										height="{xft:caption/@reserve}">
										<xsl:apply-templates
											select="xft:caption" />
									</fo:table-cell>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='inline']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[11]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:block-container absolute-position="absolute">
			<xsl:apply-templates select="@x|@y|@w|@h" />
			<xsl:choose>
				<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
					<fo:block xsl:use-attribute-sets="fields-borders">
						<xsl:apply-templates select="xft:caption" />
						<xsl:apply-templates select="xft:bind" />
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<fo:block>
						<xsl:apply-templates select="xft:caption" />
						<xsl:apply-templates select="xft:bind" />
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block-container>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field[xft:caption/@placement='inline']" mode="table-cell">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[12]/@match" />
			</xsl:with-param>
			<xsl:with-param name="mode">
				<xsl:value-of select="document('')/*/xsl:template[12]/@mode"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<fo:block>
				<xsl:choose>
					<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
						<fo:block xsl:use-attribute-sets="fields-borders">
							<xsl:apply-templates select="xft:caption" />
							<xsl:apply-templates select="xft:bind" />
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
						<fo:block>
							<xsl:apply-templates select="xft:caption" />
							<xsl:apply-templates select="xft:bind" />
						</fo:block>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- field properties                                                  -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@access">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@accessKey">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@anchorType">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@colSpan">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="number-columns-spanned">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@h">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="height">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@locale">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@maxH">
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
	<xsl:template match="xft:field/@maxW">
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
	<xsl:template match="xft:field/@minH">
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
	<xsl:template match="xft:field/@minW">
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
	<xsl:template match="xft:field/@name">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@presence">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@relevant">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@rotate">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@w">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="width">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:field/@x">
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
					<xsl:when test="../@minW">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@minW"/>
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
					<xsl:when test="../@minW">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@minW" />
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
					<xsl:when test="../@minW">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@minW"/>
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
					<xsl:when test="../@minW">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@minW" />
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
					<xsl:when test="../@minW">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - (</xsl:text>
							<xsl:value-of select="../@minW"/>
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
					<xsl:when test="../@minW">
						<xsl:attribute name="left">
							<xsl:value-of select="."/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="../@minW" />
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
	<xsl:template match="xft:field/@y">
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
	<xsl:template name="process-field-properties">
		<xsl:if test="(not(@h) or @h='') and (not(@minH) or @minH='')">
			<xsl:attribute name="min-height">
				<xsl:text>0in</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="(not(@w) or @w='') and (not(@minW) or @minW='')">
			<xsl:attribute name="min-width">
				<xsl:text>0in</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:border" />
		<xsl:apply-templates select="xft:font" />
	</xsl:template>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-field-children">
		<xsl:apply-templates
			select="*[not(
				self::xft:assist or
				self::xft:bind or
				self::xft:border or
				self::xft:calculate or
				self::xft:caption or
				self::xft:desc or
				self::xft:extras or
				self::xft:font or
				self::xft:format or
				self::xft:items or
				self::xft:margin or
				self::xft:para or
				self::xft:traversal or
				self::xft:ui or
				self::xft:validate or
				self::xft:value
			)]" />
	</xsl:template>
	
</xsl:stylesheet>
