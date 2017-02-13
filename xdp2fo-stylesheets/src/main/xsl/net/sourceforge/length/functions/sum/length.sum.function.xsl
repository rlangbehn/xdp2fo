<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
    xmlns:func="http://exslt.org/functions"
	xmlns:length="http://xdp2fo.sourceforge.net/Length"
    extension-element-prefixes="exsl func"
    exclude-result-prefixes="length"
	version="1.0">
	
    <!-- ================================================================= -->
    <!--                                                                   -->
    <!-- ================================================================= -->
	<exsl:function name="length:sum">
		<xsl:param name="nodes" select="/.." />
   		<xsl:choose>
      		<xsl:when test="not($nodes)">
         		<func:return select="'0in'" />
      		</xsl:when>
    		<xsl:when test="not(function-available('exsl:node-set'))">
      			<xsl:message terminate="yes">
        			ERROR: XDP2FO - Functions implementation of length:sum relies on exsl:node-set().
      			</xsl:message>
    		</xsl:when>
      		<xsl:otherwise>
      			<xsl:variable name="values">
         			<xsl:for-each select="$nodes">
         				<value>
         					<xsl:call-template name="length:_convertToInches">
         						<xsl:with-param name="measurement" select="."/>
         					</xsl:call-template>
         				</value>
         			</xsl:for-each>
      			</xsl:variable>
      			<func:return select="conact(sum(exsl:node-set($values)/value), 'in')"/>
      		</xsl:otherwise>
   		</xsl:choose>
	</exsl:function>

    <!-- ================================================================= -->
    <!-- length:_convertToInches                                           -->
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
	<xsl:template name="length:_convertToInches">
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
				<xsl:call-template name="length:_roundDouble">
					<xsl:with-param name="source" select="$value * $scaling-factor" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

    <!-- ================================================================= -->
    <!-- length:_roundDouble                                               -->
    <!-- ================================================================= -->
	<xsl:template name="length:_roundDouble">
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

</xsl:stylesheet>
