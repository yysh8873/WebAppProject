package group;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GroupDAO {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;

    public GroupDAO() {
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

    //그룹 이름을 이용해 그룹 아이디 받아오기
    public int getGid(String gname) {
        String SQL =  "SELECT gid FROM groupinfo WHERE gname = ?";
        try {
            pstmt=conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1)+1;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}
