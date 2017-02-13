/*****************************************************************************
 * $Id: IOUtil.java,v 1.2 2008/07/12 10:29:13 rlangbehn Exp $
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
package net.sourceforge.xdp2fo.util;

import java.io.Closeable;
import java.io.IOException;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 * IOUtil takes care of some of the more anoying IO tasks.
 * 
 * @version $Revision: 1.2 $ $Date: 2008/07/12 10:29:13 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public final class IOUtil
{
    // Constants -------------------------------------------------------------

    // Attributes ------------------------------------------------------------

    // Static ----------------------------------------------------------------

    /**
     * Unconditionally close the given <code>Closeable</code>.
     * <p>
     * Equivalent to {@link Closeable#close()}, except any exceptions will
     * be ignored. This is typically used in finally blocks.
     *
     * @param closeable the Closeable to be closed, may be null or already closed
     */
    public static void close(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            	// ignored
            }
        }
    }

    /**
	 * Unconditionally close the given <code>Result</code>.
	 * 
     * @param result the Result to be closed, may be null or already closed
     */
    public static void close(Result result) {
    	if (result != null) {
    		if (result instanceof StreamResult) {
    			close(((StreamResult)result).getOutputStream());
    			close(((StreamResult)result).getWriter());
    		}
    	}
    }
    
	/**
	 * Unconditionally close the given <code>Source</code>.
	 * 
	 * @param source the Source to be closed, may be null or already closed
	 */
	public static void close(Source source) {
		if (source != null) {
    		if (source instanceof StreamSource) {
    			close(((StreamSource)source).getInputStream());
    			close(((StreamSource)source).getReader());
    		}
		}
	}

    // Constructors ----------------------------------------------------------

    /**
     * Private default ctor to prevent instantiation. 
     */
    private IOUtil() {
    }

    // Public ----------------------------------------------------------------

    // Package protected -----------------------------------------------------

    // Protected -------------------------------------------------------------

    // Private ---------------------------------------------------------------

    // Inner classes ---------------------------------------------------------
}
