<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="config.jsp" %>
<html>
<head></head>
<body>

<%
    Statement st = null;
    int result = 0;
    String category_id = request.getParameter("category_id");

    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("libelle") != null) {
        String libelle = request.getParameter("libelle");
        String description = request.getParameter("description");
        category_id = request.getParameter("category_id");

        try {
        
            String sql = "INSERT INTO product (label, id_category, description) VALUES ('" + libelle + "', " + category_id + ", '" + description + "')";
            st = conn.createStatement();
            result = st.executeUpdate(sql);

            if (result > 0) {
                response.sendRedirect("./products.jsp?category_id=" + category_id);
                return;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (st != null) try { st.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
%>

<h1>Add new product</h1>

<form action="" method="POST">
    Libelle: <input type="text" name="libelle" /><br />
    Description: <textarea name="description"></textarea><br />
    Category id: <input type="text" name="category_id" value="<%= category_id != null ? category_id : "" %>" /><br />
    <input type="submit" name="submit" value="Submit" />
</form>

</body>
</html>
