package group;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//import org.mariadb.jdbc.Driver;


public class GroupDAO {
    String driver = "org.mariadb.jdbc.Driver";
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

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

    // group ID
    public int getNext() {
        String SQL = "SELECT gid FROM groupinfo ORDER BY gid DESC";
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
                "where guserinfo.uid = ? and guserinfo.isIn < 2";
        ArrayList<Group> list = new ArrayList<Group>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, uid);
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

    // 그룹 생성
    public int makeGroup(String gname, String ginfo, String tag, String uid) {
        String SQL = "insert into groupinfo(gid, gname, ginfo, tag, uid) values(?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext());
            pstmt.setString(2,gname);
            pstmt.setString(3,ginfo);
            pstmt.setString(4,tag);
            pstmt.setString(5,uid);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("GroupDAO makeGroup() error");
            e.printStackTrace();
        }
        return -1; //DB오류
    }

    // 멤버 등록
    public int registerMember(int gid, String uid, int isIn) {
        String SQL = "insert into guserinfo(gid, uid, isIn) values(?, ?, ?)";

        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1,gid);
            pstmt.setString(2,uid);
            pstmt.setInt(3,isIn);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("GroupDAO makeGroup() error");
            e.printStackTrace();
        }
        return -1; //DB오류
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
        String SQL =  "select count(*)+1 from guserinfo where gid = ? and isIn = 1";
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

    // 그룹 삭제
    public int deleteGroup(int gid, String uid){
        // 그룹장만 그룹을 삭제할 수 있음
        String SQL = "DELETE FROM groupinfo WHERE gid= ? AND uid = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            pstmt.setString(2, uid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 그룹 유저 목록 삭제
    public int deleteGuser(int gid){
        String SQL = "DELETE FROM guserinfo WHERE gid= ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public ArrayList<Group> getGPeopleList(int gid){
        String SQL =  "select * from guserinfo where gid = ? and isIn = 1";
        ArrayList<Group> list = new ArrayList<Group>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Group group = new Group();
                group.setGid(rs.getInt(1));
                group.setUid(rs.getString(2));
                group.setIsIn(rs.getInt(3));
                list.add(group);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //그룹 가입 신청
    public int groupJoin(String uid, int gid) {
        String SQL = "insert into guserinfo(gid, uid, isIn) values(?, ?, 2)";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            pstmt.setString(2, uid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //디비오류
    }

    //그룹원 검사
    //1이면 그룹원 있음 -1이면 디비오류
    public int isGroupMember(String uid, int gid) {
        String SQL =  "select count(*) from guserinfo where gid = ? and uid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            pstmt.setString(2, uid);
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e){
            e.printStackTrace();
        }
        return -1; //디비오류
    }

    //그룹 탈퇴
    public int groupOut(String uid, int gid) {
        String SQL = "delete from guserinfo where gid = ? and uid = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            pstmt.setString(2, uid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //디비오류
    }

    //그룹 가입 대기
    public ArrayList<Group> getGroupInList(int gid){
        String SQL =  "select * from guserinfo where gid = ? and isIn = 2";
        ArrayList<Group> list = new ArrayList<Group>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, gid);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Group group = new Group();
                group.setGid(rs.getInt(1));
                group.setUid(rs.getString(2));
                group.setIsIn(rs.getInt(3));
                list.add(group);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}