/*
create table groupinfo
(gid int not null primary key,
 gname varchar(16) not null,
 tag varchar(30) null)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table guserinfo
(gid int not null,
 uid varchar(20) not null,
 primary key(gid, uid))ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */

package group;

public class Group {
    private int gid;
    private String gname;
    private String tag;
    private String uid;
    private int isIn;

    public int getGid() { return gid; }

    public void setGid(int gid) { this.gid = gid; }

    public String getGname() {return gname; }

    public void setGname(String gname) { this.gname = gname; }

    public String getTag() { return tag; }

    public void setTag(String tag) { this.tag = tag; }
    
    public String getUid() { return uid; }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public int getIsIn() { return isIn; }

    public void setIsIn(int isIn) {this.isIn = isIn; }
}
