/*****************************************************************************
 * $Id: XEPAdapter.java,v 1.3 2008/07/12 10:29:11 rlangbehn Exp $
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
import java.net.URL;

import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;

import org.xml.sax.ContentHandler;

import com.renderx.xep.FOTarget;
import com.renderx.xep.FormatterImpl;
import com.renderx.xep.lib.ConfigurationException;

/**
 * TODO
 * 
 * @version $Revision: 1.3 $ $Date: 2008/07/12 10:29:11 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public class XEPAdapter implements XSLProcessorAdapter
{
    // Constants -------------------------------------------------------------

    // Attributes ------------------------------------------------------------

	/**
	 * TODO
	 */
	private static FormatterImpl formatter;
	
    // Static ----------------------------------------------------------------

	/**
	 * TODO
	 * 
	 * @return
	 */
	private static FormatterImpl createFormatter() {
		String configFileName = "/com/renderx/xep.xml";
		URL configURL = XEPAdapter.class.getResource(configFileName);
		Source configSource = new StreamSource(configURL.toExternalForm());
		
		try {
			return new FormatterImpl(configSource);
		} catch (ConfigurationException e) {
			String s = "Error while creating formatter instance";
			throw new RuntimeException(s, e);
		}
	}

	static {
		formatter = createFormatter();
	}
	
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
		
		if ("application/pdf".equals(outputFormat)) {
			outputFormat = "PDF";
		}
		
		FOTarget target = new FOTarget(outputStream, outputFormat);
		return formatter.createContentHandler(baseUri, target);
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterType()
	 */
	public String getFormatterType() {
		return "XEP";
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterVendorName()
	 */
	public String getFormatterVendorName() {
		return "RenderX, Inc.";
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterVendorURL()
	 */
	public String getFormatterVendorURL() {
		return "http://www.renderx.com/";
	}

	/* (non-Javadoc)
	 * @see net.sourceforge.xdp2fo.XSLProcessorAdapter#getFormatterVersion()
	 */
	public String getFormatterVersion() {
		return "4.12";
	}

    // Public ----------------------------------------------------------------

    // Package protected -----------------------------------------------------

    // Protected -------------------------------------------------------------

    // Private ---------------------------------------------------------------

    // Inner classes ---------------------------------------------------------
}
