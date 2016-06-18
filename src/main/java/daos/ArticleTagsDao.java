package daos;

import java.util.List;

import models.ArtclTags;

public interface ArticleTagsDao {

	List<ArtclTags> getArtclTagByArtclCatId(String argArtclCatId);
	
}
