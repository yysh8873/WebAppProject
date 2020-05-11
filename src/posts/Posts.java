/*
    create table post
    	(cid int not null primary key,
    	uid varchar(20) not null,
	    gid varchar(20) null,
    	title varchar(30) not null,
    	contents varchar(10000) not null,
	    tag varchar(30) null,
	    tdate date not null,
	    likes int null default 0)ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */

package posts;

public class Posts {
    private int cid;
    private String uid;
    private int gid;
    private String title;
    private String contents;
    private String tag;
    private String tdate;
    private int likes;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTdate() {
        return tdate;
    }

    public void setTdate(String tdate) {
        this.tdate = tdate;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
}
