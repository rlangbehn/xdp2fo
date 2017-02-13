/*****************************************************************************
 * $Id: XSLProcessorAdapter.java,v 1.3 2008/07/12 10:29:11 rlangbehn Exp $
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

import org.xml.sax.ContentHandler;

/**
 * TODO
 * 
 * @version $Revision: 1.3 $ $Date: 2008/07/12 10:29:11 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public interface XSLProcessorAdapter
{
	/**
	 * TODO
	 * 
	 * @param baseUri
	 * @param outputFormat
	 * @param outputStream
	 * @return
	 * @throws Exception
	 */
	ContentHandler createContentHandler(
			String baseUri,
			String outputFormat,
			OutputStream outputStream)
	throws Exception;
	
	/**
	 * TODO
	 * 
	 * @return
	 */
	String getFormatterType();
	
	/**
	 * TODO
	 * 
	 * @return
	 */
	String getFormatterVendorName();

	/**
	 * TODO
	 * 
	 * @return
	 */
	String getFormatterVersion();
	
	/**
	 * TODO
	 * 
	 * @return
	 */
	String getFormatterVendorURL();
}
