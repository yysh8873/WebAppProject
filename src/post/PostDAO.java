
package post;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public PostDAO() {
        try {
            String url="jdbc:mariadb://localhost:3306/deeper"; //deeper라는 db에 접속
            String id="root";   // root 계정
            String pw="1234";   // root 비밀번호
            Class.forName("org.mariadb.jdbc.Driver"); // driver은 mysql에 접속할 수 있게 해주는 하나의 라이브러리
            conn = DriverManager.getConnection(url,id,pw);
            System.out.println("연결 성공");
        } catch (Exception e) {
            System.out.println("error: "+e.getMessage());
            e.printStackTrace();
        }
    }

    // MariaDB의 DATE형이 java에선 String 형으로 저장된다.
    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("PostDAO getDate() error");
        }
        return "";
    }

    // 게시글 번호 붙이기
    public int getNext() {
        String SQL = "SELECT cid FROM post ORDER BY cid DESC";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1)+1;
            }
            return 1; //첫번째 게시글
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //db 오류
    }


    // 게시글 쓰기
    public int write(String title, String uid, String contents, int gid,String tag) {

        String SQL = "insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext());      //post 고유 넘버
            pstmt.setString(2,uid);
            pstmt.setInt(3, gid);
            pstmt.setString(4,title);
            pstmt.setString(5,contents);
            pstmt.setString(6,tag);
            pstmt.setString(7,getDate());
            pstmt.setInt(8,0);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostDAO write() error");
            e.printStackTrace();
        }
        return -1; //DB오류
    }
}
