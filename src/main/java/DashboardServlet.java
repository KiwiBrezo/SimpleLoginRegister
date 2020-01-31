import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "dashboard-servlet", urlPatterns = {"/dashboard"})
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = -1;

        Cookie cookies[] = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                switch (c.getName()) {
                    case "userId":
                        userId = Integer.parseInt(c.getValue());
                        break;
                    default:
                        break;
                }
            }
        }

        if (userId != -1) {
            try {
                Connection conn = DatabaseConnector.getConn();

                if(conn != null) {
                    PreparedStatement statement = conn.prepareStatement("SELECT job_id, title, comment, time_due_date, time_due_time, job_done FROM loginregister.jobs WHERE user_id = ?");

                    statement.setInt(1, userId);

                    ResultSet resultOfQuery = statement.executeQuery();

                    List<JobClass> jobs = new ArrayList<JobClass>();
                    while(resultOfQuery.next()) {
                        JobClass job = new JobClass();
                        job.jobId = resultOfQuery.getInt("job_id");
                        job.title = resultOfQuery.getString("title");
                        job.comment = resultOfQuery.getString("comment");
                        job.userId = userId;
                        job.dateDue = resultOfQuery.getDate("time_due_date");
                        job.timeDue = resultOfQuery.getTime("time_due_time");
                        job.jobDone = resultOfQuery.getBoolean("job_done");
                        jobs.add(job);
                    }

                    req.setAttribute("jobs", jobs);
                } else {
                    return;
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("userDashboard.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("userDashboard.jsp");
        requestDispatcher.forward(req, resp);
    }
}
