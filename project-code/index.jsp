<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ include file="config.jsp" %>
<%
    Statement stmt = null;
    ResultSet rs = null;

    String connectedId = null;
    String connectedName = null;
    String connectedProfile = null;
    String message = "";

    if(request.getParameter("email") != null) {
        String email = request.getParameter("email");
        String user_password = request.getParameter("password");
        
        try {
    
            stmt = conn.createStatement();
            String sql = "SELECT * FROM account WHERE email = '" + email + "' AND password = MD5('" + user_password + "')";
            rs = stmt.executeQuery(sql);

            out.println(sql);

            if(rs.next()) {
                connectedId = rs.getString("id");
                connectedName = rs.getString("name");
                connectedProfile = rs.getString("profile");
            } else {
                message = "Données invalides";
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
            if(stmt != null) try { stmt.close(); } catch(SQLException e) { e.printStackTrace(); }
            if(rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
        }

        if(connectedId != null) {
            response.sendRedirect("./categories.jsp");
            return;
        }
    }
%>
<html>
    <head></head>
    <body>
        <h1>Login</h1>
        <% if(connectedId == null) { %>
            <span style="color:red; font-weight: bold;"><%=message%></span><br /><br />
        <% } %>
        
        <form action='index.jsp' method="post">
            <table>
                <tr>
                    <td>Email :</td>
                    <td><input type="text" name="email" required="required"/></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input type="password" name="password" value=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="Connexion" /></td>
                </tr>        
            </table>    
        </form>
    </body>
</html>
