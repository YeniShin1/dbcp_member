package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class memberDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private DataSource ds=null;
	
	private Connection getConnection() {
		Context ctx;
		try {
			ctx = new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/MySQL");
			con = ds.getConnection();
		}catch (Exception e) {
				e.printStackTrace();
		}
		return con;
	}
	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}	
	private void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
public int member_insert(memberVO vo) {
	int result = 0;
	
	try {
		con=getConnection();
		con.setAutoCommit(false);
		
		String sql="insert into member values(?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, vo.getUserid());
		pstmt.setString(2, vo.getPassword());
		pstmt.setString(3, vo.getName());
		pstmt.setString(4, vo.getGender());
		pstmt.setString(5, vo.getEmail());
		result=pstmt.executeUpdate();
		con.commit();
	} catch (SQLException e) {
		try {
			con.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		e.printStackTrace();
	}finally {
		close(con,pstmt);
	}
	return result;
}
	
public memberVO isLogin(String userid, String password) {
	//id, password 정보에 해당하는 사용자 확인 후 
	//id와 name 넘겨주기
	memberVO vo=null; //vo(dto):데이터를 담아줄수 있는 바구니같은 역할

	try {
		con=getConnection();
		con.setAutoCommit(false);
		String sql="select userid, name from member where userid = ? and password = ? ";
		//rs는 select 결과 담는 테이블과 같은 역할
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			vo=new memberVO();
			//컬럼명을 직접써도 되고, 컬럼 순서로 호출해도 됨
			vo.setUserid(rs.getString("userid"));
			vo.setName(rs.getString("name"));
		}
		con.commit();
	} catch (Exception e) {
		try {
			con.rollback();
		} catch (SQLException e1){
			e1.printStackTrace();
		}
		e.printStackTrace();
	} finally {
		close(con,pstmt,rs);
	}
	return vo;
}

//아이디 체크
	public boolean checkId(String userid) {
		boolean flag=false;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="select * from member where userid=?";					

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs=pstmt.executeQuery();
			if(rs.next()) {
				flag=true;
			}
			con.commit();
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return flag;
	}
}