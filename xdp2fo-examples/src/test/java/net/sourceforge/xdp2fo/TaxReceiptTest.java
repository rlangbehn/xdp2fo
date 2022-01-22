/*****************************************************************************
 * $Id: TaxReceiptTest.java,v 1.4 2008/07/12 10:29:11 rlangbehn Exp $
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

/**
 * TODO
 * 
 * @version $Revision: 1.4 $ $Date: 2008/07/12 10:29:11 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public class TaxReceiptTest extends AbstractTransformationTest
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
	public TaxReceiptTest(String name) {
		super(name);
	}

    // TestCase overrides ----------------------------------------------------

    // Public ----------------------------------------------------------------

    /**
     * TODO
     * 
     * @throws Exception
     */
    public void testPrintTaxReceiptIF() throws Exception {
//    	runTest(
//    			"/com/adobe/designer/samples/forms/Tax Receipt.xsl",
//    			"/com/adobe/designer/samples/data/Tax Receipt.xml",
//    			"target/test-classes/com/adobe/designer/samples/outputs/Tax Receipt.xif",
//    			"application/X-fop-areatree"
//    	);
    }

    /**
     * TODO
     * 
     * @throws Exception
     */
    public void testPrintTaxReceipt() throws Exception {
    	runTest(
    			"/com/adobe/designer/samples/forms/Tax Receipt.xsl",
    			"/com/adobe/designer/samples/data/Tax Receipt.xml",
    			"target/test-output/com/adobe/designer/samples/outputs/Tax Receipt.pdf",
    			"application/pdf"
    	);
    }

    /**
     * TODO
     * 
     * @throws Exception
     */
    public void testPrintTaxReceiptRef() throws Exception {
    	runTest(
    			"/com/adobe/designer/samples/forms/Tax Receipt Ref.xsl",
    			"/com/adobe/designer/samples/data/Tax Receipt.xml",
    			"target/test-output/com/adobe/designer/samples/outputs/Tax Receipt Ref.pdf",
    			"application/pdf"
    	);
    }

    // Package protected -----------------------------------------------------

    // Protected -------------------------------------------------------------

    // Private ---------------------------------------------------------------

    // Inner classes ---------------------------------------------------------
}
