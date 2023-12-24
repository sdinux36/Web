
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Display XML Data</title>

    <style>
        body {
            background-color: lightgray;
            font-weight:bold;
        }
        h1{
            text-align: center;
            margin-top: 30px;
        }

        .search{
            display: grid;
            place-items: center;
            margin: 0;
        }

        label{
            font-size: 20px;
            margin: 5px;
        }

        .readView{
            display: grid;
            place-items: center;
            margin: 0;
        }

        .readView td{
            background-color: #e6f7fd;
            padding: 10px;
        }

        .navigation{
            position: absolute;
            right: 0px;
        }

        a{
            text-decoration: none;
            color: black;
            font-size: 20px;
            margin: 5px;
            padding: 5px;
        }

        a:hover{
            background-color: rgba(117, 106, 116, 0.8);
        }

        .labels{
            display: grid;
            place-items: start;
            margin-left: 30px;
        }

        .labels td{
            font-size: 20px;
            width: 240px;
            padding: 5px 10px 10px 60px;
        }

        td{
            font-size: 18px;
            width: 240px;
            margin: 10px;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>

</head>
<body>

<div class="navigation">
    <a href="index.jsp">form</a>
    <a href="xml-read">read</a>
    <a href="xml-update">update</a>
</div>

<h1>Read Data</h1>

<div class="search">
    <form action="" method="get">
        <label for="searchName">Search:</label>
        <input type="text" id="searchName" name="searchName" placeholder="Search by Name" onkeypress=""/>
        <input type="submit" value="Search" />
    </form>
</div>

<table class="labels">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Email</td>
        <td>Telephone</td>
        <td>Freelance Platform</td>
        <td>Identity Number</td>
    </tr>
</table>

<%
    NodeList personlist = (NodeList) request.getAttribute("personlist");

    if (personlist != null && personlist.getLength() > 0) {
        // Iterate NodeList and display each person's details
        for (int i = 0; i < personlist.getLength(); i++) {
            Element personElement = (Element) personlist.item(i);
            String id = personElement.getElementsByTagName("id").item(0).getTextContent();
            String name = personElement.getElementsByTagName("name").item(0).getTextContent();
            String email = personElement.getElementsByTagName("email").item(0).getTextContent();
            String phone = personElement.getElementsByTagName("phone").item(0).getTextContent();
            String freelance = personElement.getElementsByTagName("freelance").item(0).getTextContent();
            String idNum = personElement.getElementsByTagName("idNum").item(0).getTextContent();
%>

<div class="readView">
    <table>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><%= phone %></td>
            <td><%= freelance %></td>
            <td><%= idNum %></td>
        </tr>
    </table>
    <footer>IM/2020/009-SACHINTHA DINUKA</footer>
</div>

<%
    }
} else {
%>
<div class="readView">
    <p>No data found.</p>
</div>
<%
    }
%>

</body>
</html>
<%--IM/2020/009-SACHINTHA DINUKA--%>