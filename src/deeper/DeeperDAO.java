package deeper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 자바 빈즈 클래스
public class DeeperDAO {
    String driver = "org.mariadb.jdbc.Driver";
    private Connection conn;        // 접근 객체
    private ResultSet rs;           // 결과 정보 담을 객체

    public DeeperDAO() {
        try {
            String url = "jdbc:mariadb://localhost:3306/deeper"; // deeper라는 db에 접속
            String id = "root";   // root 계정
            String pw = "1234";   // root 비밀번호
            Class.forName("org.mariadb.jdbc.Driver"); // driver은 mysql에 접속할 수 있게 해주는 하나의 라이브러리
            conn = DriverManager.getConnection(url, id, pw);
            System.out.println("연결 성공");
        } catch (Exception e) {
            System.out.println("error: " + e.getMessage());
            e.printStackTrace();
        }

    }

    // 현재 시간을 가져오는 함수
    public String getDate(){
        String SQL =  "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            if (rs.next()){
                return rs.getString(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return ""; // 데이터 베이스 오류
    }

    // 게시글 번호
    public int getNext(){
        String SQL =  "SELECT cid FROM post ORDER BY cid DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            if (rs.next()){
                return rs.getInt(1)+1;
            }
            return 1; // 첫번째 게시글인 경우
        } catch (Exception e){
            e.printStackTrace();
        }
        return -1; // 데이터 베이스 오류
    }

    // 게시글 작성
    public int write(String title, String uid, String content){
        String SQL =  "INSERT INTO post VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext()); // cid: 게시글 번호
            pstmt.setString(2, uid);
            // pstmt.setString(3, gid);
            pstmt.setString(4, title);
            pstmt.setString(5, content);
            // pstmt.setString(6, tag);
            pstmt.setString(7, getDate());
            pstmt.setInt(8, 1); // likes
            return  pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
        return -1; // 데이터 베이스 오류
    }
}
