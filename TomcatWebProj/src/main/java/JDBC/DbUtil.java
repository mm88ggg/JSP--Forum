package JDBC;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DbUtil {
	private static final String URL = "jdbc:mysql://82.156.121.148:3306/JavaWebProj";
    private static final String USER = "root";
    private static final String PASSWORD = "1234AaBbCc..";
    private static Connection connection = null;

    public static Connection getConnection() {
    	if (connection == null) {
    		//1. 加载驱动程序
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            //2. 获得数据库连接
            try {
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (SQLException e) {
                e.printStackTrace();
            }
    	}
        return connection;
    }
    
    public static void releaseConnection(PreparedStatement pstm, ResultSet res) {
    	try {
    		if (res != null) {
    			res.close();
			}
	    	pstm.close();
	    	connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	connection = null;
    }
    
    public static String searchUser(String user) throws SQLException {
        String sql = "SELECT * FROM USER WHERE _USERNAME = ?";
        String pwd = null;
        PreparedStatement pstm = getConnection().prepareStatement(sql);
        pstm.setString(1, user);
        ResultSet res = pstm.executeQuery();
        if (res.next()) {
            pwd = res.getString("_PASSWORD");
        }
        releaseConnection(pstm, res);
        return pwd;
    }
    
    public static void addUser(String username, String password, String email, String telephone, String date) throws SQLException {
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sDate = null;
		try {
			java.util.Date date3 = sdf2.parse(date);
			sDate = new java.sql.Date(date3.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String sql = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, NOW());";
		PreparedStatement pstm = DbUtil.getConnection().prepareStatement(sql);
		pstm.setString(1, username);
		pstm.setString(2, password);
		pstm.setString(3, email);
		pstm.setString(4, telephone);
		pstm.setDate(5, sDate);
		pstm.execute();
		releaseConnection(pstm, null);
    }
    
    public static void addTopic(String username, String topic, String content) throws SQLException {
    	String sql = "INSERT INTO TOPIC(TOPIC, _USERNAME, CONTENT, TIME) VALUES(?, ?, ?, NOW());";
    	PreparedStatement pstm = DbUtil.getConnection().prepareStatement(sql);
    	pstm.setString(1, topic);
    	pstm.setString(2, username);
    	pstm.setString(3, content);
    	pstm.execute();
    	releaseConnection(pstm, null);
    }
    
    public static ArrayList<Topic> getAllTopic() throws SQLException {
    	ArrayList<Topic> resArrayList = new ArrayList<Topic>();
    	String sql = "SELECT * FROM TOPIC ORDER BY EDITTIME DESC;";
    	PreparedStatement pstm = DbUtil.getConnection().prepareStatement(sql);
    	ResultSet res = pstm.executeQuery(sql);
    	while (res.next()) {
        	Topic tmpTopic = new Topic();
    		tmpTopic.setTopic(res.getString(1));
    		tmpTopic.setUsername(res.getString(2));
    		tmpTopic.setContent(res.getString(3));
    		tmpTopic.setDate(res.getString(4));
    		tmpTopic.setId(res.getInt(5));
    		tmpTopic.setEditTime(res.getString(6));
    		resArrayList.add(tmpTopic);
    	}
    	releaseConnection(pstm, res);
    	return resArrayList;
    }
    
    public static Topic getTopic(int id) throws SQLException {
    	String sql = "SELECT * FROM TOPIC WHERE ID = ?";
    	PreparedStatement pstm = getConnection().prepareStatement(sql);
    	pstm.setInt(1, id);
    	ResultSet resultSet = pstm.executeQuery();
    	Topic topic = null;
    	if (resultSet.next()) {
			topic = new Topic(resultSet.getString(1), id, resultSet.getString(4), resultSet.getString(2), resultSet.getString(3));
		}
    	releaseConnection(pstm, resultSet);
    	return topic;
    }
    
    public static void addReply(int tid, String username, String content) throws SQLException {
    	String sql1 = "INSERT INTO REPLY(TID, _USERNAME, CONTENT, TIME) VALUES(?, ?, ?, NOW())";
    	PreparedStatement pstm = getConnection().prepareStatement(sql1);
    	pstm.setInt(1, tid);
    	pstm.setString(2, username);
    	pstm.setString(3, content);
    	pstm.execute();
    	
    	String sql2 = "UPDATE TOPIC SET EDITTIME = NOW() WHERE ID = ?;";
    	pstm = getConnection().prepareStatement(sql2);
    	pstm.setInt(1, tid);
    	pstm.execute();
    	releaseConnection(pstm, null);
    }
    
    public static ArrayList<Reply> getAllReply(int tid) throws SQLException {
    	ArrayList<Reply> resArrayList = new ArrayList<Reply>();
    	String sql = "SELECT * FROM REPLY WHERE TID = ? ORDER BY TIME;";
    	PreparedStatement pstm = getConnection().prepareStatement(sql);
    	pstm.setInt(1, tid);
    	ResultSet res = pstm.executeQuery();
    	while (res.next()) {
			Reply reply = new Reply(res.getInt(1), res.getString(2), res.getInt(3), res.getString(4), res.getString(5));
			resArrayList.add(reply);
		}
    	releaseConnection(pstm, res);
    	return resArrayList;
    }
}
