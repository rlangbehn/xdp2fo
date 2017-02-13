<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	extension-element-prefixes="date">

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

	<xsl:attribute-set name="page-size">
		<xsl:attribute name="page-height">
			<xsl:value-of select="'11in'" />
		</xsl:attribute>
		<xsl:attribute name="page-width">
			<xsl:value-of select="'8.5in'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="page-margins">
		<xsl:attribute name="margin-top">
			<xsl:value-of select="'0in'" />
		</xsl:attribute>
		<xsl:attribute name="margin-bottom">
			<xsl:value-of select="'0in'" />
		</xsl:attribute>
		<xsl:attribute name="margin-left">
			<xsl:value-of select="'0in'" />
		</xsl:attribute>
		<xsl:attribute name="margin-right">
			<xsl:value-of select="'0in'" />
		</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="region-body">
		<xsl:attribute name="region-name">
            <xsl:value-of select="'xsl-region-body'" />
        </xsl:attribute>
		<xsl:attribute name="margin-top">
            <xsl:value-of select="'0.75in'" />
        </xsl:attribute>
		<xsl:attribute name="margin-bottom">
            <xsl:value-of select="'1in'" />
        </xsl:attribute>
		<xsl:attribute name="margin-left">
            <xsl:value-of select="'0.75in'" />
        </xsl:attribute>
		<xsl:attribute name="margin-right">
            <xsl:value-of select="'0.75in'" />
        </xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="region-before">
		<xsl:attribute name="region-name">
            <xsl:value-of select="'xsl-region-before'" />
        </xsl:attribute>
		<xsl:attribute name="extent">
            <xsl:value-of select="'0.75in'" />
        </xsl:attribute>
		<xsl:attribute name="precedence">
        	<xsl:value-of select="'true'" />
        </xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="region-after">
		<xsl:attribute name="region-name">
            <xsl:value-of select="'xsl-region-after'" />
        </xsl:attribute>
		<xsl:attribute name="extent">
            <xsl:value-of select="'1in'" />
        </xsl:attribute>
		<xsl:attribute name="precedence">
        	<xsl:value-of select="'true'" />
        </xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="region-start">
		<xsl:attribute name="region-name">
            <xsl:value-of select="'xsl-region-start'" />
        </xsl:attribute>
		<xsl:attribute name="extent">
            <xsl:value-of select="'0.75in'" />
        </xsl:attribute>
		<xsl:attribute name="precedence">
        	<xsl:value-of select="'false'" />
        </xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="region-end">
		<xsl:attribute name="region-name">
            <xsl:value-of select="'xsl-region-end'" />
        </xsl:attribute>
		<xsl:attribute name="extent">
            <xsl:value-of select="'0.75in'" />
        </xsl:attribute>
		<xsl:attribute name="precedence">
        	<xsl:value-of select="'false'" />
        </xsl:attribute>
	</xsl:attribute-set>

	<xsl:template match="purchaseOrder">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Page1"
					xsl:use-attribute-sets="page-size page-margins">
					<fo:region-body
						xsl:use-attribute-sets="region-body" />
					<fo:region-before
						xsl:use-attribute-sets="region-before" />
					<fo:region-after
						xsl:use-attribute-sets="region-after" />
					<fo:region-start
						xsl:use-attribute-sets="region-start" />
					<fo:region-end xsl:use-attribute-sets="region-end" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:declarations>
<!--			
				<x:xmpmeta xmlns:x="adobe:ns:meta/"
					x:xmptk="Adobe XMP Core 4.0-c319 44.281645, Sun Mar 25 2007 16:17:34">
					<rdf:RDF
						xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
						<rdf:Description
							xmlns:xap="http://ns.adobe.com/xap/1.0/" rdf:about="">
							<xap:MetadataDate>
								2008-05-03T22:50:51Z
							</xap:MetadataDate>
							<xap:CreatorTool>
								Adobe LiveCycle Designer ES 8.1
							</xap:CreatorTool>
						</rdf:Description>
						<rdf:Description
							xmlns:pdf="http://ns.adobe.com/pdf/1.3/" rdf:about="">
							<pdf:Producer>
								Adobe LiveCycle Designer ES 8.1
							</pdf:Producer>
						</rdf:Description>
						<rdf:Description
							xmlns:xapMM="http://ns.adobe.com/xap/1.0/mm/" rdf:about="">
							<xapMM:DocumentID>
								uuid:a7c392e0-5e2f-11d8-9e6d-00d0b7babdf6
							</xapMM:DocumentID>
						</rdf:Description>
						<rdf:Description
							xmlns:dc="http://purl.org/dc/elements/1.1/" rdf:about="">
							<dc:description>
								<rdf:Alt>
									<rdf:li xml:lang="x-default">
										Adobe LiveCycle Designer Sample
									</rdf:li>
								</rdf:Alt>
							</dc:description>
							<dc:title>
								<rdf:Alt>
									<rdf:li xml:lang="x-default">
										Purchase Order
									</rdf:li>
								</rdf:Alt>
							</dc:title>
						</rdf:Description>
						<rdf:Description
							xmlns:desc="http://ns.adobe.com/xfa/promoted-desc/"
							rdf:about="">
							<desc:contact rdf:parseType="Resource">
								<rdf:value>
									Adobe Systems Incorporated
								</rdf:value>
								<desc:ref>
									/template/subform[1]
								</desc:ref>
							</desc:contact>
						</rdf:Description>
					</rdf:RDF>
				</x:xmpmeta>
