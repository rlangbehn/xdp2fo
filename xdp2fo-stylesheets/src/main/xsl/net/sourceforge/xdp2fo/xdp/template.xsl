<?xml version="1.0" encoding="UTF-8"?>
<!--
 | $Id: template.xsl,v 1.13 2008/07/15 10:28:51 rlangbehn Exp $
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
 | Version: $Revision: 1.13 $ $Date: 2008/07/15 10:28:51 $
 | Author:  Rainer Langbehn, rlangbehn@users.sourceforge.net
 +-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xft="http://www.xfa.org/schema/xfa-template/2.5/"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:log="http://xdp2fo.sourceforge.net/logging"
	exclude-result-prefixes="log xft"
	version="1.0">

	<xsl:include href="../debug/drawing-aids.xsl"/>
	<xsl:include href="../util/xhtml.xsl"/>

	<xsl:include href="properties/common.xsl"/>
	
	<xsl:include href="elements/arc.xsl"/>
	<xsl:include href="elements/area.xsl"/>
	<xsl:include href="elements/assist.xsl"/>
	<xsl:include href="elements/barcode.xsl"/>
	<xsl:include href="elements/bind.xsl"/>
	<xsl:include href="elements/bindItems.xsl"/>
	<xsl:include href="elements/bookend.xsl"/>
	<xsl:include href="elements/boolean.xsl"/>
	<xsl:include href="elements/border.xsl"/>
	<xsl:include href="elements/break.xsl"/>
	<xsl:include href="elements/breakAfter.xsl"/>
	<xsl:include href="elements/breakBefore.xsl"/>
	<xsl:include href="elements/button.xsl"/>
	<xsl:include href="elements/calculate.xsl"/>
	<xsl:include href="elements/caption.xsl"/>
	<xsl:include href="elements/certificate.xsl"/>
	<xsl:include href="elements/certificates.xsl"/>
	<xsl:include href="elements/checkButton.xsl"/>
	<xsl:include href="elements/choiceList.xsl"/>
	<xsl:include href="elements/color.xsl"/>
	<xsl:include href="elements/comb.xsl"/>
	<xsl:include href="elements/connect.xsl"/>
	<xsl:include href="elements/contentArea.xsl"/>
	<xsl:include href="elements/corner.xsl"/>
	<xsl:include href="elements/date.xsl"/>
	<xsl:include href="elements/dateTime.xsl"/>
	<xsl:include href="elements/dateTimeEdit.xsl"/>
	<xsl:include href="elements/decimal.xsl"/>
	<xsl:include href="elements/defaultUI.xsl"/>
	<xsl:include href="elements/desc.xsl"/>
	<xsl:include href="elements/digestMethod.xsl"/>
	<xsl:include href="elements/digestMethods.xsl"/>
	<xsl:include href="elements/draw.xsl"/>
	<xsl:include href="elements/edge.xsl"/>
	<xsl:include href="elements/encoding.xsl"/>
	<xsl:include href="elements/encodings.xsl"/>
	<xsl:include href="elements/encrypt.xsl"/>
	<xsl:include href="elements/event.xsl"/>
	<xsl:include href="elements/exclGroup.xsl"/>
	<xsl:include href="elements/exData.xsl"/>
	<xsl:include href="elements/execute.xsl"/>
	<xsl:include href="elements/exObject.xsl"/>
	<xsl:include href="elements/extras.xsl"/>
	<xsl:include href="elements/field.xsl"/>
	<xsl:include href="elements/fill.xsl"/>
	<xsl:include href="elements/filter.xsl"/>
	<xsl:include href="elements/float.xsl"/>
	<xsl:include href="elements/font.xsl"/>
	<xsl:include href="elements/format.xsl"/>
	<xsl:include href="elements/handler.xsl"/>
	<xsl:include href="elements/image.xsl"/>
	<xsl:include href="elements/imageEdit.xsl"/>
	<xsl:include href="elements/integer.xsl"/>
	<xsl:include href="elements/issuers.xsl"/>
	<xsl:include href="elements/items.xsl"/>
	<xsl:include href="elements/keep.xsl"/>
	<xsl:include href="elements/keyUsage.xsl"/>
	<xsl:include href="elements/line.xsl"/>
	<xsl:include href="elements/linear.xsl"/>
	<xsl:include href="elements/manifest.xsl"/>
	<xsl:include href="elements/margin.xsl"/>
	<xsl:include href="elements/mdp.xsl"/>
	<xsl:include href="elements/medium.xsl"/>
	<xsl:include href="elements/message.xsl"/>
	<xsl:include href="elements/numericEdit.xsl"/>
	<xsl:include href="elements/occur.xsl"/>
	<xsl:include href="elements/oid.xsl"/>
	<xsl:include href="elements/oids.xsl"/>
	<xsl:include href="elements/overflow.xsl"/>
	<xsl:include href="elements/pageArea.xsl"/>
	<xsl:include href="elements/pageSet.xsl"/>
	<xsl:include href="elements/para.xsl"/>
	<xsl:include href="elements/passwordEdit.xsl"/>
	<xsl:include href="elements/pattern.xsl"/>
	<xsl:include href="elements/picture.xsl"/>
	<xsl:include href="elements/proto.xsl"/>
	<xsl:include href="elements/radial.xsl"/>
	<xsl:include href="elements/reason.xsl"/>
	<xsl:include href="elements/reasons.xsl"/>
	<xsl:include href="elements/rectangle.xsl"/>
	<xsl:include href="elements/ref.xsl"/>
	<xsl:include href="elements/script.xsl"/>
	<xsl:include href="elements/setProperty.xsl"/>
	<xsl:include href="elements/signature.xsl"/>
	<xsl:include href="elements/signData.xsl"/>
	<xsl:include href="elements/signing.xsl"/>
	<xsl:include href="elements/solid.xsl"/>
	<xsl:include href="elements/speak.xsl"/>
	<xsl:include href="elements/stipple.xsl"/>
	<xsl:include href="elements/subform.xsl"/>
	<xsl:include href="elements/subformSet.xsl"/>
	<xsl:include href="elements/subjectDN.xsl"/>
	<xsl:include href="elements/subjectDNs.xsl"/>
	<xsl:include href="elements/submit.xsl"/>
	<xsl:include href="elements/text.xsl"/>
	<xsl:include href="elements/textEdit.xsl"/>
	<xsl:include href="elements/time.xsl"/>
	<xsl:include href="elements/timeStamp.xsl"/>
	<xsl:include href="elements/toolTip.xsl"/>
	<xsl:include href="elements/traversal.xsl"/>
	<xsl:include href="elements/traverse.xsl"/>
	<xsl:include href="elements/ui.xsl"/>
	<xsl:include href="elements/validate.xsl"/>
	<xsl:include href="elements/value.xsl"/>
	<xsl:include href="elements/variables.xsl"/>
	
	<!-- ================================================================= -->
	<!-- template element                                                  -->
	<!-- ================================================================= -->
	<xsl:template match="xft:template">
		<xsl:call-template name="log:trace" />
		<fo:root>
			<!-- properties -->
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates select="xft:extras" />
			<!-- children -->
			<xsl:apply-templates select="xft:subform" />
		</fo:root>
	</xsl:template>

	<!-- ================================================================= -->
	<!-- template element properties                                       -->
	<!-- ================================================================= -->
	<xsl:template match="xft:template/@baseProfile">
        <xsl:call-template name="log:trace">
        	<xsl:with-param name="message" select="'TODO'" />
        </xsl:call-template>
	</xsl:template>
	
</xsl:stylesheet>
