package JDBC;

public class Topic {
	private String topic;
	private int id;
	private String date;
	private String editTime;
	private String username;
	private String content;
	
	public Topic(String topic, int id, String date, String username, String content) {
		this.topic = topic;
		this.id = id;
		this.date = date;
		this.username = username;
		this.content = content;
	}
	
	public Topic() {
		// TODO Auto-generated constructor stub
	}

	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getEditTime() {
		return editTime;
	}

	public void setEditTime(String editTime) {
		this.editTime = editTime;
	}
}
