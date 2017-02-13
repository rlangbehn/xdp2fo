/*****************************************************************************
 * $Id: AbstractTransformationTest.java,v 1.5 2008/07/12 10:29:11 rlangbehn Exp $
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

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import junit.framework.TestCase;
import net.sourceforge.xdp2fo.util.IOUtil;

import org.xml.sax.ContentHandler;

/**
 * TODO
 * 
 * @version $Revision: 1.5 $ $Date: 2008/07/12 10:29:11 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public abstract class AbstractTransformationTest extends TestCase
{
    // Constants -------------------------------------------------------------

    // Attributes ------------------------------------------------------------

    // Static ----------------------------------------------------------------

    // Constructors ----------------------------------------------------------

    /**
     * Creates a test case with the given name.
     *
     * @param name
     */
	protected AbstractTransformationTest(String name) {
		super(name);
	}

    // TestCase overrides ----------------------------------------------------

    // Public ----------------------------------------------------------------

    // Package protected -----------------------------------------------------

    // Protected -------------------------------------------------------------

	/**
	 * TODO
	 * 
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	protected OutputStream createOutputStream(String fileName)
	throws Exception {
        File file = new File(fileName);
        File dir = file.getParentFile();

        if (!dir.exists()) {
        	boolean created = dir.mkdirs();
    		assertEquals("successfully created expected", true, created);
        }
        
        if (file.exists()) {
        	boolean deleted = file.delete();
    		assertEquals("successfully deleted expected", true, deleted);
        }

		return new BufferedOutputStream(new FileOutputStream(file));
	}

	/**
	 * TODO
	 * 
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	protected Source createSource(String fileName)
	throws Exception {
        URL url = getClass().getResource(fileName);
        assertNotNull("Testresource '" + fileName + "' not found", url);

        return new StreamSource(url.toExternalForm());
	}

	/**
	 * TODO
	 * 
	 * @param xslSource
	 * @return
	 */
	protected Templates createTemplates(Source xslSource)
	throws Exception {
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		return transformerFactory.newTemplates(xslSource);
	}
    
	/**
	 * TODO
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	protected XSLProcessorAdapter createXSLProcessorAdapter()
	throws Exception {

		String className = System.getProperty(
				"net.sourceforge.xdp2fo.XSLProcessorAdapter",
				"net.sourceforge.xdp2fo.FOPAdapter"
		);
        assertNotNull("className shouldn't be null", className);

        ClassLoader cL = Thread.currentThread().getContextClassLoader();
        Class clazz = cL.loadClass(className);
        assertNotNull("clazz shouldn't be null", clazz);

        return (XSLProcessorAdapter)clazz.newInstance();
	}

    /**
     * TODO
     *
     * @param xslFileName
     * @param xmlFileName
     * @param outputFileName
     * @param outputFormat
     * @throws Exception
     */
    protected void runTest(
            String xslFileName,
            String xmlFileName,
            String outputFileName,
            String outputFormat)
    throws Exception {
    	runTest(xslFileName, xmlFileName, outputFileName, outputFormat, null);
    }

    /**
     * TODO
     *
     * @param xslFileName
     * @param xmlFileName
     * @param outputFileName
     * @param outputFormat
     * @param params
     * @throws Exception
     */
    protected void runTest(
            String xslFileName,
            String xmlFileName,
            String outputFileName,
            String outputFormat,
            Map<String, String> params)
    throws Exception {
        
    	Source xslSource = createSource(xslFileName);
        assertNotNull("xslSource shouldn't be null", xslSource);

        Source xmlSource = createSource(xmlFileName);
        assertNotNull("xmlSource shouldn't be null", xmlSource);

        OutputStream out = createOutputStream(outputFileName);
        assertNotNull("out shouldn't be null", out);

        try {
        	String baseUri = xslSource.getSystemId();
            assertNotNull("baseUri shouldn't be null", baseUri);

            XSLProcessorAdapter adapter = createXSLProcessorAdapter();
            assertNotNull("adapter shouldn't be null", adapter);
            
            ContentHandler handler = adapter.createContentHandler(
            	baseUri, outputFormat, out
            );
            assertNotNull("contentHandler shouldn't be null", handler);
            
            Result result = new SAXResult(handler);
            assertNotNull("result shouldn't be null", result);

            if (params == null) {
            	params = new HashMap<String, String>();
            }

            params.put(
            		"xdp2fo.formatter.type",
            		adapter.getFormatterType()
            );
            
            params.put(
                	"xdp2fo.formatter.vendor-name",
                	adapter.getFormatterVendorName()
            );
                
            params.put(
            		"xdp2fo.formatter.vendor-url",
            		adapter.getFormatterVendorURL()
            );
            
            params.put(
            		"xdp2fo.formatter.version",
            		adapter.getFormatterVersion()
            );
            
        	runTest(xslSource, xmlSource, result, params);
        } finally {
        	IOUtil.close(out);
        }
    }

	/**
     * TODO
     * 
     * @param xslSource
     * @param xmlSource
     * @param result
     * @throws Exception
     */
    protected void runTest(
    		Source xslSource,
    		Source xmlSource,
    		Result result)
    throws Exception {
    	runTest(xslSource, xmlSource, result, null);
    }
    
    /**
     * TODO
     * 
     * @param xslSource
     * @param xmlSource
     * @param result
     * @param params
     * @throws Exception
     */
    protected void runTest(
    		Source xslSource,
    		Source xmlSource,
    		Result result,
    		Map<String, String> params)
    throws Exception {
    	
    	Templates templates = createTemplates(xslSource);
        assertNotNull("templates shouldn't be null", templates);
        
		Transformer transformer = templates.newTransformer();
        assertNotNull("transformer shouldn't be null", transformer);

        if (params != null) {
        	for (String name : params.keySet()) {
        		String value = params.get(name);
        		transformer.setParameter(name, value);
        	}
        }
        
		transformer.transform(xmlSource, result);

		// Release the transformer object
		transformer.clearParameters();
		transformer = null;
    }

    // Private ---------------------------------------------------------------

    // Inner classes ---------------------------------------------------------
}
