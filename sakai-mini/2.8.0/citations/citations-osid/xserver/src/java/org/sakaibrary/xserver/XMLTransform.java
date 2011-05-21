/**********************************************************************************
 * $URL: https://source.sakaiproject.org/svn/citations/branches/sakai-2.8.0/citations-osid/xserver/src/java/org/sakaibrary/xserver/XMLTransform.java $
 * $Id: XMLTransform.java 59673 2009-04-03 23:02:03Z arwhyte@umich.edu $
 ***********************************************************************************
 *
 * Copyright (c) 2006, 2007, 2008 The Sakai Foundation
 *
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.osedu.org/licenses/ECL-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 **********************************************************************************/

package org.sakaibrary.xserver;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;
import org.w3c.dom.Document;

// For write operation
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;

public class XMLTransform {
	private static final org.apache.commons.logging.Log LOG =
		org.apache.commons.logging.LogFactory.getLog(
				"org.sakaibrary.xserver.XMLTransform" );
	
    private Document document;
    private String xslFileName;
    private ByteArrayOutputStream xml;
    private ByteArrayOutputStream transformedXml;

    public XMLTransform( String xslFile, ByteArrayOutputStream xml ) {
    	xslFileName = xslFile;
    	this.xml = xml;
    }
    
    public ByteArrayOutputStream transform() {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

        try {
            InputStream stylesheet = this.getClass().getResourceAsStream( xslFileName );
            
            DocumentBuilder builder = factory.newDocumentBuilder();
            document = builder.parse( new ByteArrayInputStream( xml.toByteArray() ) );

            // Use a Transformer for output
            TransformerFactory tFactory = TransformerFactory.newInstance();
            StreamSource stylesource = new StreamSource( stylesheet );
            Transformer transformer = tFactory.newTransformer( stylesource );

            transformedXml = new ByteArrayOutputStream();
            StreamResult result = new StreamResult( transformedXml );
            
            DOMSource source = new DOMSource( document );

            transformer.transform( source, result );
        } catch ( TransformerConfigurationException tce ) {
            // Error generated by the parser
            LOG.warn( "XMLTransform.transform() - TransformerFactory error: "
            		+ tce.getMessage() );
        } catch( TransformerException te ) {
            // Error generated by the parser
        	LOG.warn( "XMLTransform.transform() - Transformation error: "
        			+ te.getMessage() );
        } catch( SAXException sxe ) {
            // Error generated by this application
            // (or a parser-initialization error)
            Exception x = sxe;

            if( sxe.getException() != null ) {
                x = sxe.getException();
            }

            LOG.warn( "XMLTransform.transform() SAX exception: " + sxe.getMessage(),
            		x );
        } catch( ParserConfigurationException pce ) {
            // Parser with specified options can't be built
        	LOG.warn( "XMLTransform.transform() SAX parser cannot be built with " +
			"specified options" );
        } catch( IOException ioe ) {
            // I/O error
        	LOG.warn( "XMLCleanup.cleanup() IO exception", ioe );
        }
        
        return transformedXml;
    } // main
}
