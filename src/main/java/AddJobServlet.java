import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;

@WebServlet(name = "add-job-servlet", urlPatterns = {"/addNew"})
public class AddJobServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String nazivOpravila = req.getParameter("naziv");
        String opisOpravila = req.getParameter("opis");
        String datumKonca = req.getParameter("datumZakljucka");
        String casKonca = req.getParameter("casZakljucka");
        casKonca += ":00";

        try {
            Connection conn = DatabaseConnector.getConn();

            if(conn != null) {
                PreparedStatement ps;

                ps = conn.prepareStatement("INSERT INTO loginregister.jobs(\"user_id\", \"title\", \"comment\", \"time_due_date\", \"time_due_time\") VALUES(?, ?, ?, ?, ?)");

                ps.setInt(1, Integer.parseInt(userId));
                ps.setString(2, nazivOpravila);
                ps.setString(3, opisOpravila);
                ps.setDate(4, Date.valueOf(datumKonca));
                ps.setTime(5, Time.valueOf(casKonca));

                if(ps.executeUpdate() > 0)
                {
                    System.out.println("You are sucessfully added a new job");

                    resp.sendRedirect(req.getContextPath() + "/dashboard");
                }else{
                    System.out.println("Failed in adding new job");

                    resp.sendRedirect(req.getContextPath() + "/dashboard");
                }
            } else {
                return;
            }
        } catch(Exception se) {
            se.printStackTrace();
        }
    }
}
