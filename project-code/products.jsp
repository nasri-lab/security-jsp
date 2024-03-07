<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="config.jsp" %>
<html>
<head></head>
<body>

<%@ include file="menu.jsp" %>

<h1>Products</h1>

<%
    Statement st = null;
    ResultSet rs = null;

    String idCategory = request.getParameter("category_id");

    try {
    
        String sql = "SELECT * FROM product WHERE id_category = " + idCategory;
        rs = st.executeQuery(sql);

        if (!rs.next()) {
            out.println("Aucun produit trouvé<br /><br />");
        } else {
            out.println("<table><tr><th>ID</th><th>LABEL</th><th>ID CATEGORY</th><th>DESCRIPTION</th><th></th></tr>");
            do {
                String id = rs.getString("id");
                String label = rs.getString("label");
                String description = rs.getString("description");
                String idCat = rs.getString("id_category");
%>
                <tr>
                    <td><%= id %></td>
                    <td><%= label %></td>
                    <td><%= idCat %></td>
                    <td><%= description %></td>
                    <td><a href="delete-product.jsp?id=<%= id %>">Delete</a></td>
                </tr>
<%
            } while (rs.next());
            out.println("</table>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch(Exception e) { e.printStackTrace(); }
        try { if (st != null) st.close(); } catch(Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch(Exception e) { e.printStackTrace(); }
    }
%>

<br /><a href="add-product.jsp">+ Add new product</a>

</body>
</html>
