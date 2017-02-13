<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: drawing-aids.xsl,v 1.7 2008/07/13 19:58:17 rlangbehn Exp $
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
 | Version: $Revision: 1.7 $ $Date: 2008/07/13 19:58:17 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:da="http://xdp2fo.sourceforge.net/drawing-aids"
	version="1.0">

    <!-- ***************************************************************** -->
	<!-- PARAMETERS                                                        -->
	<!-- ***************************************************************** -->
	<xsl:param name="xdp2fo.drawing-aids.showGrid" select="false()"/>
	<xsl:param name="xdp2fo.drawing-aids.showGuidelines" select="false()"/>
	<xsl:param name="xdp2fo.drawing-aids.showHorizontalRuler" select="false()"/>
	<xsl:param name="xdp2fo.drawing-aids.showObjectBoundaries" select="false()"/>
	<xsl:param name="xdp2fo.drawing-aids.showVerticalRuler" select="false()"/>
	
	<!-- ================================================================= -->
	<!-- The following attribute sets will be used if the parameter        -->
	<!-- 'xdp2fo.drawing-aids.showGrid' evals to true.                     -->
	<!-- ================================================================= -->
		    
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="grid">
		<xsl:attribute name="background-color">
			<xsl:text>rgb(204,204,204)</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="background-image">
			<xsl:text>url('data:image/gif;base64,R0lGODlhFAAUAJH/AP///8zMzAAAAAAAACwAAAAAFAAUAAACI4SPiaHt/xicTVaKs838ng12ziaWZKmcH8qqLBUwMjDX9F0AADs=')</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="background-repeat">
			<xsl:text>repeat</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="background-position-horizontal">
			<xsl:text>center</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="background-position-vertical">
			<xsl:text>center</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ================================================================= -->
	<!-- The following attribute sets will be used if the parameter        -->
	<!-- 'xdp2fo.drawing-aids.showGuidelines' evals to true.               -->
	<!-- ================================================================= -->
		    
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	<!-- ================================================================= -->
	<!-- The following attribute sets will be used if the parameter        -->
	<!-- 'xdp2fo.drawing-aids.showHorizontalRuler' evals to true.          -->
	<!-- ================================================================= -->
		    
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO provide attribute sets to assist in the rendering of a       -->
	<!--      horizontal ruler (similar to the CSS test suites)            -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	<!-- ================================================================= -->
	<!-- The following attribute sets will be used if the parameter        -->
	<!-- 'xdp2fo.drawing-aids.showObjectBoundaries' evals to true.         -->
	<!-- ================================================================= -->
		    
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="fields-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(255,128,0)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'solid'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="subforms-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(128,128,255)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'dashed'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="contentAreas-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(219,142,232)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'dashed'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="groups-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(192,192,192)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'dotted'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="fragment-references-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(102,0,153)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'solid'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>
			
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="fragment-objects-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(51,0,204)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'solid'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>
			
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:attribute-set name="other-objects-borders">
		<xsl:attribute name="border-color">
			<xsl:value-of select="'rgb(128,128,255)'" />
		</xsl:attribute>
		<xsl:attribute name="border-style">
			<xsl:value-of select="'solid'" />
		</xsl:attribute>
		<xsl:attribute name="border-width">
			<xsl:value-of select="'0.25pt'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<!-- ================================================================= -->
	<!-- The following attribute sets will be used if the parameter        -->
	<!-- 'xdp2fo.drawing-aids.showVerticalRuler' evals to true.            -->
	<!-- ================================================================= -->
		    
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO provide attribute sets to assist in the rendering of a       -->
	<!--      vertical ruler (similar to the CSS test suites)              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	<!-- ================================================================= -->
	<!-- Guideline sets                                                    -->
	<!-- ================================================================= -->
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<da:guideline-set name="US Letter">
		<da:guideline type="horizontal" position="0.5in"/>
		<da:guideline type="horizontal" position="10.5in"/>
		<da:guideline type="vertical" position="0.5in"/>
		<da:guideline type="vertical" position="8in"/>
	</da:guideline-set>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<da:guideline-set name="US Legal">
		<da:guideline type="horizontal" position="0.5in"/>
		<da:guideline type="horizontal" position="13.5in"/>
		<da:guideline type="vertical" position="0.5in"/>
		<da:guideline type="vertical" position="8in"/>
	</da:guideline-set>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<da:guideline-set name="Tabloid">
		<da:guideline type="horizontal" position="0.5in"/>
		<da:guideline type="horizontal" position="16.5in"/>
		<da:guideline type="vertical" position="0.5in"/>
		<da:guideline type="vertical" position="10.5in"/>
	</da:guideline-set>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<da:guideline-set name="A3 Tabloid">
		<da:guideline type="horizontal" position="0.5906in"/>
		<da:guideline type="horizontal" position="15.9449in"/>
		<da:guideline type="vertical" position="0.5906in"/>
		<da:guideline type="vertical" position="11.1024in"/>
	</da:guideline-set>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<da:guideline-set name="A4 Letter">
		<da:guideline type="horizontal" position="0.5906in"/>
		<da:guideline type="horizontal" position="11.1024in"/>
		<da:guideline type="vertical" position="0.5906in"/>
		<da:guideline type="vertical" position="7.6772in"/>
	</da:guideline-set>
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- TODO                                                              -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<da:guideline-set name="A5 Letter">
		<da:guideline type="horizontal" position="0.5906in"/>
		<da:guideline type="horizontal" position="7.6772in"/>
		<da:guideline type="vertical" position="0.5906in"/>
		<da:guideline type="vertical" position="5.2362in"/>
	</da:guideline-set>

    <!-- ================================================================= -->
    <!-- processing instructions with PITarget "templateDesigner"          -->
    <!-- ================================================================= -->
	<xsl:template match="processing-instruction('templateDesigner')">
	</xsl:template>
			
</xsl:stylesheet>
