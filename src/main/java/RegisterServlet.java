import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "register-name", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("register.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("name");
        String userEmail = req.getParameter("email");
        String userPassword = req.getParameter("password");
        String userUsername = req.getParameter("username");
        String userSurname = req.getParameter("surname");

        String passwHash = DigestUtils.sha256Hex(userPassword);

        try {
            Connection conn = DatabaseConnector.getConn();

            if(conn != null) {
                HttpSession session = req.getSession(false);
                PreparedStatement ps;

                ps = conn.prepareStatement("SELECT EXISTS(SELECT * FROM  loginregister.users WHERE username = ? OR email = ?)");

                ps.setString(1, userUsername);
                ps.setString(2, userEmail);

                ResultSet resultOfQuery = ps.executeQuery();

                while (resultOfQuery.next()) {
                    if (resultOfQuery.getBoolean("exists")) {
                        System.out.println("Failed in registration");
                        System.out.println("Username or email already in use");

                        session.setAttribute("status", "err");
                        session.setAttribute("massage", "Podani username ali email že obstaja!");
                        resp.sendRedirect(req.getContextPath() + "/register");

                        return;
                    }
                }

                ps = conn.prepareStatement("INSERT INTO loginregister.users(\"name\", \"surname\", \"username\", \"password\", \"email\") VALUES(?, ?, ?, ?, ?)");

                ps.setString(1, userName);
                ps.setString(2, userSurname);
                ps.setString(3, userUsername);
                ps.setString(4, passwHash);
                ps.setString(5, userEmail);

                if(ps.executeUpdate() > 0)
                {
                    System.out.println("You are sucessfully registered");

                    session.setAttribute("status", "succ");
                    session.setAttribute("massage", "Registracija uspesna, zdaj se lahko prijavite!");
                    resp.sendRedirect(req.getContextPath() + "/login");
                }else{
                    System.out.println("Failed in registration");

                    session.setAttribute("status", "err");
                    session.setAttribute("massage", "Registracija neuspesna!");
                    resp.sendRedirect(req.getContextPath() + "/register");
                }
            } else {
                return;
            }
        } catch(Exception se) {
            se.printStackTrace();
        }
    }
}
