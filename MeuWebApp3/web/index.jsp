
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar JSP</title>
    </head>
    <body>
        <div align="center">
            <h1>Calendário</h1>
        </div>
        <div align="center">
            <form action="index.jsp">
                <input placeholder="Ano" type="number" id="year" name="year" required>
                <input placeholder="Mês" type="number" id="month" name="month" min="1" max="12" required>
                <input type="submit" value="Exibir">
            </form>
        </div> 
        <br>
        <% 
            String yearParam = request.getParameter("year");
            String monthParam = request.getParameter("month");
            int year = 0, month = 0;
            if (yearParam != null && monthParam != null) {
                try {
                    year = Integer.parseInt(yearParam);
                    month = Integer.parseInt(monthParam);
                } catch (Exception e) {
        %>
        <div align ="center">
            <font color = "red">Parâmetros inválidos!</font>
        </div>
        <%
                }
            }
            if (year != 0 && month != 0) {
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                calendar.set(year, month - 1, 1); 
                int totalMonth = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
        %>
        <div align="center">
            <div style="font-size: 25px; font-weight: bold">
                <% 
                    String formatMonth= new java.text.SimpleDateFormat("MMMM yyyy").format(calendar.getTime()); 
                %>
                <%= formatMonth.substring(0, 1).toUpperCase() + formatMonth.substring(1) %>
            </div>
        </div>
        <table align="center" border="1" style="border-collapse: collapse;">
            <tr>
                <th>Domingo</th>
                <th>Segunda-feira</th>
                <th>Terça-feira</th>
                <th>Quarta-feira</th>
                <th>Quinta-feira</th>
                <th>Sexta-feira</th>
                <th>Sábado</th>
            </tr>
            <tr>
                <% 
                int firstDayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);
                for (int i = 1; i < firstDayOfWeek; i++) { 
                %>
                <td></td>
                <% } %>

                <% 
                for (int day = 1; day <= totalMonth; day++) {
                    int currentDayOfWeek = calendar.get(java.util.Calendar.DAY_OF_WEEK);
                %>
                <td>
                    <%= day %>
                    <br> 
                    <br> 
                    <br>
                </td>
                    <% if (currentDayOfWeek == java.util.Calendar.SATURDAY) { %>
                    </tr><tr>
                <% } %>
                <% calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
                } %>

                <% while (calendar.get(java.util.Calendar.DAY_OF_WEEK) != java.util.Calendar.SUNDAY) { %>
                    <td></td>
                <% calendar.add(java.util.Calendar.DAY_OF_MONTH, 1); %>
                <% } %>
            </tr>
        </table>
        <% } %>
    </body>
</html>
