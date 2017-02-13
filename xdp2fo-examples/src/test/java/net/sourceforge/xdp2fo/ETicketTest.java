/*****************************************************************************
 * $Id: ETicketTest.java,v 1.6 2008/07/13 15:37:12 rlangbehn Exp $
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
 * @version $Revision: 1.6 $ $Date: 2008/07/13 15:37:12 $
 * @author <a href="mailto:rlangbehn@users.sourceforge.net">Rainer Langbehn</a>
 */
public class ETicketTest extends AbstractTransformationTest
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
	public ETicketTest(String name) {
		super(name);
	}

    // TestCase overrides ----------------------------------------------------

    // Public ----------------------------------------------------------------

    /**
     * TODO
     * 
     * @throws Exception
     */
    public void testPrintETicketIF() throws Exception {
//    	runTest(
//    			"/com/adobe/designer/samples/forms/E-Ticket.xsl",
//    			"/com/adobe/designer/samples/data/E-Ticket.xml",
//    			"target/test-classes/com/adobe/designer/samples/outputs/E-Ticket.xif",
//    			"application/X-fop-areatree"
//    	);
    }

    /**
     * TODO
     * 
     * @throws Exception
     */
    public void testPrintETicket() throws Exception {
    	runTest(
    			"/com/adobe/designer/samples/forms/E-Ticket.xsl",
    			"/com/adobe/designer/samples/data/E-Ticket.xml",
    			"target/test-classes/com/adobe/designer/samples/outputs/E-Ticket.pdf",
    			"application/pdf"
    	);
    }

    // Package protected -----------------------------------------------------

    // Protected -------------------------------------------------------------

    // Private ---------------------------------------------------------------

    // Inner classes ---------------------------------------------------------
}
