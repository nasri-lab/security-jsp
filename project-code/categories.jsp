<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="config.jsp" %>
<html>
<head></head>
<body>

<%@ include file="menu.jsp" %>

<h1>Categories</h1>

<%
    Statement stmt = null;
    ResultSet rs = null;

    try {
    
        stmt = conn.createStatement();
        String sql = "SELECT * FROM category";
        rs = stmt.executeQuery(sql);

        if (!rs.next()) {
            out.println("Aucune catégorie trouvée<br /><br />");
        } else {
            out.println("<table><tr><th>ID</th><th>LABEL</th><th>ACTIONS</th></tr>");
            do {
                int id = rs.getInt("id");
                String label = rs.getString("label");
%>
                <tr>
                    <td><%= id %></td>
                    <td><%= label %></td>
                    <td><a href="products.jsp?category_id=<%= id %>">Products</a></td>
                </tr>
<%
            } while (rs.next());
            out.println("</table>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>

</body>
</html>