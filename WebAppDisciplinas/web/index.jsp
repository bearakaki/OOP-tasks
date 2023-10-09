<%-- 
    Document   : index
    Created on : 9 de out. de 2023, 14:12:40
    Author     : Fatec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>

    </head>
    <body>
        <h1>JSON:</h1>
        <pre id="json-data"></pre>
    <script>
        async function fetchJSON() {
            try {
                const response = await fetch('beatriz.json');
                const data = await response.json();
                const jsonData = document.getElementById('json-data');

                jsonData.textContent = JSON.stringify(data, null, 2);

                console.log('Dados:', data);
            } catch (error) {
                console.error('Não encontrou dados!', error);
            }
        }
        fetchJSON();
    </script>
    </body>
</html>
