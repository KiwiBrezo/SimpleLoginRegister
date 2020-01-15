import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "login-servlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        System.out.println("(POST)Poslani podatki so: " + username + " " + password);

        try {
            Connection conn = DatabaseConnector.getConn();

            if(conn != null) {
                PreparedStatement statement = conn.prepareStatement("SELECT password, name, surname FROM loginregister.users WHERE username = ?");

                statement.setString(1, username);

                ResultSet resultOfQuery = statement.executeQuery();

                String passw = "";
                String name = "";
                String surname = "";
                while(resultOfQuery.next()) {
                    passw = resultOfQuery.getString("password");
                    name = resultOfQuery.getString("name");
                    surname = resultOfQuery.getString("surname");
                }

                if (passw.compareTo(password) == 0) {
                    System.out.println("Podatki so pravilni");
                    req.setAttribute("username", username);
                    req.setAttribute("name", name);
                    req.setAttribute("surname", surname);
                    req.getRequestDispatcher("userDashboard.jsp").forward(req, resp);
                } else {
                    System.out.println("Podatki niso pravilni");
                    req.setAttribute("neuspesnaPrijava", true);
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }
            } else {
                return;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
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
