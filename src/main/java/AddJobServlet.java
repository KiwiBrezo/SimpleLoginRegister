import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "add-job-servlet", urlPatterns = {"/addNew"})
public class AddJobServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        System.out.println(userId);

        HttpSession session = req.getSession();
        session.setAttribute("name", req.getParameter("name"));
        session.setAttribute("surname", req.getParameter("surname"));
        session.setAttribute("userId", req.getParameter("userId"));

        resp.sendRedirect(req.getContextPath() + "/dashboard");
        //RequestDispatcher requestDispatcher = req.getRequestDispatcher(req.getContextPath() + "/dashboard");
        //requestDispatcher.forward(req, resp);
    }
}
