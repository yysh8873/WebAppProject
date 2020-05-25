package group;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//import org.mariadb.jdbc.Driver;
import group.Group;
import posts.Posts;

public class GroupDAO {
    String driver = "org.mariadb.jdbc.Driver";
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public int getNext() { //그룹번호
        String SQL = "select gid from groupinfo order by gid asc";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1)+1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //db 오류
    }

    public GroupDAO() {
        try {
            String url = "jdbc:mariadb://localhost:3306/deeper"; //3307로 저장 됐을 수 있으니 한번씩 확인해주세요
            String id = "root";
            String pw = "1234";
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, id, pw);
            System.out.println("연결 성공");
        } catch (Exception e) {
            System.out.println("error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    //그룹 목록 불러오기
    public ArrayList<Group> getGroupList(){
        String SQL =  "select * from groupinfo";
        ArrayList<Group> list = new ArrayList<Group>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Group group = new Group();
                group.setGid(rs.getInt(1));
                group.setGname(rs.getString(2));
                group.setGinfo(rs.getString(3));
                group.setTag(rs.getString(4));
                group.setUid(rs.getString(5));
                list.add(group);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //가입한 그룹 목록 불러오기
    public ArrayList<Group> getMyGroupList(String uid){
        String SQL =  "select * from groupinfo join guserinfo on groupinfo.gid = guserinfo.gid " +
                "where guserinfo.uid = ?";
        ArrayList<Group> list = new ArrayList<Group>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Group group = new Group();
                group.setGid(rs.getInt(1));
                group.setGname(rs.getString(2));
                group.setGinfo(rs.getString(3));
                group.setTag(rs.getString(4));
                group.setUid(rs.getString(5));
                list.add(group);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //그룹 상세 정보 불러오기
    public String getGroupName(int gid){
        String SQL =  "select gname from groupinfo where gid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getString(1);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "-1";
    }

    //그룹 설명 불러오기
    public String getGroupInfo(int gid){
        String SQL =  "select ginfo from groupinfo where gid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getString(1);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "-1";
    }

    public String getGroupTag(int gid){
        String SQL =  "select tag from groupinfo where gid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getString(1);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "-1";
    }

    public String getGroupMaster(int gid){
        String SQL =  "select userinfo.name " +
                "from groupinfo join userinfo on groupinfo.uid = userinfo.uid " +
                "where groupinfo.gid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getString(1);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "-1";
    }

    public int getGroupCount(int gid){
        String SQL =  "select count(*) from guserinfo where gid = ? and isIn = 1";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public int getGid(String gname) {
        String SQL =  "select gid from groupinfo where gname = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, gname);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
