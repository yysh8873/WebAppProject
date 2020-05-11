package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mariadb.jdbc.Driver;

// DAO: 데이터베이스 접근 객체의 약자
public class UserDAO {
    String driver = "org.mariadb.jdbc.Driver";
    private Connection conn;        // 접근 객체
    private PreparedStatement pstmt;
    private ResultSet rs;           // 결과 정보 담을 객체

    public UserDAO() {
        try {
            String url="jdbc:mariadb://localhost:3306/deeper"; // deeper라는 db에 접속
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

    public int login(String uid, String pw){
        String SQL = "SELECT pw FROM userinfo WHERE uid = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, uid); // 물음표에 해당하는 부분에 uid 넣기
            rs = pstmt.executeQuery();
            if (rs.next()){
                // 아이디가 있는 경우
                if (rs.getString(1).equals(pw)){
                    return 1; // 로그인 성공
                }
                else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // myInfo.jsp에서 사용
    // 내 포스트 개수
    public int myPostCnt(String uid){
        String SQL = "SELECT cid FROM post WHERE uid = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, uid); // 물음표에 해당하는 부분에 uid 넣기
            rs = pstmt.executeQuery();

            rs.last();
            return rs.getRow();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // myInfo.jsp에서 사용
    // 가입한 그룹 개수
    public int myGroupCnt(String uid) {
        String SQL = "SELECT gid FROM guserinfo WHERE uid = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, uid); // 물음표에 해당하는 부분에 uid 넣기
            rs = pstmt.executeQuery();

            rs.last();
            return rs.getRow();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public String myName(String uid) {
        String SQL = "SELECT name FROM userinfo WHERE uid = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, uid); // 물음표에 해당하는 부분에 uid 넣기
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getString(1);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "-1"; // 데이터베이스 오류
    }
}
