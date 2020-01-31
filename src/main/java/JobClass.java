import java.sql.Date;
import java.sql.Time;

public class JobClass {
    public int jobId;
    public String title;
    public String comment;
    public Date dateDue;
    public Time timeDue;
    public boolean jobDone;
    public int userId;

    public String getJobID() { return Integer.toString(this.jobId); }

    public String getTitle() {
        return this.title;
    }

    public String getComment() {
        return this.comment;
    }

    public String getShortComment() {
        return this.comment.substring(0, Math.min(this.comment.length(), 150)) + "...";
    }

    public String getDate() {
        return  this.dateDue.toString();
    }

    public String getTime() {
        return this.timeDue.toString();
    }

    public boolean getJobDone() { return this.jobDone; }

    public String getUserID() {
        return Integer.toString(this.userId);
    }
}
