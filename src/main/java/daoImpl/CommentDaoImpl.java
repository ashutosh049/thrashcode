package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;

import daos.CommentDao;
import models.Article;
import models.Comment;
import util.CommonUtil;

public class CommentDaoImpl implements CommentDao {

	private static final Logger logger = LoggerFactory.getLogger(CommentDaoImpl.class);

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}


	
	@Override
	public List<Comment> getComments(String argArtclId) {

		String query = "SELECT arctl_id, cmnt_id, user_id, cmt_date,user_fname, user_lname, cmt_data,cmt_filePath, cmt_file, cmt_likes , cmt_dislikes "
				      + "FROM article_comments " 
				      + "WHERE arctl_id=\""+argArtclId+"\""
				      + "ORDER BY cmt_date;";

		
		List<Comment> comments = commonUtil.getJdbcTemplate().query(
				query,
		        new RowMapper<Comment>() {
		            public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		            	Comment comment = new Comment();
		            	
		            	comment.setArctl_id(rs.getString("arctl_id"));
		            	comment.setCmnt_id(rs.getString("cmnt_id"));
		            	comment.setUser_id(rs.getString("user_id"));
		            	comment.setCmt_date(rs.getDate("cmt_date"));
		            	comment.setUser_fname(rs.getString("user_fname"));
		            	comment.setUser_lname(rs.getString("user_lname"));
		            	comment.setCmt_data(rs.getString("cmt_data"));
		            	comment.setCmt_filePath(rs.getString("cmt_filePath"));
		            	comment.setCmt_likes((long) rs.getInt("cmt_likes"));
		            	comment.setCmt_dislikes((long) rs.getInt("cmt_dislikes"));
		            	
		                return comment;
		            }
		        });
		       		
		return comments;
	}

	@Override
	public int setComment(Comment argComment) {
		return commonUtil.getJdbcTemplate().update(
		        "insert into article_comments "+
		       "(arctl_id, cmnt_id, user_id, user_fname, user_lname, cmt_date, cmt_filePath, cmt_data)"+
		       " values (?, ?, ?, ?, ?, ?, ?, ?)",
		        argComment.getArctl_id(), argComment.getCmnt_id(),argComment.getUser_id(),
		        argComment.getUser_fname(), argComment.getUser_lname(),argComment.getCmt_date(),
		        argComment.getCmt_filePath(),argComment.getCmt_data());
	}



	@Override
	public int likeUserComment(String argArtclId,String argCmtId) {
		return commonUtil.getJdbcTemplate().update("update article_comments "
				+ "SET cmt_likes = cmt_likes+1 "
				+ "WHERE arctl_id= ? AND cmnt_id = ?", argArtclId, argCmtId);
	}



	@Override
	public int dislikeUserComment(String argArtclId ,String argCmtId) {
		return commonUtil.getJdbcTemplate().update("update article_comments "
				+ "SET cmt_dislikes = cmt_dislikes+1 "
				+ "WHERE arctl_id= ? AND cmnt_id = ?", argArtclId, argCmtId);
	}



	@Override
	public int setCommentNotifications(String argArtclId, Comment argComment) {
		return commonUtil.getJdbcTemplate().update(
		        "insert into article_notifications "+
		       "(arctl_id, cmnt_id, user_id,"
		     + " cmnt_by_user_fname, cmnt_by_user_lname, cmt_date,"
		     + " read_status,notification_type,notification_data)"+
		       " values (?, ?, ?, ?, ?, ?, ?, ?, ?)",
		       argArtclId, 
		       argComment.getCmnt_id(),
		       argComment.getUser_id(), 
		       argComment.getUser_fname(), 
		       argComment.getUser_lname(),
		       argComment.getCmt_date(),
		       false,
		       "comment",
		       argComment.getCmt_data());
	}
	
	/*public String getArticleUserName(String argArticleId){
		String sql= "SELECT artcl_owner_name from articles WHERE artcl_id = ?";
		String userName = (String)commonUtil.getJdbcTemplate().queryForObject(
				sql, new Object[] { argArticleId }, String.class);
		return userName;
	}*/
	

}
