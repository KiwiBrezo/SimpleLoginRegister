import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "delete-job-servlet", urlPatterns = {"/removeJob"})
public class DeleteJobServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int jobID = Integer.parseInt(req.getParameter("id"));

        try {
            Connection conn = DatabaseConnector.getConn();

            if(conn != null) {
                PreparedStatement statement = conn.prepareStatement("DELETE FROM loginregister.jobs WHERE job_id = ?");

                statement.setInt(1, jobID);

                if(statement.executeUpdate() > 0)
                {
                    System.out.println("Successfully deleted");
                }else{
                    System.out.println("Failed to delete");
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
