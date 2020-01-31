import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "notFinish-job-servlet", urlPatterns = {"/notFinishJob"})
public class NotFinishJobServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int jobID = Integer.parseInt(req.getParameter("id"));

        try {
            Connection conn = DatabaseConnector.getConn();

            if(conn != null) {
                PreparedStatement statement = conn.prepareStatement("UPDATE loginregister.jobs SET job_done = false WHERE job_id = ?");

                statement.setInt(1, jobID);

                if(statement.executeUpdate() > 0)
                {
                    System.out.println("Successfully updated");
                }else{
                    System.out.println("Failed to update");
                }
            } else {
                return;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        resp.sendRedirect("/dashboard");
    }
}
