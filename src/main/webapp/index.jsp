
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

    <style>
        body {
            background-color: lightgray;
            font-weight:bold;
        }

        h1{
            text-align: center;
            margin-top: 30px;
        }

        .inputForm{
            display: grid;
            place-items: center;
            margin: 0;
        }

        label{
            font-size: 20px;
            margin: 5px;
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
            background-color: rgba(86, 191, 62, 0.8);
        }

        td{
            font-size: 20px;
            padding: 15px;
        }

        #button{
            display: block;
            margin: 0 auto;
            width: 100px;
            height: auto;
            font-size: 20px;
            padding: 15px;
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

<h1 style="color:orangered">Enter Your Details</h1>

<%--design the form --%>
<div class="inputForm">
    <form id="myForm" action="xml-write" method="post">
        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name" required></td>
                <td><span id="nameValidationMessage"></span></td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" id="email" name="email" required></td>
                <td><span id="emailValidationMessage"></span></td>
            </tr>
            <tr>
                <td><label for="phone">Phone Number:</label></td>
                <td><input type="number" id="phone" name="phone" required></td>
                <td><span id="phoneValidationMessage"></span></td>
            </tr>
            <tr>
                <td><label for="freelance">Freelancing platform:</label></td>
                <td><input type="text" id="freelance" name="freelance" required></td>
                <td><span id="freelanceValidationMessage"></span></td>
            </tr>
            <tr>
                <td><label for="idNum">Identity Card Number:</label></td>
                <td><input type="text" id="idNum" name="idNum" required></td>
                <td><span id="idNumValidationMessage"></span></td>
            </tr>
        </table>
        <input type="submit" id="button" value="Submit">
    </form>
    <footer>IM/2020/009-SACHINTHA DINUKA</footer>
</div>

<%--define the functionalities with JS--%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('myForm');
        const nameInput = document.getElementById('name');
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');
        const freelanceInput = document.getElementById('freelance');
        const idNumInput = document.getElementById('idNum');

        const nameValidationMessage = document.getElementById('nameValidationMessage');
        const emailValidationMessage = document.getElementById('emailValidationMessage');
        const phoneValidationMessage = document.getElementById('phoneValidationMessage');
        const freelanceValidationMessage = document.getElementById('freelanceValidationMessage');
        const idNumValidationMessage = document.getElementById('idNumValidationMessage');

        form.addEventListener('submit', function (event) {
            validateForm(event);
        });

        nameInput.addEventListener('input', function (event) {
            validateName(event);
        });

        emailInput.addEventListener('input', function (event) {
            validateEmail(event);
        });

        phoneInput.addEventListener('input', function (event) {
            validatePhone(event);
        });

        freelanceInput.addEventListener('input', function (event) {
            validateFreelance(event);
        });

        idNumInput.addEventListener('input', function (event) {
            validateIdNum(event);
        });

        // define validateForm function in order to validate user inputs
        function validateForm(event) {
            validateName(event);
            validateEmail(event);
            validatePhone(event);
            validateFreelance(event);
            validateIdNum(event);
        }

        function validateName(event) {
            const isNameValid = isValidNameFormat(nameInput.value.trim());

            if (!isNameValid) {
                nameValidationMessage.textContent = 'invalid';
                event.preventDefault();
            } else {
                nameValidationMessage.textContent = 'valid';
            }
        }

        function validateEmail(event) {
            const isEmailValid = isValidEmailFormat(emailInput.value.trim());

            if (!isEmailValid) {
                emailValidationMessage.textContent = 'invalid';
                event.preventDefault();
            } else {
                emailValidationMessage.textContent = 'valid';
            }
        }

        function validatePhone(event) {
            const isPhoneValid = isValidPhoneFormat(phoneInput.value.trim());

            if (!isPhoneValid) {
                phoneValidationMessage.textContent = 'invalid';
                event.preventDefault();
            } else {
                phoneValidationMessage.textContent = 'valid';
            }
        }

        function validateFreelance(event) {
            const isFreelanceValid = isValidFreelanceFormat(freelanceInput.value.trim());

            if (!isFreelanceValid) {
                freelanceValidationMessage.textContent = 'invalid';
                event.preventDefault();
            } else {
                freelanceValidationMessage.textContent = 'valid';
            }
        }

        function validateIdNum(event) {
            const isIdNumValid = isValidIdNumFormat(idNumInput.value.trim());

            if (!isIdNumValid) {
                idNumValidationMessage.textContent = 'invalid';
                event.preventDefault();
            } else {
                idNumValidationMessage.textContent = 'valid';
            }
        }

        // define validations for each user inputs using regex patterns
        function isValidNameFormat(name) {
            return name.length > 0 && /[A-z]{3,40}/.test(name);
        }

        function isValidEmailFormat(email) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        }

        function isValidPhoneFormat(phone) {
            return /^[0-9]{10}$/.test(phone);
        }

        function isValidFreelanceFormat(freelance) {
            return freelance.length > 0 && /[A-z]{3,40}/.test(freelance);
        }

        function isValidIdNumFormat(idNum) {
            return /^[0-9]{12}|[0-9]{11}[x|v]/.test(idNum);
        }
    });
</script>
<%--IM/2020/009-SACHINTHA DINUKA--%>