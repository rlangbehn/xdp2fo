<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: barcode.xsl,v 1.11 2008/07/10 23:11:56 rlangbehn Exp $
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
 | Version: $Revision: 1.11 $ $Date: 2008/07/10 23:11:56 $
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
	<!-- barcode element                                                   -->
	<!-- ================================================================= -->
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'Codabar' barcode                                                 -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:barcode[@type='codabar']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:variable name="message">
			<xsl:apply-templates select="../../xft:value/xft:text"
				mode="text-only" />
		</xsl:variable>

		<xsl:variable name="placement">
			<xsl:choose>
				<xsl:when test="not(@textLocation)">
					<xsl:text>bottom</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@textLocation" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<fo:block>
			<fo:instream-foreign-object>
				<barcode xmlns="http://barcode4j.krysalis.org/ns" message="{$message}">
					<codabar>
						<human-readable>
							<placement>
								<xsl:value-of select="$placement" />
							</placement>
						</human-readable>
					</codabar>
				</barcode>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'Interleaved 2 of 5' barcode                                      -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:barcode[@type='code2Of5Interleaved']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:variable name="message">
			<xsl:apply-templates select="../../xft:value/xft:text"
				mode="text-only" />
		</xsl:variable>

		<xsl:variable name="placement">
			<xsl:choose>
				<xsl:when test="not(@textLocation)">
					<xsl:text>bottom</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@textLocation" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<fo:block>
			<fo:instream-foreign-object>
				<barcode xmlns="http://barcode4j.krysalis.org/ns" message="{$message}">
					<intl2of5>
						<human-readable>
							<placement>
								<xsl:value-of select="$placement" />
							</placement>
						</human-readable>
					</intl2of5>
				</barcode>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'Code 39' barcode                                                 -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:barcode[@type='code3Of9']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[3]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="message">
			<xsl:apply-templates select="../../xft:value/xft:text"
				mode="text-only" />
		</xsl:variable>
		
		<xsl:variable name="height">
			<xsl:choose>
				<xsl:when test="@moduleHeight">
					<xsl:apply-templates select="@moduleHeight" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="../../@h" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="wide-factor">
			<xsl:choose>
				<xsl:when test="not(@wideNarrowRatio)">
					<xsl:text>3.0</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@wideNarrowRatio" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="placement">
			<xsl:choose>
				<xsl:when test="not(@textLocation)">
					<xsl:text>bottom</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@textLocation" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<fo:block>
			<fo:instream-foreign-object>
				<xsl:element name="xsl:choose">
					<xsl:element name="xsl:when">
						<xsl:attribute name="test">
							<xsl:text>$xdp2fo.formatter.type='FOP'</xsl:text>
						</xsl:attribute>
						<barcode xmlns="http://barcode4j.krysalis.org/ns" message="{$message}">
							<code39>
								<height>
									<xsl:value-of select="$height" />
								</height>
								<wide-factor>
									<xsl:value-of select="$wide-factor" />
								</wide-factor>
								<human-readable>
									<placement>
										<xsl:value-of select="$placement" />
									</placement>
								</human-readable>
							</code39>
						</barcode>
					</xsl:element>
					<xsl:element name="xsl:otherwise">
						<barcode xmlns="http://barcode4j.krysalis.org/ns" message="{$message}">
							<code39>
								<height>
									<xsl:value-of select="$height" />
								</height>
								<wide-factor>
									<xsl:value-of select="$wide-factor" />
								</wide-factor>
								<human-readable>
									<placement>
										<xsl:value-of select="$placement" />
									</placement>
								</human-readable>
							</code39>
						</barcode>
					</xsl:element>
				</xsl:element>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'Code 128' barcode                                                -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:barcode[@type='code128']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[4]/@match" />
			</xsl:with-param>
		</xsl:call-template>

		<xsl:variable name="message">
			<xsl:apply-templates select="../../xft:value/xft:text"
				mode="text-only" />
		</xsl:variable>

		<xsl:variable name="placement">
			<xsl:choose>
				<xsl:when test="not(@textLocation)">
					<xsl:text>bottom</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="@textLocation" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<fo:block>
			<fo:instream-foreign-object>
				<barcode xmlns="http://barcode4j.krysalis.org/ns" message="{$message}">
					<code128>
						<human-readable>
							<placement>
								<xsl:value-of select="$placement" />
							</placement>
						</human-readable>
					</code128>
				</barcode>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- barcode properties                                                -->
	<!-- ================================================================= -->
	<xsl:template match="xft:barcode/@charEncoding">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@checksum">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@dataColumnCount">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@dataLength">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@dataPrep">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@dataRowCount">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@endChar">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@errorCorrectionLevel">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@moduleHeight">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@moduleWidth">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@printCheckDigit">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@rowColumnRatio">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@startChar">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@textLocation">
		<xsl:call-template name="log:trace" />
		<xsl:choose>
			<xsl:when test=".='below'">bottom</xsl:when>
			<xsl:when test=".='above'">top</xsl:when>
			<xsl:when test=".='aboveEmbedded'">top</xsl:when>
			<xsl:when test=".='belowEmbedded'">bottom</xsl:when>
			<xsl:when test=".='none'">none</xsl:when>
			<xsl:otherwise>bottom</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="xft:barcode/@truncate">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@type">
		<xsl:call-template name="log:trace" />
		<!-- Already handled by predicate -->
	</xsl:template>
	
	<xsl:template match="xft:barcode/@upsMode">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<xsl:template match="xft:barcode/@wideNarrowRatio">
		<xsl:call-template name="log:trace" />
		<xsl:choose>
			<xsl:when test="not(contains(., ':'))">
				<xsl:value-of select="." />
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="wide" select="substring-before(., ':')" />
				<xsl:variable name="narrow" select="substring-after(., ':')" />
				<xsl:value-of select="$wide div $narrow" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
