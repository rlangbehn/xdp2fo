<?xml version="1.0"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:length="http://xdp2fo.sourceforge.net/Length"
    exclude-result-prefixes="length"
    version="1.0">

	<xsl:import href="length.sum.function.xsl"/>
	
	<xsl:template match="values">
   		<result>
      		<xsl:text>Sum: </xsl:text>
      		<xsl:value-of select="length:sum(value)" />
   		</result>
	</xsl:template>

</xsl:stylesheet>