-->				
			</fo:declarations>

			<fo:page-sequence master-reference="Page1" id="page-sequence1">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block-container position="absolute" top="0.25in"
						left="4.25in" width="1.0in">
						<fo:block font-family="Times"
							font-size="7pt" text-align="center">
							<xsl:text>Finance Corporation</xsl:text>
						</fo:block>
					</fo:block-container>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block-container position="absolute" top="0.1in"
						left="0.75in" width="7in" border-bottom="0.5pt solid black">
						<fo:block font-family="Times"
							font-size="7pt" text-align="center">
							<xsl:text>Finance Corporation * 123, Any Ave * Any Town * Any Country * Phone: 111.222.3333 Fax: 111.222.4444 * www.financeCorporation.com</xsl:text>
						</fo:block>
					</fo:block-container>
					<fo:block-container position="absolute" top="0.3in"
						left="0.75in" width="7in" text-align="start">
						<fo:block font-family="Times"
							font-size="7pt" text-align="center"
							linefeed-treatment="preserve">
							<xsl:text>Any reference to company names and company logos in the sample forms included in this software is for demonstration purposes only and is not intended 
to refer to any actual organization.</xsl:text>
						</fo:block>
					</fo:block-container>
					<fo:block-container position="absolute" top="0.6in"
						left="4.25in">
						<fo:block font-family="Times"
							font-size="7pt">
							<xsl:text>Page </xsl:text>
							<fo:page-number />
							<xsl:text> of </xsl:text>
							<fo:page-number-citation-last ref-id="page-sequence1" />
						</fo:block>
					</fo:block-container>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block-container border-color="rgb(128,128,255)"
						border-style="dashed" border-width="0.25pt" width="7in">
						<fo:block-container border-color="rgb(128,128,255)"
							border-style="dashed" border-width="0.25pt" height="3.7in"
							width="7in">
							<fo:block-container border-color="rgb(128,128,255)"
								border-style="dashed" border-width="0.25pt" position="absolute"
								top="0in" left="0in" height="0.9361in" width="2.0338in">
								<fo:block>
									<fo:external-graphic
										src="url('../images/Purchase Order.tif')" />
								</fo:block>
							</fo:block-container>
							<fo:block-container border-color="rgb(128,128,255)"
								border-style="dashed" border-width="0.25pt" position="absolute"
								top="31.75mm" left="0mm" min-height="0mm" min-width="0mm">
								<fo:block font-family="Times"
									font-size="20.0pt" font-weight="bold">
									<xsl:text>Purchase Order</xsl:text>
								</fo:block>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="39.37mm" left="107.95mm" height="7.62mm" width="50.8mm">
								<fo:table table-layout="fixed" width="50.8mm">
									<fo:table-column
										column-width="0.8in" />
									<fo:table-column
										column-width="1.2in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9.0pt">
													<xsl:text>P.O. Number</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="12.0pt"
													font-weight="bold" font-style="italic">
													<xsl:value-of
														select="general/poNum" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="45.72mm" left="107.95mm" height="6.35mm" width="50.8mm">
								<fo:table table-layout="fixed" width="50.8mm">
									<fo:table-column
										column-width="0.8in" />
									<fo:table-column
										column-width="1.2in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9.0pt">
													<xsl:text>P.O. Date</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9.0pt"
													font-style="italic">
													<!--xsl:value-of
														select="date:format-date(general/poDate, 'MMM dd, yyyy')" /-->
													<xsl:value-of select="general/poDate"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="57.15mm" left="0mm" height="20.32mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="2.75in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center" height="3.81mm">
												<fo:block
													font-family="Times" font-size="9.0pt"
													font-weight="bold">
													<xsl:text>Ordered By</xsl:text>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center" height="3.81mm">
												<fo:block
													font-family="Times" font-size="9.0pt"
													linefeed-treatment="preserve">
													<xsl:value-of
														select="order/companyName" />
													<xsl:text>&#xA;</xsl:text>
													<xsl:value-of
														select="order/address" />
													<xsl:text>&#xA;</xsl:text>
													<xsl:value-of
														select="order/city" />
													<xsl:text>, </xsl:text>
													<xsl:value-of
														select="order/stateProv" />
													<xsl:text>, </xsl:text>
													<xsl:value-of
														select="order/zipCode" />
													<xsl:text>&#xA;</xsl:text>
													<xsl:value-of
														select="order/country" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="80.01mm" left="0mm" height="6.35mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="0.9in" />
									<fo:table-column
										column-width="1.85in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:text>Phone Number:</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:value-of
														select="order/phone" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="83.82mm" left="0mm" height="6.35mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="0.9in" />
									<fo:table-column
										column-width="1.85in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:text>Fax Number:</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:value-of
														select="order/fax" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="87.63mm" left="0mm" height="6.35mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="0.9in" />
									<fo:table-column
										column-width="1.85in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:text>Contact Name:</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:value-of
														select="order/contactName" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container position="absolute"
								top="57.15mm" left="107.95mm" height="20.32mm"
								width="69.85mm">
								<fo:table table-layout="fixed" width="20.32mm">
									<fo:table-column
										column-width="2.75in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center" height="3.81mm">
												<fo:block
													font-family="Times" font-size="9.0pt"
													font-weight="bold">
													<xsl:text>Deliver To</xsl:text>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row>
											<fo:table-cell border-color="rgb(255,128,0)"
												border-style="solid" border-width="0.25pt"
												display-align="center" height="3.81mm">
												<fo:block
													font-family="Times" font-size="9.0pt"
													linefeed-treatment="preserve">
													<xsl:value-of
														select="delivery/companyName" />
													<xsl:text>&#xA;</xsl:text>
													<xsl:value-of
														select="delivery/address" />
													<xsl:text>&#xA;</xsl:text>
													<xsl:value-of
														select="delivery/city" />
													<xsl:text>, </xsl:text>
													<xsl:value-of
														select="delivery/stateProv" />
													<xsl:text>, </xsl:text>
													<xsl:value-of
														select="delivery/zipCode" />
													<xsl:text>&#xA;</xsl:text>
													<xsl:value-of
														select="delivery/country" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="80.01mm" left="107.95mm" height="6.35mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="0.9in" />
									<fo:table-column
										column-width="1.85in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:text>Phone Number:</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:value-of
														select="delivery/phone" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="83.82mm" left="107.95mm" height="6.35mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="0.9in" />
									<fo:table-column
										column-width="1.85in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:text>Fax Number:</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:value-of
														select="delivery/fax" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
							<fo:block-container border-color="rgb(255,128,0)"
								border-style="solid" border-width="0.25pt" position="absolute"
								top="87.63mm" left="107.95mm" height="6.35mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column
										column-width="0.9in" />
									<fo:table-column
										column-width="1.85in" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:text>Contact Name:</xsl:text>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell
												display-align="center">
												<fo:block
													font-family="Times" font-size="9pt">
													<xsl:value-of
														select="delivery/contactName" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
						</fo:block-container>
						<fo:table border="0.0069in solid black"
							border-collapse="collapse" table-omit-header-at-break="false"
							table-omit-footer-at-break="true" table-layout="fixed"
							margin-top="12.7mm" width="7in">
							<fo:table-column column-width="25.4mm" />
							<fo:table-column column-width="3.250005in" />
							<fo:table-column column-width="19.05mm" />
							<fo:table-column column-width="25.4mm" />
							<fo:table-column column-width="25.4mm" />
							<fo:table-header
								background-color="rgb(192,192,192)">
								<fo:table-row height="6.35mm">
									<fo:table-cell
										border="0.0069in solid black" display-align="center">
										<fo:block
											font-family="Times" font-size="9pt" font-weight="bold"
											text-align="center">
											<xsl:text>Part No.</xsl:text>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell
										border="0.0069in solid black" display-align="center">
										<fo:block
											font-family="Times" font-size="9pt" font-weight="bold"
											text-align="center">
											<xsl:text>Description</xsl:text>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell
										border="0.0069in solid black" display-align="center">
										<fo:block
											font-family="Times" font-size="9pt" font-weight="bold"
											text-align="center">
											<xsl:text>Quantity</xsl:text>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell
										border="0.0069in solid black" display-align="center">
										<fo:block
											font-family="Times" font-size="9pt" font-weight="bold"
											text-align="center">
											<xsl:text>Unit Price</xsl:text>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell
										border="0.0069in solid black" display-align="center">
										<fo:block
											font-family="Times" font-size="9pt" font-weight="bold"
											text-align="center">
											<xsl:text>Amount</xsl:text>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
							<fo:table-footer>
								<fo:table-row>
									<fo:table-cell
										border="0.0069in solid black" number-columns-spanned="2">
										<fo:table margin-left="0.039in"
											margin-right="0.039in" table-layout="fixed" width="100%">
											<fo:table-body>
												<fo:table-row
													height="0.25in">
													<fo:table-cell
														display-align="center">
														<fo:block
															font-family="Times" font-size="9pt"
															font-weight="bold">
															<xsl:text>Terms and Conditions</xsl:text>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell>
														<fo:block
															font-family="Times" font-size="9pt"
															linefeed-treatment="preserve">
															<xsl:value-of
																select="terms/termsCondition" />
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</fo:table-body>
										</fo:table>
									</fo:table-cell>
									<fo:table-cell
										border="0.0069in solid black" number-columns-spanned="3">
										<xsl:variable name="numTotal">
											<xsl:call-template name="numTotal">
												<xsl:with-param name="items" select="item/item"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable
											name="numStateTax">
											<xsl:value-of
												select="$numTotal * (tax/stateTaxRate div 100)" />
										</xsl:variable>
										<xsl:variable
											name="numFederalTax">
											<xsl:value-of
												select="$numTotal * (tax/federalTaxRate div 100)" />
										</xsl:variable>
										<xsl:variable
											name="numGrandTotal">
											<xsl:value-of
												select="$numTotal + $numStateTax + $numFederalTax + shipping/shippingCharge" />
										</xsl:variable>
										<fo:table table-layout="fixed"
											width="69.85mm">
											<fo:table-column
												column-width="44.45mm" />
											<fo:table-column
												column-width="25.4mm" />
											<fo:table-body>
												<fo:table-row
													height="6.35mm">
													<fo:table-cell
														number-columns-spanned="2">
														<fo:table table-layout="fixed" width="69.85mm">
															<fo:table-column
																column-width="44.45mm" />
															<fo:table-column
																column-width="25.4mm" />
															<fo:table-body>
																<fo:table-row
																	height="6.35mm">
																	<fo:table-cell
																		display-align="center">
																		<fo:block
																			text-align="right" font-family="Times"
																			font-size="9pt" font-weight="bold">
																			<xsl:text>Total     </xsl:text>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell
																		display-align="center">
																		<fo:block margin-left="1mm" margin-right="1mm"
																			text-align="right" font-family="Times"
																			font-size="9pt" font-weight="bold">
																			<xsl:value-of
																				select="format-number($numTotal, '$#,###,##0.00')" />
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
															</fo:table-body>
														</fo:table>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row
													height="6.35mm">
													<fo:table-cell
														display-align="center">
														<fo:block
															text-align="right" font-family="Times" font-size="9pt">
															<xsl:variable
																name="format">
																<xsl:text>State Tax @ #0.00'%'</xsl:text>
															</xsl:variable>
															<xsl:value-of
																select="format-number(tax/stateTaxRate, $format)" />
														</fo:block>
													</fo:table-cell>
													<fo:table-cell
														display-align="center">
														<fo:block margin-left="1mm" margin-right="1mm"
															text-align="right" font-family="Times" font-size="9pt">
															<xsl:value-of
																select="format-number($numStateTax, '$#,###,##0.00')" />
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row
													height="6.35mm">
													<fo:table-cell
														display-align="center">
														<fo:block
															text-align="right" font-family="Times" font-size="9pt">
															<xsl:variable
																name="format">
																<xsl:text>Federal Tax @ #0.00'%'</xsl:text>
															</xsl:variable>
															<xsl:value-of
																select="format-number(tax/federalTaxRate, $format)" />
														</fo:block>
													</fo:table-cell>
													<fo:table-cell
														display-align="center">
														<fo:block margin-left="1mm" margin-right="1mm"
															text-align="right" font-family="Times" font-size="9pt">
															<xsl:value-of
																select="format-number($numFederalTax, '$#,###,##0.00')" />
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row
													height="6.35mm">
													<fo:table-cell
														number-columns-spanned="2">
														<fo:table table-layout="fixed" width="69.85mm">
															<fo:table-column
																column-width="44.45mm" />
															<fo:table-column
																column-width="25.4mm" />
															<fo:table-body>
																<fo:table-row height="6.35mm">
																	<fo:table-cell
																		display-align="center">
																		<fo:block
																			text-align="right" font-family="Times"
																			font-size="9pt">
																			<xsl:text>Shipping Charge</xsl:text>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell
																		display-align="center">
																		<fo:block margin-left="1mm" margin-right="1mm"
																			text-align="right" font-family="Times"
																			font-size="9pt">
																			<xsl:value-of
																				select="format-number(shipping/shippingCharge, '$#,###,##0.00')" />
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
															</fo:table-body>
														</fo:table>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row
													height="6.35mm">
													<fo:table-cell
														number-columns-spanned="2">
														<fo:table table-layout="fixed" width="69.85mm">
															<fo:table-column
																column-width="44.45mm" />
															<fo:table-column
																column-width="25.4mm" />
															<fo:table-body>
																<fo:table-row height="6.35mm">
																	<fo:table-cell
																		display-align="center">
																		<fo:block
																			text-align="right" font-family="Times"
																			font-size="9pt" font-weight="bold">
																			<xsl:text>Grand Total</xsl:text>
																		</fo:block>
																	</fo:table-cell>
																	<fo:table-cell
																		display-align="center">
																		<fo:block margin-left="1mm" margin-right="1mm"
																			text-align="right" font-family="Times"
																			font-size="9pt" font-weight="bold">
																			<xsl:value-of
																				select="format-number($numGrandTotal, '$#,###,##0.00')" />
																		</fo:block>
																	</fo:table-cell>
																</fo:table-row>
															</fo:table-body>
														</fo:table>
													</fo:table-cell>
												</fo:table-row>
											</fo:table-body>
										</fo:table>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-footer>
							<fo:table-body>
								<xsl:for-each select="item/item">
									<fo:table-row height="6.35mm">
										<fo:table-cell
											border="0.0069in solid black" display-align="center">
											<fo:block margin-left="1mm"
												margin-right="1mm" font-family="Times"
												font-size="9pt">
												<xsl:value-of
													select="partNum" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell
											border="0.0069in solid black" display-align="center">
											<fo:block margin-left="1mm"
												margin-right="1mm" font-family="Times"
												font-size="9pt">
												<xsl:value-of
													select="description" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell
											border="0.0069in solid black" display-align="center">
											<fo:block margin-left="1mm"
												margin-right="1mm" font-family="Times" font-size="9pt"
												text-align="right">
												<xsl:value-of
													select="format-number(quantity, '##0')" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell
											border="0.0069in solid black" display-align="center">
											<fo:block margin-left="1mm"
												margin-right="1mm" font-family="Times" font-size="9pt"
												text-align="right">
												<xsl:value-of
													select="format-number(unitPrice, '$#,###,##0.00')" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell
											border="0.0069in solid black" display-align="center">
											<fo:block margin-left="1mm"
												margin-right="1mm" font-family="Times" font-size="9pt"
												text-align="right">
												<xsl:variable
													name="numAmount">
													<xsl:value-of
														select="quantity * unitPrice" />
												</xsl:variable>
												<xsl:value-of
													select="format-number($numAmount, '$#,###,##0.00')" />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
						<fo:block-container border-color="rgb(128,128,255)"
							border-style="dashed" border-width="0.25pt" left="12.7mm" top="184.15mm"
							width="177.8mm" id="total_ID" height="27.94mm">
							<fo:block-container position="absolute"
								top="8.89mm" height="19.05mm" width="69.85mm">
								<fo:table table-layout="fixed" width="69.85mm">
									<fo:table-column column-width="69.85mm" />
									<fo:table-body>
										<fo:table-row>
											<fo:table-cell
												border-color="rgb(255,128,0)" border-style="solid"
												border-width="0.25pt" height="19.05mm - 6.35mm"
												display-align="center">
												<fo:block font-family="Times" font-size="9pt">
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row height="6.35mm">
											<fo:table-cell
												border-color="rgb(255,128,0)" border-style="solid"
												border-width="0.25pt" height="6.35mm"
												display-align="center">
												<fo:block font-family="Times" font-size="9pt" display-align="center">
													<xsl:text>Authorized By</xsl:text>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:block-container>
						</fo:block-container>
					</fo:block-container>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
	<xsl:template name="numTotal">
		<xsl:param name="items"/>
		<xsl:choose>
			<xsl:when test="$items">
				<xsl:variable name="item" select="$items[1]"/>
				<xsl:variable name="total">
					<xsl:call-template name="numTotal">
						<xsl:with-param name="items" select="$items[position != 1]"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$item/quantity * $item/unitPrice + $total"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
