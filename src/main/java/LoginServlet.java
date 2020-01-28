import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "login-servlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String passwHash = DigestUtils.sha256Hex(password);

        System.out.println("(POST)Poslani podatki so: " + username + " " + passwHash);

        try {
            Connection conn = DatabaseConnector.getConn();
            HttpSession session = req.getSession();

            if(conn != null) {
                PreparedStatement statement = conn.prepareStatement("SELECT user_id, password, name, surname FROM loginregister.users WHERE username = ?");

                statement.setString(1, username);

                ResultSet resultOfQuery = statement.executeQuery();

                String passw = "";
                String name = "";
                String surname = "";
                int user_id = -1;
                while(resultOfQuery.next()) {
                    passw = resultOfQuery.getString("password");
                    name = resultOfQuery.getString("name");
                    surname = resultOfQuery.getString("surname");
                    user_id = resultOfQuery.getInt("user_id");
                }

                if (passw.compareTo(passwHash) == 0) {
                    System.out.println("Podatki so pravilni");

                    session.setAttribute("username", username);
                    session.setAttribute("name", name);
                    session.setAttribute("surname", surname);
                    session.setAttribute("userId", user_id);

                    resp.sendRedirect(req.getContextPath() + "/dashboard");
                } else {
                    System.out.println("Podatki niso pravilni");

                    session.setAttribute("status", "err");
                    session.setAttribute("massage", "Prijava neuspesna, nepravilni podatki!");
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
            } else {
                return;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req, resp);
    }
}
