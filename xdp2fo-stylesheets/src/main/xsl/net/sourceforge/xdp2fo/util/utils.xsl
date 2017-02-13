<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: utils.xsl,v 1.5 2008/07/15 11:35:27 rlangbehn Exp $
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
 | Version: $Revision: 1.5 $ $Date: 2008/07/15 11:35:27 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

    <!-- ***************************************************************** -->
    <!-- PARAMETERS                                                        -->
    <!-- ***************************************************************** -->
    <xsl:param name="xdp2fo.measurement.unit" select="'in'"/>
    
    <!-- ================================================================= -->
    <!-- convertMeasurement                                                -->
    <!-- ================================================================= -->
    <xsl:template name="convertMeasurement">
        <xsl:param name="measurement"/>
        
        <xsl:choose>
            <xsl:when test="$xdp2fo.measurement.unit='in'">
                <xsl:call-template name="convertToInches">
                    <xsl:with-param name="measurement" select="$measurement"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">
                    <xsl:text>Unsupported measurement conversion specified</xsl:text>
                </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ================================================================= -->
    <!-- convertToInches                                                   -->
    <!--                                                                   -->
    <!--   The following list is the set of allowable units and the        -->
    <!--   corresponding identifiers:                                      -->
    <!--                                                                   -->
    <!--     cm - centimeters                                              -->
    <!--     in - inches (The XFA specification considers one inch to be   -->
    <!--          exactly 2.54 centimeters)                                -->
    <!--     mm - millimeters                                              -->
    <!--     pt - points (The XFA specification considers a point to be    -->
    <!--          exactly 1/72 of an inch)                                 -->
    <!--                                                                   -->
    <!--   The default unit is assumed to be inches.                       -->
    <!-- ================================================================= -->
	<xsl:template name="convertToInches">
		<xsl:param name="measurement" />
		
		<xsl:variable name="unit"
			select="translate($measurement, '+-0123456789.', '')" />
			
		<xsl:variable name="value"
			select="number(substring-before($measurement, $unit))" />
			
		<xsl:variable name="scaling-factor">
			<xsl:choose>
				<xsl:when test="$unit='in'">1</xsl:when>
				<xsl:when test="$unit='cm'">0.3937008</xsl:when>
				<xsl:when test="$unit='mm'">0.03937008</xsl:when>
				<xsl:when test="$unit='pt'">0.01388889</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="$scaling-factor='1'">
				<xsl:value-of select="$value" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="roundDouble">
					<xsl:with-param name="source" select="$value * $scaling-factor" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

    <!-- ================================================================= -->
    <!-- isSaxon                                                           -->
    <!-- ================================================================= -->
	<xsl:template name="isSaxon">
		<xsl:variable name="vendor">
			<xsl:copy-of select="system-property('xsl:vendor')"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains($vendor, 'SAXON')">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="false()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- isXalan                                                           -->
    <!-- ================================================================= -->
	<xsl:template name="isXalan">
		<xsl:variable name="vendor">
			<xsl:copy-of select="system-property('xsl:vendor')"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains($vendor, 'Xalan')">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="false()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- roundDouble                                                       -->
    <!-- ================================================================= -->
	<xsl:template name="roundDouble">
		<xsl:param name="source" />
		<xsl:param name="precision" select="0.001" />
		<xsl:choose>
			<xsl:when test="string(number($source))='NaN'">
            	<!-- not a number! return source as is -->
				<xsl:value-of select="$source" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$precision=0">
                    	<!-- rounding not needed -->
						<xsl:value-of select="number($source)" />
					</xsl:when>
					<xsl:when test="$precision=1">
                    	<!-- simple rounding -->
						<xsl:value-of select="round(number($source))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="round(number($source) div $precision) * $precision" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

    <!-- ================================================================= -->
    <!--                                                                   -->
    <!-- ================================================================= -->
	<xsl:template name="createBeginElementProcessingComment">
		<xsl:comment>
			<xsl:text> BEGIN </xsl:text>
			<xsl:value-of select="name()"/>
			<xsl:text>(name="</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>") </xsl:text>
		</xsl:comment>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!--                                                                   -->
    <!-- ================================================================= -->
	<xsl:template name="createEndElementProcessingComment">
		<xsl:comment>
			<xsl:text> END </xsl:text>
			<xsl:value-of select="name()"/>
			<xsl:text>(name="</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>") </xsl:text>
		</xsl:comment>
	</xsl:template>
	
</xsl:stylesheet>
