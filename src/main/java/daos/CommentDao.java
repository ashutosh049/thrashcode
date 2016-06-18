package daos;

import java.util.List;

import models.Comment;

public interface CommentDao {

	public List<Comment> getComments(String argArtclId);
	public int setComment(Comment argComment);
//	public int getCommentCount(String argArtclId);
	public int likeUserComment(String argArtclId, String argCmtId);
	public int dislikeUserComment(String argArtclId,String argCmtId);
	int setCommentNotifications(String argArtclId, Comment argComment);
	
}
