<%-- 
    Document   : disciplinas
    Created on : 9 de out. de 2023, 14:13:01
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
      <h1>DISCIPLINAS:</h1>
<table id="json-table" border="1">
    <thead>
        <tr>
            <th>Matérias</th>
        </tr>
    </thead>
    <tbody id="json-table">
    </tbody>
</table>
<script>
        async function postJSON() {
            try {
                const response = await fetch('beatriz.json');
                const data = await response.json();
                const jsonTable = document.getElementById('json-table');
                data.Matérias.forEach(mat => {
                    const row = jsonTable.insertRow();
                    const materiasCell = row.insertCell(0);
                    materiasCell.textContent = mat;
                });

                console.log('Dados:', data);
            } catch (error) {
                console.error('Não encontrou dados!', error);
            }
        }
        postJSON();
    </script>


    </body>
</html>
