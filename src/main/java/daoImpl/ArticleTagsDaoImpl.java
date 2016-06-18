package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import daos.ArticleTagsDao;
import models.ArtclTags;
import util.CommonUtil;

public class ArticleTagsDaoImpl implements ArticleTagsDao{

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}

	
	@Override
	public List<ArtclTags> getArtclTagByArtclCatId(String argArtclCatId) {
		List<ArtclTags> artclTags = commonUtil.getJdbcTemplate().query(
				"SELECT artcl_tag_id, artcl_tag_name, artcl_tag_description "
						   + "FROM poscode.artcl_tags "
						   + "WHERE artcl_cat_id ='"+argArtclCatId+"'", 
				new RowMapper<ArtclTags>(){
					public ArtclTags mapRow(ResultSet rs, int rowNum) throws SQLException {
						ArtclTags artclTags = new ArtclTags();
						artclTags.setArtcl_tag_id(rs.getString(1));
						artclTags.setArtcl_tag_name(rs.getString(2));
						artclTags.setArtcl_tag_description(rs.getString(3));
						return artclTags;
					}
		});
		return artclTags;
	}

}
