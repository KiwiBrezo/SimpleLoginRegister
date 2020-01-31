import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "logout-servlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Odjava...");

        Cookie cokies[] = req.getCookies();

        if (cokies != null ) {
            for (Cookie c : cokies) {
                c.setValue("");
                c.setPath("/");
                c.setMaxAge(0);
                resp.addCookie(c);
            }
        }

        resp.sendRedirect("/login");
    }
}
