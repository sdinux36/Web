
package com.example.webcrud;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

// Servlet to handle writing data to an XML file
@WebServlet(name = "write", value = "/xml-write")
public class write extends HttpServlet {

    // Initialization method
    public void init() {

    }

    // Handling POST requests
    /*The doPost method handles HTTP POST requests. It retrieves data from the request parameters,
     including name, email, phone, freelance, and idNum.*/
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Retrieve data from the request parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String degree = request.getParameter("freelance");
        String idNum = request.getParameter("idNum");

        try {
            // Get the servlet context
            ServletContext context = getServletContext();

            // Get the real path of the base directory and specify the relative path of the XML file
            String baseDirectory = context.getRealPath("/data");
            String relativePath = "data.xml";

            // Create a File object representing the XML file
            File xmlFile = new File(baseDirectory, relativePath);

            // Create a DocumentBuilder to parse the XML file
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.parse(xmlFile);

            // Create a new person element
            Element personElement = doc.createElement("person");

            // Add fields to the person element

            personElement.appendChild(createElement(doc, "id", generateUniqueId()));
            personElement.appendChild(createElement(doc, "name", name));
            personElement.appendChild(createElement(doc, "email", email));
            personElement.appendChild(createElement(doc, "phone", phone));
            personElement.appendChild(createElement(doc, "freelance", degree));
            personElement.appendChild(createElement(doc, "idNum", idNum));

            // Add the person element to the root element of the XML Document
            doc.getDocumentElement().appendChild(personElement);

            // Save the changes back to the XML file
            /*After creating the new person element and appending it to the XML document,
             the changes are saved back to the XML file using the Transformer class. The
             XML file is specified as "data.xml."*/
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(xmlFile);
            transformer.transform(source, result);

            // Redirect to the XML read servlet to display the updated data
            response.sendRedirect(request.getContextPath() + "/xml-read");

        } catch (ParserConfigurationException | SAXException | TransformerException e) {
            e.printStackTrace();
        }
    }

    // define a Method to generate a unique ID based on the current date and time
    private String generateUniqueId() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd - HH:mm:ss");
        return now.format(formatter);
    }

    // Utility method to create an XML element with a given tag name and text content
    private Element createElement(Document doc, String tagName, String textContent) {
        Element element = doc.createElement(tagName);
        element.appendChild(doc.createTextNode(textContent));
        return element;
    }

    // define destruction method
    /*The destroy method in a servlet is part of the servlet lifecycle and is called
     by the servlet container when the servlet is being taken out of service, typically
     during the shutdown of the web application or when the servlet container is shutting down.
     This method gives you an opportunity to perform any cleanup or resource release operations
      before the servlet is destroyed.*/
    public void destroy() {

    }
}
//IM/2020/009-SACHINTHA DINUKA