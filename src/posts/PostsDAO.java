package posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostsDAO {
    private Connection conn;
    private ResultSet rs;

    public PostsDAO() {
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

    // MariaDB의 DATE형이 java에선 String 형으로 저장
    // 현재 시간을 가져오는 함수
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
        String SQL = "SELECT cid FROM posts ORDER BY cid DESC";
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

    // 게시글 작성
    public int write(String title, String uid, String contents, int gid,String tag) {
        System.out.println("cid : " + getNext());
        String SQL = "insert into posts(cid, uid, gid, title, contents, tag, tdate, likes) values(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext());      // posts 고유 넘버
            pstmt.setString(2,uid);
            pstmt.setInt(3, gid);
            pstmt.setString(4,title);
            pstmt.setString(5,contents);
            pstmt.setString(6,tag);
            pstmt.setString(7,getDate());
            pstmt.setInt(8,0);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO write() error");
            e.printStackTrace();
        }
        return -1; //DB오류
    }

    // 특정 리스트 반환, 총 10개의 게시글 반환
    public ArrayList<Posts> getList(int pageNumber){
        String SQL =  "SELECT * FROM posts WHERE cid < ? ORDER BY cid DESC LIMIT 10";
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10); // 한 페이지에 10개씩
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            while (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));
                list.add(posts);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 내 포스트 리스트 반환, 총 10개의 게시글 반환
    public ArrayList<Posts> getMyList(int pageNumber, String userId){
        System.out.println("uid : " + userId);
        String SQL =  "SELECT * FROM posts WHERE uid = ? AND cid < ? ORDER BY cid DESC LIMIT 10";
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId); // 로그인 한 아이디와 작성자 아이디와 일치
            pstmt.setInt(2, getNext() - (pageNumber -1) * 10); // 한 페이지에 10개씩
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            while (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));

                list.add(posts);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 특정 리스트 반환, 총 10개의 게시글 반환
    public ArrayList<Posts> getGroupList(int pageNumber, int gid){
        String SQL =  "SELECT * FROM posts WHERE cid < ? and gid = ? ORDER BY cid DESC LIMIT 10";
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10); // 한 페이지에 10개씩
            pstmt.setInt(2, gid);
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            while (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));
                list.add(posts);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 내가 좋아요 한 리스트 반환, 총 10개의 게시글 반환
    public ArrayList<Posts> getMyLikeList(int pageNumber, String userId){
        System.out.println("uid : " + userId + ", likes: ");
        String SQL =  "SELECT DISTINCT posts.* FROM likes, posts WHERE likes.cid = posts.cid " +
                "AND likes.uid = ? AND likes.cid < ? ORDER BY likes.cid DESC LIMIT 10;";
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId); // 로그인 한 아이디와 작성자 아이디와 일치
            pstmt.setInt(2, getNext() - (pageNumber -1) * 10); // 한 페이지에 10개씩
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            while (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));

                list.add(posts);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 검색한 게시글 찾기
    public ArrayList<Posts> getPostByTitle(int pageNumber, String title){
        String SQL =  "SELECT * FROM posts WHERE cid < ? AND title LIKE ? ORDER BY cid DESC LIMIT 10";
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10); // 한 페이지에 10개씩
            pstmt.setString(2, "%"+title+"%");
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            while (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));
                list.add(posts);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 게시글 목록 페이징 처리
    public boolean nextPage(int pageNumber){
        String SQL = "SELECT * FROM posts WHERE cid < ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 한 페이지에 10개씩
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            if (rs.next()){
                return true;    // 뒤에 결과물 존재
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;           // 뒤에 넘어갈 페이지 없음
    }

    // 게시글 내용 불러오기
    public Posts getPost(int cid){
        System.out.println("cid : " + cid + " - getPost");
        String SQL =  "SELECT * FROM posts WHERE cid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, cid); // 특정 게시글 가져오기
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            if (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));
                return posts;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    // 게시글 수정
    public int update(int cid, String title, String contents, String tag){
        System.out.println("cid : " + getNext());
        String SQL = "UPDATE posts SET title = ?, contents = ?, tag = ? WHERE cid = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1,title);
            pstmt.setString(2,contents);
            pstmt.setString(3,tag);
            pstmt.setInt(4, cid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO update() error");
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 게시글 삭제
    public int delete(int cid){
        System.out.println("cid : " + getNext());
        String SQL = "DELETE FROM posts WHERE cid = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, cid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO update() error");
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 좋아요 여부 반환 - 좋아요 누른 uid 반환
    public String getYouLike(int cid, String userID) {
        String SQL = "SELECT uid FROM likes where cid = ? AND uid = ? ";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, cid); // 물음표에 해당하는 부분에 uid 넣기
            pstmt.setString(2, userID); // 확인한 게시글과 좋아요한 게시글 일치
            rs = pstmt.executeQuery();
            rs.next();
            return rs.getString(1);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "DB Error"; // 데이터베이스 오류
    }

    // 좋아요 반영
    public int updateLike(int cid, String uid){
        System.out.println("cid : " + getNext());
        String SQL = "insert into likes values(?, ?)";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, cid);
            pstmt.setString(2, uid);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO updateLike() error");
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 좋아요 반영 : posts 테이블에
    public int updateLike2(int cid){
        System.out.println("cid : " + getNext());
        String SQL = "UPDATE posts SET likes = ? WHERE cid = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, getPost(cid).getLikes()+1); // 좋아요 하나 추가
            pstmt.setInt(2, cid);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO updateLike2 error");
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 좋아요 삭제
    public int deleteLike(int cid, String uid){
        System.out.println("cid : " + getNext());
        String SQL = "DELETE FROM likes WHERE cid = ? AND uid = ?";
        try {
            PreparedStatement pstmt=conn.prepareStatement(SQL);
            pstmt.setInt(1, cid);
            pstmt.setString(2, uid);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO deleteLike() error");
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 좋아요 삭제
    public int deleteLike2(int cid) {
        System.out.println("cid : " + getNext());
        String SQL = "UPDATE posts SET likes = ? WHERE cid = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getPost(cid).getLikes() - 1); // 좋아요 하나 삭제
            pstmt.setInt(2, cid);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("PostsDAO updateLike2 error");
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 특정 리스트 반환, 총 10개의 게시글 반환
    public ArrayList<Posts> getListLike(int pageNumber){
        String SQL =  "SELECT * FROM posts WHERE cid < ? ORDER BY likes DESC LIMIT 10";
        ArrayList<Posts> list = new ArrayList<Posts>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            // getNext() : 그 다음으로 작성될 글의 번호
            // - 현재 5개일 경우 -> 6, pageNumber는 1, 결과는  6
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10); // 한 페이지에 10개씩
            rs = pstmt.executeQuery(); // 실제 실행 시, 나오는 결과
            while (rs.next()){
                Posts posts = new Posts(); // 데이터 담기
                posts.setCid(rs.getInt(1));
                posts.setUid(rs.getString(2));
                posts.setGid(rs.getInt(3));
                posts.setTitle(rs.getString(4));
                posts.setContents(rs.getString(5));
                posts.setTag(rs.getString(6));
                posts.setTdate(rs.getString(7));
                posts.setLikes(rs.getInt(8));
                list.add(posts);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
