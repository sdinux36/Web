package com.example.webcrud;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.List;

/*Utility class to convert List<Element> to NodeList
In XML processing, NodeList is a standard interface in the
DOM (Document Object Model) API that represents an ordered
collection of nodes. Nodes can be elements, attributes, text, etc.
Having a utility to convert a List<Element> to a NodeList provides
flexibility and convenience when working with XML data in my project.*/
public class NodeListUtils {

    // Static method to convert a List<Element> to NodeList
    public static NodeList toNodeList(List<Element> elements) {
        return new NodeListWrapper(elements); // Return an instance of NodeListWrapper
    }

    // Private static inner class implementing NodeList
    private static class NodeListWrapper implements NodeList {

        private final List<Element> elements;

        // Constructor taking a List<Element> as a parameter
        public NodeListWrapper(List<Element> elements) {
            this.elements = elements;
        }

        // Implementation of the item method from NodeList
        @Override
        public Node item(int index) {
            // Return the Element at the specified index, or null if the index is out of bounds
            if (index >= 0 && index < elements.size()) {
                return elements.get(index);
            }
            return null;
        }

        // Implementation of the getLength method from NodeList
        @Override
        public int getLength() {
            // Return the number of elements in the List
            return elements.size();
        }
    }
}
