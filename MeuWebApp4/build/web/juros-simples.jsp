<%-- 
    Document   : juros-simples
    Created on : 24 de set. de 2023, 16:34:20
    Author     : beaar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
    <%@ include file="/WEB-INF/jspf/menu.jspf" %>
    <h1>Cálculo de Juros Simples</h1>
    <form action="juros-simples.jsp" method="post">
        <input placeholder="Informe seu Montante" type="number" id="montante" name="montante" required>
        <input placeholder="Informe a taxa (mensal)" type="number" id="taxa" name="taxa" required>
        <input placeholder="Informe os meses" type="number" id="meses" name="meses" required>
        <input type="submit" value="Calcular">
    </form>

        <%
        double montante = 0.0;
        double taxa = 0.0;
        int meses = 0;
        
        String montanteParam = request.getParameter("montante");
        String taxaParam = request.getParameter("taxa");
        String mesesParam = request.getParameter("meses");
     
            if(montanteParam != null){
                montante = Double.parseDouble(montanteParam);
            }
            if(taxaParam != null){
                taxa = Double.parseDouble(taxaParam);
            }
            if(mesesParam != null){
                meses = Integer.parseInt(mesesParam);
            }
            double juros = montante * (taxa/100) * meses;
            double montanteFinal = montante + juros;

        %>
        <h2>Tabela</h2>
        <table border ="1">
            <tr>
                <th>Descrição</th>
                <th>Valor</th>
            </tr>
            <tr>
                <td>Montante inicial:</td>
                <td><%= montante %></td>
            </tr>
            <tr>
                <td>Taxa de juros:</td>
                <td><%= taxa %></td>
            </tr>
            <tr>
                <td>Numeros de meses</td>
                <td><%= meses %></td>
            </tr>
            <tr>
                <td>Juros simples:</td>
                <td><%= juros %></td>
            </tr>
            <tr>
                <td>Montante futuro:</td>
                <td><%= montanteFinal %></td>
            </tr>
        </table>

            
    </body>
</html>
