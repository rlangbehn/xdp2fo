/*****************************************************************************
 * $Id: FOPAdapter.java,v 1.4 2008/07/12 10:29:11 rlangbehn Exp $
 *
 * This file is part of the XSL XDP Stylesheet distribution xdp2fo.
 * See ../../../README.txt or http://xdp2fo.sourceforge.net/ for
 * copyright and other information.
 *
 * Copyright (c) 2007 The XDP To XSL-FO Development Team.
 * Also see acknowledgements in README.txt.
 *
 * xdp2fo is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 3 of
 * the License, or (at your option) any later version.
 *
 * xdp2fo is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ****************************************************************************/
package net.sourceforge.xdp2fo;

import java.io.OutputStream;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.fop.render.Renderer;
import org.apache.fop.render.xml.XMLRenderer;
import org.xml.sax.ContentHandler;

/**
 * TODO
 * 
 * @version $Revision: 1.4 $ $Date: 2008/07/12 10:29:11 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public class FOPAdapter implements XSLProcessorAdapter
{
    // Constants -------------------------------------------------------------

    // Attributes ------------------------------------------------------------

	/**
	 * TODO
	 */
	private static FopFactory fopFactory = FopFactory.newInstance();

    // Static ----------------------------------------------------------------

    // Constructors ----------------------------------------------------------

    // XSLProcessorAdapter implementation ------------------------------------

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#createContentHandler(java.lang.String, java.lang.String, java.io.OutputStream)
	 */
	public ContentHandler createContentHandler(
			String baseUri,
			String outputFormat,
			OutputStream outputStream)
	throws Exception {
		
		FOUserAgent userAgent = fopFactory.newFOUserAgent();
        userAgent.setBaseURL(baseUri);

        if ("application/X-fop-areatree".equals(outputFormat)) {
            //Create an instance of the target renderer so the XMLRenderer can use its font setup
            Renderer targetRenderer = userAgent.getRendererFactory().createRenderer(
                    userAgent, MimeConstants.MIME_PDF); 
            
            //Create the XMLRenderer to create the intermediate format (area tree XML)
            XMLRenderer xmlRenderer = new XMLRenderer();
            xmlRenderer.setUserAgent(userAgent);
            
            //Tell the XMLRenderer to mimic the target renderer
            xmlRenderer.mimicRenderer(targetRenderer);
            
            //Make sure the prepared XMLRenderer is used
            userAgent.setRendererOverride(xmlRenderer);
        }
        
        Fop fop = fopFactory.newFop(outputFormat, userAgent, outputStream);
        return fop.getDefaultHandler();
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterType()
	 */
	public String getFormatterType() {
		return "FOP";
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterVendorName()
	 */
	public String getFormatterVendorName() {
		return "The Apache Software Foundation (Apache FOP)";
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterVendorURL()
	 */
	public String getFormatterVendorURL() {
		return "http://xmlgraphics.apache.org/fop/";
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterVersion()
	 */
	public String getFormatterVersion() {
		return "0.95beta";
	}

    // Public ----------------------------------------------------------------

    // Package protected -----------------------------------------------------

    // Protected -------------------------------------------------------------

    // Private ---------------------------------------------------------------

    // Inner classes ---------------------------------------------------------
}
