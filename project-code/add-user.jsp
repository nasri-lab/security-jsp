<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="config.jsp" %>
<html>
<head></head>
<body>

<h1>Add new user</h1>

<%
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("name") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String user_password = request.getParameter("password");
        String profile = request.getParameter("profile");

        Statement st = null;

        try {
        
            st = conn.createStatement();
            String query = "INSERT INTO account(name, email, password, profile) VALUES ('" + name + "', '" + email + "', MD5('" + user_password + "'), '" + profile + "')";

            int result = st.executeUpdate(query);

            if (result > 0) {
                out.println("User added successfully.");
            } else {
                out.println("Erreur : unable to add the user.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (st != null) try { st.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>

<form action="" method="POST">
    User name <input type="text" name="name" /><br />
    User email <input type="email" name="email" /><br />
    User password <input type="password" name="password" /><br />
    User profile <select name="profile">
        <option value="user">User</option>
        <option value="admin">Admin</option>
    </select>
    <br />
    <input type="submit" name="submit" value="Submit" />
</form>

</body>
</html>
