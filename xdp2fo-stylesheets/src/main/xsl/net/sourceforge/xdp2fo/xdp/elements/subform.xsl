<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: subform.xsl,v 1.22 2008/07/24 19:05:20 rlangbehn Exp $
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
 | Version: $Revision: 1.22 $ $Date: 2008/07/24 19:05:20 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	xmlns:exsl="http://exslt.org/common"
	extension-element-prefixes="exsl"
	exclude-result-prefixes="log xft"
	version="1.0">

    <xsl:import href="../../util/str.xsl"/>

	<!-- ================================================================= -->
	<!-- subform element                                                   -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[not(@layout) or @layout='position']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[1]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="createBeginElementProcessingComment" />
		<xsl:choose>
			<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
				<fo:block-container xsl:use-attribute-sets="subforms-borders">
					<xsl:call-template name="process-subform-properties" />
					<xsl:call-template name="process-subform-children" />
				</fo:block-container>
			</xsl:when>
			<xsl:otherwise>
				<fo:block-container>
					<xsl:call-template name="process-subform-properties" />
					<xsl:call-template name="process-subform-children" />
				</fo:block-container>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="createEndElementProcessingComment" />
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[not(@layout) or @layout='position']" mode="table-cell">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[2]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-cell>
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates select="xft:border" />
			<xsl:apply-templates select="xft:margin" />
			<xsl:apply-templates select="xft:para" />
			<fo:block xsl:use-attribute-sets="subforms-borders">
				<!-- properties -->
				<xsl:apply-templates select="xft:assist" />
				<xsl:apply-templates select="xft:bind" />
				<xsl:apply-templates select="xft:bookend" />
				<xsl:apply-templates select="xft:break" />
				<xsl:apply-templates select="xft:calculate" />
				<xsl:apply-templates select="xft:desc" />
				<xsl:apply-templates select="xft:extras" />
				<xsl:apply-templates select="xft:keep" />
				<xsl:apply-templates select="xft:occur" />
				<xsl:apply-templates select="xft:overflow" />
				<xsl:apply-templates select="xft:pageSet" />
				<xsl:apply-templates select="xft:traversal" />
				<xsl:apply-templates select="xft:validate" />
				<xsl:apply-templates select="xft:variables" />
				<!-- children -->
				<xsl:apply-templates select="xft:area" />
				<xsl:apply-templates select="xft:breakAfter" />
				<xsl:apply-templates select="xft:breakBefore" />
				<xsl:apply-templates select="xft:connect" />
				<xsl:apply-templates select="xft:draw" />
				<xsl:apply-templates select="xft:event" />
				<xsl:apply-templates select="xft:exObject" />
				<xsl:apply-templates select="xft:exclGroup" />
				<xsl:apply-templates select="xft:field" />
				<xsl:apply-templates select="xft:proto" />
				<xsl:apply-templates select="xft:setProperty" />
				<xsl:apply-templates select="xft:subform" />
				<xsl:apply-templates select="xft:subformSet" />
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[@layout='lr-tb']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[3]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[@layout='rl-tb']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[4]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'table-body' subform                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[@layout='row' and not(xft:assist/@role='TH' or xft:assist/@role='TF')]">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[5]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-body xsl:use-attribute-sets="subforms-borders">
			<fo:table-row>
				<!-- properties -->
				<xsl:apply-templates select="@*" />
				<xsl:apply-templates select="xft:assist" />
				<xsl:apply-templates select="xft:bind" />
				<xsl:apply-templates select="xft:bookend" />
				<xsl:apply-templates select="xft:border" />
				<xsl:apply-templates select="xft:break" />
				<xsl:apply-templates select="xft:calculate" />
				<xsl:apply-templates select="xft:desc" />
				<xsl:apply-templates select="xft:extras" />
				<xsl:apply-templates select="xft:keep" />
				<xsl:apply-templates select="xft:margin" />
				<xsl:apply-templates select="xft:occur" />
				<xsl:apply-templates select="xft:overflow" />
				<xsl:apply-templates select="xft:pageSet" />
				<xsl:apply-templates select="xft:para" />
				<xsl:apply-templates select="xft:traversal" />
				<xsl:apply-templates select="xft:validate" />
				<xsl:apply-templates select="xft:variables" />
				<!-- children -->
				<xsl:apply-templates mode="table-cell" />
			</fo:table-row>
		</fo:table-body>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'table-header' subform                                            -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[@layout='row' and xft:assist/@role='TH']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[6]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-header xsl:use-attribute-sets="subforms-borders">
			<fo:table-row>
				<!-- properties -->
				<xsl:apply-templates select="@*" />
				<xsl:apply-templates select="xft:assist" />
				<xsl:apply-templates select="xft:bind" />
				<xsl:apply-templates select="xft:bookend" />
				<xsl:apply-templates select="xft:border" />
				<xsl:apply-templates select="xft:break" />
				<xsl:apply-templates select="xft:calculate" />
				<xsl:apply-templates select="xft:desc" />
				<xsl:apply-templates select="xft:extras" />
				<xsl:apply-templates select="xft:keep" />
				<xsl:apply-templates select="xft:margin" />
				<xsl:apply-templates select="xft:occur" />
				<xsl:apply-templates select="xft:overflow" />
				<xsl:apply-templates select="xft:pageSet" />
				<xsl:apply-templates select="xft:para" />
				<xsl:apply-templates select="xft:traversal" />
				<xsl:apply-templates select="xft:validate" />
				<xsl:apply-templates select="xft:variables" />
				<!-- children -->
				<xsl:apply-templates mode="table-cell" />
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'table-footer' subform                                            -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[@layout='row' and xft:assist/@role='TF']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[7]/@match"/>
			</xsl:with-param>
		</xsl:call-template>
		
		<fo:table-footer xsl:use-attribute-sets="subforms-borders">
			<fo:table-row>
				<!-- properties -->
				<xsl:apply-templates select="@*" />
				<xsl:apply-templates select="xft:assist" />
				<xsl:apply-templates select="xft:bind" />
				<xsl:apply-templates select="xft:bookend" />
				<xsl:apply-templates select="xft:border" />
				<xsl:apply-templates select="xft:break" />
				<xsl:apply-templates select="xft:calculate" />
				<xsl:apply-templates select="xft:desc" />
				<xsl:apply-templates select="xft:extras" />
				<xsl:apply-templates select="xft:keep" />
				<xsl:apply-templates select="xft:margin" />
				<xsl:apply-templates select="xft:occur" />
				<xsl:apply-templates select="xft:overflow" />
				<xsl:apply-templates select="xft:pageSet" />
				<xsl:apply-templates select="xft:para" />
				<xsl:apply-templates select="xft:traversal" />
				<xsl:apply-templates select="xft:validate" />
				<xsl:apply-templates select="xft:variables" />
				<!-- children -->
				<xsl:apply-templates mode="table-cell" />
			</fo:table-row>
		</fo:table-footer>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'table' subform                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[@layout='table']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[8]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="tokens">
			<xsl:call-template name="split">
				<xsl:with-param name="string">
					<xsl:apply-templates select="@columnWidths" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
				<fo:table table-layout="fixed" width="100%"
					xsl:use-attribute-sets="subforms-borders">
					<xsl:for-each select="exsl:node-set($tokens)/token">
						<fo:table-column column-width="{.}" />
					</xsl:for-each>
					<xsl:apply-templates
						select="xft:subform[@layout='row' and xft:assist/@role='TH']" />
					<!--
						xsl:apply-templates select="xft:subform[@layout='row' and
						xft:assist/@role='TF']"/
					-->
					<xsl:apply-templates
						select="xft:subform[@layout='row' and not(xft:assist)]" />
				</fo:table>
			</xsl:when>
			<xsl:otherwise>
				<fo:table table-layout="fixed" width="100%">
					<xsl:for-each select="exsl:node-set($tokens)/token">
						<fo:table-column column-width="{.}" />
					</xsl:for-each>
					<xsl:apply-templates
						select="xft:subform[@layout='row' and xft:assist/@role='TH']" />
					<!--
						xsl:apply-templates select="xft:subform[@layout='row' and
						xft:assist/@role='TF']"/
					-->
					<xsl:apply-templates
						select="xft:subform[@layout='row' and not(xft:assist)]" />
				</fo:table>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform[not(parent::xft:template) and @layout='tb']">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[9]/@match" />
			</xsl:with-param>
		</xsl:call-template>
		
		<xsl:choose>
			<xsl:when test="$xdp2fo.drawing-aids.showObjectBoundaries='true'">
				<fo:block xsl:use-attribute-sets="subforms-borders">
					<xsl:call-template name="process-subform-properties"/>
					<xsl:call-template name="process-subform-children"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block>
					<xsl:call-template name="process-subform-properties"/>
					<xsl:call-template name="process-subform-children"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- 'root' subform                                                    -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match="xft:subform[parent::xft:template]">
		<xsl:call-template name="log:trace">
			<xsl:with-param name="match">
				<xsl:value-of select="document('')/*/xsl:template[10]/@match"/>
			</xsl:with-param>
		</xsl:call-template>

        <!-- properties -->
        <xsl:apply-templates select="xft:variables" />
        <xsl:apply-templates select="xft:pageSet" />
        <!-- children -->
        <fo:page-sequence master-reference="MasterPages">
        	<!-- TODO respect writing mode -->
        	<fo:static-content flow-name="xsl-region-before">
        		<!-- TODO -->
        		<fo:block/>
        	</fo:static-content>
        	
        	<fo:static-content flow-name="xsl-region-after">
        		<!-- TODO -->
        		<fo:block/>
        	</fo:static-content>
        	
        	<fo:static-content flow-name="xsl-region-start">
        		<!-- TODO -->
        		<fo:block/>
        	</fo:static-content>
        	
        	<fo:static-content flow-name="xsl-region-end">
        		<!-- TODO -->
        		<fo:block/>
        	</fo:static-content>
        	
        	<fo:flow flow-name="xsl-region-body">
        		<!-- child nodes need to be processed in document order -->
        		<xsl:apply-templates select="xft:subform" />
        	</fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
	<!-- ================================================================= -->
	<!-- subform properties                                                -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@allowMacro">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@anchorType">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@colSpan">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="number-columns-spanned">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@columnWidths">
		<xsl:call-template name="log:trace" />
		<xsl:value-of select="."/>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@h">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="height">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@hAlign">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@layout">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@locale">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@maxH">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@maxW">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@minH">
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
	<xsl:template match="xft:subform/@minW">
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
	<xsl:template match="xft:subform/@name">
		<xsl:call-template name="log:trace" />
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@relevant">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@restoreState">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@scope">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@vAlign">
		<xsl:call-template name="log:trace" />
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@w">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="width">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@x">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="left">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="xft:subform/@y">
		<xsl:call-template name="log:trace" />
		<xsl:attribute name="top">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>
	
	<!-- ================================================================= -->
	<!--                                                                   -->
	<!-- ================================================================= -->

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-subform-properties">
		<xsl:apply-templates select="@*" />
		<xsl:apply-templates select="xft:assist" />
		<xsl:apply-templates select="xft:bind" />
		<xsl:apply-templates select="xft:bookend" />
		<xsl:apply-templates select="xft:border" />
		<xsl:apply-templates select="xft:break" />
		<xsl:apply-templates select="xft:calculate" />
		<xsl:apply-templates select="xft:desc" />
		<xsl:apply-templates select="xft:extras" />
		<xsl:apply-templates select="xft:keep" />
		<xsl:apply-templates select="xft:margin" />
		<xsl:apply-templates select="xft:occur" />
		<xsl:apply-templates select="xft:overflow" />
		<xsl:apply-templates select="xft:pageSet" />
		<xsl:apply-templates select="xft:para" />
		<xsl:apply-templates select="xft:traversal" />
		<xsl:apply-templates select="xft:validate" />
		<xsl:apply-templates select="xft:variables" />
	</xsl:template>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--                                                                   -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template name="process-subform-children">
		<xsl:apply-templates
			select="*[not(
				self::xft:assist or
				self::xft:bind or
				self::xft:bookend or
				self::xft:border or
				self::xft:break or
				self::xft:calculate or
				self::xft:desc or
				self::xft:extras or
				self::xft:keep or
				self::xft:margin or
				self::xft:occur or
				self::xft:overflow or
				self::xft:pageSet or
				self::xft:para or
				self::xft:traversal or
				self::xft:validate or
				self::xft:variables
			)]" />
	</xsl:template>
		
</xsl:stylesheet>
