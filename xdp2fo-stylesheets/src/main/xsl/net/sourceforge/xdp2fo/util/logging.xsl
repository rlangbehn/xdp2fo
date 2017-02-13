<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: logging.xsl,v 1.7 2008/07/13 18:39:09 rlangbehn Exp $
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
 | Version: $Revision: 1.7 $ $Date: 2008/07/13 18:39:09 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	version="1.0">

    <!-- ***************************************************************** -->
	<!-- PARAMETERS                                                        -->
	<!-- ***************************************************************** -->
	<xsl:param name="xdp2fo.logging.level" select="'WARN'"/>

	<!-- ***************************************************************** -->
	<!-- VARIABLES                                                         -->
	<!-- ***************************************************************** -->
	<xsl:variable name="log:level.value">
		<xsl:choose>
			<xsl:when test="$xdp2fo.logging.level='OFF'">2147483647</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='FATAL'">50000</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='ERROR'">40000</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='WARN'">30000</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='INFO'">20000</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='DEBUG'">10000</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='TRACE'">5000</xsl:when>
			<xsl:when test="$xdp2fo.logging.level='ALL'">-2147483648</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
		
    <!-- ================================================================= -->
    <!-- Log a message with debug log level.                               -->
    <!-- ================================================================= -->
	<xsl:template name="log:debug">
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>
		<xsl:call-template name="log:log">
			<xsl:with-param name="level.display-name" select="'DEBUG'"/>
			<xsl:with-param name="level.value" select="'10000'"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="mode" select="$mode"/>
			<xsl:with-param name="priority" select="$priority"/>
			<xsl:with-param name="message" select="$message"/>
		</xsl:call-template>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Log a message with error log level.                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:error">
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>
		<xsl:call-template name="log:log">
			<xsl:with-param name="level.display-name" select="'ERROR'"/>
			<xsl:with-param name="level.value" select="'40000'"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="mode" select="$mode"/>
			<xsl:with-param name="priority" select="$priority"/>
			<xsl:with-param name="message" select="$message"/>
		</xsl:call-template>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Log a message with fatal log level.                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:fatal">
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>
		<xsl:call-template name="log:log">
			<xsl:with-param name="level.display-name" select="'FATAL'"/>
			<xsl:with-param name="level.value" select="'50000'"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="mode" select="$mode"/>
			<xsl:with-param name="priority" select="$priority"/>
			<xsl:with-param name="message" select="$message"/>
		</xsl:call-template>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Log a message with info log level.                                -->
    <!-- ================================================================= -->
    <xsl:template name="log:info">
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>
		<xsl:call-template name="log:log">
			<xsl:with-param name="level.display-name" select="'INFO'"/>
			<xsl:with-param name="level.value" select="'20000'"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="mode" select="$mode"/>
			<xsl:with-param name="priority" select="$priority"/>
			<xsl:with-param name="message" select="$message"/>
		</xsl:call-template>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Is debug logging currently enabled?                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:isDebugEnabled">
		<xsl:call-template name="log:isLevelEnabled">
			<xsl:with-param name="level.value" select="'10000'"/>
		</xsl:call-template>
	</xsl:template>
		
    <!-- ================================================================= -->
    <!-- Is error logging currently enabled?                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:isErrorEnabled">
		<xsl:call-template name="log:isLevelEnabled">
			<xsl:with-param name="level.value" select="'40000'"/>
		</xsl:call-template>
	</xsl:template>
		
    <!-- ================================================================= -->
    <!-- Is fatal logging currently enabled?                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:isFatalEnabled">
		<xsl:call-template name="log:isLevelEnabled">
			<xsl:with-param name="level.value" select="'50000'"/>
		</xsl:call-template>
	</xsl:template>
		
    <!-- ================================================================= -->
    <!-- Is info logging currently enabled?                                -->
    <!-- ================================================================= -->
    <xsl:template name="log:isInfoEnabled">
		<xsl:call-template name="log:isLevelEnabled">
			<xsl:with-param name="level.value" select="'20000'"/>
		</xsl:call-template>
	</xsl:template>
		
    <!-- ================================================================= -->
    <!-- Is trace logging currently enabled?                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:isTraceEnabled">
		<xsl:call-template name="log:isLevelEnabled">
			<xsl:with-param name="level.value" select="'5000'"/>
		</xsl:call-template>
	</xsl:template>
		
    <!-- ================================================================= -->
    <!-- Is warn logging currently enabled?                                -->
    <!-- ================================================================= -->
    <xsl:template name="log:isWarnEnabled">
		<xsl:call-template name="log:isLevelEnabled">
			<xsl:with-param name="level.value" select="'30000'"/>
		</xsl:call-template>
	</xsl:template>

    <!-- ================================================================= -->
    <!-- Log a message with trace log level.                               -->
    <!-- ================================================================= -->
    <xsl:template name="log:trace">
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>
		<xsl:call-template name="log:log">
			<xsl:with-param name="level.display-name" select="'TRACE'"/>
			<xsl:with-param name="level.value" select="'5000'"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="mode" select="$mode"/>
			<xsl:with-param name="priority" select="$priority"/>
			<xsl:with-param name="message" select="$message"/>
		</xsl:call-template>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Log a message with warn log level.                                -->
    <!-- ================================================================= -->
    <xsl:template name="log:warn">
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>
		<xsl:call-template name="log:log">
			<xsl:with-param name="level.display-name" select="'WARN'"/>
			<xsl:with-param name="level.value" select="'30000'"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="mode" select="$mode"/>
			<xsl:with-param name="priority" select="$priority"/>
			<xsl:with-param name="message" select="$message"/>
		</xsl:call-template>
	</xsl:template>

	<!-- ***************************************************************** -->
	<!-- PRIVATE                                                           -->
	<!-- ***************************************************************** -->

    <!-- ================================================================= -->
    <!-- Checks whether the given log level is enabled.                    -->
    <!-- ================================================================= -->
	<xsl:template name="log:isLevelEnabled">
		<xsl:param name="level.value" select="''"/>
		
		<xsl:choose>
			<xsl:when test="$level.value &gt;= $log:level.value">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="false()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
			
    <!-- ================================================================= -->
    <!-- Log a message with the given log level if enabled.                -->
    <!-- ================================================================= -->
	<xsl:template name="log:log">
		<xsl:param name="level.display-name" select="''"/>
		<xsl:param name="level.value" select="''"/>
		<xsl:param name="match" select="''"/>
		<xsl:param name="mode" select="''"/>
		<xsl:param name="priority" select="''"/>
		<xsl:param name="message" select="''"/>

		<xsl:variable name="levelEnabled">
			<xsl:call-template name="log:isLevelEnabled">
				<xsl:with-param name="level.value" select="$level.value"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:if test="$levelEnabled='true'">
		    <xsl:variable name="path">
		        <xsl:call-template name="log:getPath"/>
		    </xsl:variable>	
		    
		    <xsl:message>
		        <xsl:text>[</xsl:text>
		        <xsl:value-of select="substring(concat($level.display-name, '     '), 1, 5)"/>
		        <xsl:text>] </xsl:text>
		        <xsl:value-of select="$path"/>
		        <xsl:if test="$match or $mode or $priority">
					<xsl:text> (</xsl:text>
		        	<xsl:if test="$match">
						<xsl:text>match="</xsl:text>
						<xsl:value-of select="$match"/>
						<xsl:text>"</xsl:text>
		        	</xsl:if>
		        	<xsl:if test="($match and $mode) or ($match and $priority)">
		        		<xsl:text> </xsl:text>
		        	</xsl:if>
		        	<xsl:if test="$mode">
						<xsl:text>mode="</xsl:text>
						<xsl:value-of select="$mode"/>
						<xsl:text>"</xsl:text>
		        	</xsl:if>
		        	<xsl:if test="($match and $mode) or ($match and $priority) or ($mode and $priority)">
		        		<xsl:text> </xsl:text>
		        	</xsl:if>
		        	<xsl:if test="$priority">
						<xsl:text>priority="</xsl:text>
						<xsl:value-of select="$priority"/>
						<xsl:text>"</xsl:text>
		        	</xsl:if>
					<xsl:text>)</xsl:text>
		        </xsl:if>
		        <xsl:if test="$message">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$message"/>
		        </xsl:if>
			</xsl:message>
		</xsl:if>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- Compute the absolute path of the context node.                    -->
	<!-- ================================================================= -->
	<xsl:template name="log:getPath">
		<xsl:for-each select="ancestor::*">
			<xsl:value-of select="concat('/', name(), '[', count(preceding-sibling::*[name() = name(current())]) + 1, ']')"/>
		</xsl:for-each>      
		<xsl:apply-templates select="." mode="log:getCurrent"/>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Compute the last step of the location path.                       -->
    <!-- ================================================================= -->
	<xsl:template match="*" mode="log:getCurrent">
		<xsl:value-of select="concat('/', name(), '[', count(preceding-sibling::*[name() = name(current())]) + 1, ']')"/>
	</xsl:template>
	
    <!-- ================================================================= -->
    <!-- Compute the last step of the location path.                       -->
    <!-- ================================================================= -->
	<xsl:template match="@*" mode="log:getCurrent">
		<xsl:value-of select="concat('/@', name())"/>
	</xsl:template>
	
</xsl:stylesheet>
