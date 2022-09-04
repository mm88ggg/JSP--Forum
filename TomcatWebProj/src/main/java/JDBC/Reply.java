package JDBC;

public class Reply {
	private int tid;
	private String username;
	private int id;
	private String content;
	private String time;
	
	public Reply() {}
	public Reply(int tid, String username, int id, String content, String time) {
		super();
		this.tid = tid;
		this.username = username;
		this.id = id;
		this.content = content;
		this.time = time;
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
