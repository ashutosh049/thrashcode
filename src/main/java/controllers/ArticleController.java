package controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import daoImpl.ArticleCategoriesDaoImpl;
import daoImpl.ArticleDaoImpl;
import daoImpl.CommentDaoImpl;
import daoImpl.UserActivityDaoImpl;
import daoImpl.UserDaoImpl;
import models.Article;
import models.ArticleRenderList;
import models.Comment;
import models.GenericWithImage;
import models.User;
import models.UserActivity;
import models.UserParameters;
import util.CommonUtil;
import util.ThrashConstants;

@Scope("session")
@RestController
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Autowired ArticleDaoImpl articleDao;
	@Autowired CommentDaoImpl commentDao;
	@Autowired UserDaoImpl userDao;
	@Autowired User user;
	@Autowired Comment comment;
	@Autowired CommonUtil commonUtil;
	@Autowired Article article;
	@Autowired UserParameters userParameters;
	@Autowired GenericWithImage genericWithImage;
	@Autowired ArticleCategoriesDaoImpl articleCategoriesDao;
	@Autowired UserActivity userActivity;
	@Autowired UserActivityDaoImpl userActivityDaoImpl;
	
	@Value("${poscode_root_dir}") private String poscode_root_dir;
	@Value("${article_root_dir}") private String article_root_dir;
	@Value("${comment_root_dir}") private String comment_root_dir;

	private List<Article> articleList = null;
	private List<GenericWithImage> genericWithImageList = null;

	@RequestMapping(value = "/articles", method = RequestMethod.GET)
	public ModelAndView articles(Locale locale, Model model) throws IOException {

		ModelAndView modelAndView = new ModelAndView("articles");
		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());

		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters
					.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
			InputStream stream = multipartFile.getInputStream();
			byte[] bytes = IOUtils.toByteArray(stream);
			modelAndView.addObject("userimage", Base64.encode(bytes));
			modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
			modelAndView.addObject("contenttype", multipartFile.getContentType());
		}

		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());

		articleList = new LinkedList<Article>();
		articleList = articleDao.getUserArticle(user.getUser_id());

		modelAndView.addObject("userArticles", articleList);

		return modelAndView;
	}

	@RequestMapping(value = "/fetchArticle")
	public @ResponseBody List<Article> fetchArticle(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response, @RequestParam("tags") String tags) throws Exception {
		articleList = new LinkedList<Article>();
		articleList = articleDao.getArticlesByTag(tags);
		for (Article article : articleList) {
			String artcl_brf_desc = article.getArtcl_brf_desc();
			if (tags != "") {
				int index = artcl_brf_desc.toUpperCase().indexOf(tags.toUpperCase());
				String before = "";
				String highlighted = "";
				String after = "";
				while (index >= 0) {
					int len = tags.length();
					before = artcl_brf_desc.substring(0, index);
					highlighted = "<span class='label label-success'>" + tags + "</span>";
					after = artcl_brf_desc.substring(index + len);
					artcl_brf_desc = before + highlighted + after;
					index = artcl_brf_desc.toUpperCase().indexOf(tags.toUpperCase(), index + highlighted.length());
				}
			}
			article.setArtcl_brf_desc(artcl_brf_desc);
		}
		return articleList;
	}

	@RequestMapping(value = "/fetchArticleForm")
	public ModelAndView fetchArticleForm(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView("index");
		String tags = "";
		if (request.getParameter("fetchBootArticlesWithTags") != null) {
			tags = request.getParameter("fetchBootArticlesWithTags");
		}
		logger.error("\n\n----" + "@mthd : fetchArticle()" + "\n" + "@RequestParam :tags =" + tags + "\n");
		articleList = new LinkedList<Article>();
		articleList = articleDao.getArticlesByTag(tags);
		for (Article article : articleList) {
			String artcl_brf_desc = article.getArtcl_brf_desc();
			if (tags != "") {
				int index = artcl_brf_desc.toUpperCase().indexOf(tags.toUpperCase());
				String before = "";
				String highlighted = "";
				String after = "";
				while (index >= 0) {
					int len = tags.length();
					before = artcl_brf_desc.substring(0, index);
					highlighted = "<span class='label label-success'>" + tags + "</span>";
					after = artcl_brf_desc.substring(index + len);
					artcl_brf_desc = before + highlighted + after;
					index = artcl_brf_desc.toUpperCase().indexOf(tags.toUpperCase(), index + highlighted.length());
				}
			}
			article.setArtcl_brf_desc(artcl_brf_desc);
		}

		view.addObject("articleList", articleList);

		return view;
	}

	@RequestMapping(value = "/fetchArticleBy")
	public @ResponseBody List<Article> fetchArticleBy(Model model, RedirectAttributes redirectAttributes,
			HttpServletRequest request, HttpServletResponse response, @RequestParam("constraint") String constraint,
			@RequestParam("value") String value) throws Exception {

		articleList = new LinkedList<Article>();

		if (constraint.equals(ThrashConstants.ARTICLE_CATEGORY_ID)) {
			articleList = articleDao.getArticlesByCategory(value);
		} else if (constraint.equals(ThrashConstants.ARTICLE_TAGS)) {
			articleList = articleDao.getArticlesByTag(value);
		} else if (constraint.equals(ThrashConstants.ARTICLE_OWNER_ID)) {
			articleList = articleDao.getArticlesByOwnerId(value);
		}

		return articleList;
	}

	public List<GenericWithImage> fetchArticleWithImg(String argTags) throws Exception {
		logger.error("\n\n----" + "@mthd : fetchArticleWithImg()" + "\n" + "@RequestParam :tags =" + argTags + "\n");
		articleList = new LinkedList<Article>();
		articleList = articleDao.getArticlesByTag(argTags);
		if (articleList != null && articleList.size() > 0) {
			genericWithImageList = commonUtil.bundleObjectToGenericWithImg(articleList);
			for (GenericWithImage genericList : genericWithImageList) {
				CommonsMultipartFile commonsMultipartFile = userDao
						.getUserImgData(((Comment) genericList.getClassData()).getUser_id());
				MultipartFile multipartFile = commonsMultipartFile;
				byte[] bytes = IOUtils.toByteArray(multipartFile.getInputStream());
				genericList.setImgData(commonsMultipartFile);
				genericList.setContentType(multipartFile.getContentType());
				genericList.setEncoding(Base64.encode(bytes));
			}
		}
		return genericWithImageList;
	}

	@RequestMapping(value = "/renderArticleFile", produces = "text/html;charset=UTF-8")
	public ModelAndView renderArticleFile(Model model, RedirectAttributes redirectAttributes,
			HttpServletRequest request, HttpServletResponse response, @RequestParam("arctl_id") String arctl_id)
					throws Exception {

		ModelAndView modelAndView = new ModelAndView("articlesRead");
		modelAndView.addObject("peak_index", null);
		modelAndView.addObject("peak_article_read", "articlesRead");
		modelAndView.addObject("peak_article_create", null);
		modelAndView.addObject("peak_notification", null);
		modelAndView.addObject("peak_user_profile", null);

		Article article = articleDao.getArticlesByArticleId(arctl_id);
		Article article_obj = null;
		if (commonUtil.ifDirExists(article.getArtcl_filePath())) {
			article_obj = commonUtil.getAtclData(articleDao.getArticlesByArticleId(arctl_id));
			modelAndView.addObject("arctl_obj", article_obj);
			modelAndView.addObject("arctl_mod_date", new SimpleDateFormat("MMMM dd yyyy").format(article_obj.getArtcl_mod_date()));	
			
			
			List<Comment> commentsList = commentDao.getComments(arctl_id);
			commentsList = commonUtil.getCmtData(commentsList);
			if (commentsList != null) {
				genericWithImageList = commonUtil.bundleCommentToGenericWithImg(commentsList);
				for (GenericWithImage genericList : genericWithImageList) {
					CommonsMultipartFile commonsMultipartFile = userDao
							.getUserImgData(((Comment) genericList.getClassData()).getUser_id());
					MultipartFile multipartFile = commonsMultipartFile;
					byte[] bytes = IOUtils.toByteArray(multipartFile.getInputStream());
					genericList.setImgData(commonsMultipartFile);
					genericList.setContentType(multipartFile.getContentType());
					genericList.setEncoding(Base64.encode(bytes));
				}
				modelAndView.addObject("genericWithImageList", genericWithImageList);
			}
		} else {
			return new ModelAndView("redirect:articleNotFound?argArticleTitle=" + article.getArtcl_title());
		}

		// about the author

		User author = userDao.getUserById(article.getArtcl_owner_id());
		if (author.getUser_id() != null) {
			MultipartFile multipartFile = author.getUser_img();
			InputStream stream = multipartFile.getInputStream();
			byte[] bytes = IOUtils.toByteArray(stream);
			modelAndView.addObject("author_image", Base64.encode(bytes));
			modelAndView.addObject("author_fileoriginalsize", multipartFile.getSize());
			modelAndView.addObject("author_contenttype", multipartFile.getContentType());
			modelAndView.addObject("author_userId", author.getUser_id());
			modelAndView.addObject("author_email", author.getUser_email());
			modelAndView.addObject("author_fName", author.getUser_fname());
			modelAndView.addObject("author_lName", author.getUser_lname());
		}

		modelAndView.addObject("arctl_id", arctl_id);
		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters
					.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
			InputStream stream = multipartFile.getInputStream();
			byte[] bytes = IOUtils.toByteArray(stream);
			modelAndView.addObject("userimage", Base64.encode(bytes));
			modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
			modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());

		//------ UserActivity
		
		List<UserActivity> userActivityList = userActivityDaoImpl.getUserActivitiesByArticleIdByUserId(arctl_id, user.getUser_id());
		userActivity = ((userActivityList!=null && userActivityList.size()>0) ? userActivityList.get(0) : null);
		modelAndView.addObject("userActivity", userActivity);
		
		articleDao.updateArticleHits(arctl_id);

		return modelAndView;
	}

	@RequestMapping(value = "/prepreArticleToRead", method = RequestMethod.POST)
	public String prepreArticleToRead(@RequestParam("arctl_id") String arctl_id) throws Exception {
		logger.error(
				"\n\n----" + "@mthd : prepreArticleToRead()" + "\n" + "@RequestParam : arctl_id =" + arctl_id + "\n");
		return "renderArticleFile?arctl_id=" + arctl_id;
	}

	@RequestMapping(value = "/postComment", method = RequestMethod.POST)
	public String postComment(@RequestParam("arctl_id") String arctl_id,
			@RequestParam("loggedInUserId") String loggedInUserId, @RequestParam("argCmtData") String argCmtData)
					throws Exception {
		logger.error("\n\n----" + "@mthd : postComment()" + "\n" + "@RequestParam : loggedInUserId =" + loggedInUserId
				+ "\n" + "@RequestParam : argCmtData =" + argCmtData + "\n");

		int cmtNo = commentDao.getComments(arctl_id).size() + 1;
		String cmtId = arctl_id + "_cmnt_" + cmtNo;
		// String cmt_filePath =
		// C:/poscode_REPO/articles/artcl_4/Comment

		comment.setArctl_id(arctl_id);
		comment.setCmnt_id(cmtId);
		comment.setCmt_date(new Date());
		comment.setUser_fname(user.getUser_fname());
		comment.setUser_id(user.getUser_id());
		comment.setUser_lname(user.getUser_lname());
		String comment_file_path=poscode_root_dir+article_root_dir+arctl_id+"/"+comment_root_dir+"";
		comment.setCmt_filePath(comment_file_path);
		String cmt_dataDB = (argCmtData.length() >= 30 ? argCmtData.substring(0, 30) : argCmtData);
		comment.setCmt_data(cmt_dataDB);

		if (commentDao.setComment(comment) > 0) {
			commonUtil.createDataFile(arctl_id, cmtId, argCmtData, comment_file_path , cmtId + ".txt");
			commentDao.setCommentNotifications(arctl_id, comment);
			return "success";
		} else
			return "error";
	}

	@RequestMapping(value = "/articlesCreate", method = RequestMethod.GET)
	public ModelAndView articlesCreate(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		logger.error("\n\n----" + "@mthd : articlesCreate()" + "\n");

		ModelAndView modelAndView = new ModelAndView("articlesCreate");

		Article articleModal = new Article();
		modelAndView.addObject("articleModal", articleModal);

		modelAndView.addObject("peak_index", null);
		modelAndView.addObject("peak_article_read", null);
		modelAndView.addObject("peak_article_create", "articlesCreate");
		modelAndView.addObject("peak_notification", null);
		modelAndView.addObject("peak_user_profile", null);

		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
			InputStream stream = multipartFile.getInputStream();
			byte[] bytes = IOUtils.toByteArray(stream);
			modelAndView.addObject("userimage", Base64.encode(bytes));
			modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
			modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());

		return modelAndView;
	}


	@RequestMapping(value = "/likeComment", method = RequestMethod.POST)
	public void likeComment(Locale locale, Model model, @RequestParam("arctl_id") String arctl_id,
			@RequestParam("cmt_id") String cmt_id) {
		logger.error("\n\n----" + "@mthd : likeComment()" + "\n" + "@RequestParam : arctl_id =" + arctl_id + "\n"
				+ "@RequestParam : cmt_id =" + cmt_id + "\n");
		commentDao.likeUserComment(arctl_id, cmt_id);
	}

	@RequestMapping(value = "/dislikeComment", method = RequestMethod.POST)
	public void dislikeComment(Locale locale, Model model, @RequestParam("arctl_id") String arctl_id,
			@RequestParam("cmt_id") String cmt_id) {
		logger.error("\n\n----" + "@mthd : dislikeComment()" + "\n" + "@RequestParam : arctl_id =" + arctl_id + "\n"
				+ "@RequestParam : cmt_id =" + cmt_id + "\n");
		commentDao.dislikeUserComment(arctl_id, cmt_id);
	}

	@RequestMapping(value = "/navbar_bootsnipp", method = RequestMethod.GET)
	public ModelAndView navbarBootsnipp(Locale locale, Model model) throws IOException {

		logger.error("\n\n----" + "@mthd : navbarBootsnipp()" + "\n");

		ModelAndView modelAndView = new ModelAndView("navbar_bootsnipp");
		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());

		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters
					.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
			InputStream stream = multipartFile.getInputStream();
			byte[] bytes = IOUtils.toByteArray(stream);
			modelAndView.addObject("userimage", Base64.encode(bytes));
			modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
			modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());

		articleList = new LinkedList<Article>();
		articleList = articleDao.getUserArticle(user.getUser_id());

		modelAndView.addObject("userArticles", articleList);

		return modelAndView;
	}

	@RequestMapping(value = "/fetchArticleFile")
	public @ResponseBody String fetchArticleFile(Model model, RedirectAttributes redirectAttributes,
			HttpServletRequest request, HttpServletResponse response, @RequestParam("file") File file)
					throws Exception {

		BufferedReader br = null;

		try {

			String sCurrentLine;

			br = new BufferedReader(new FileReader(file));

			while ((sCurrentLine = br.readLine()) != null) {
				System.out.println(sCurrentLine);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}

		return "success";
	}

	@RequestMapping(value = "/publishArticleByForm", method = RequestMethod.POST)
	public ModelAndView publishArticleByForm(@ModelAttribute("articleModal") Article articleModal) throws IOException {
		int artcl_count = articleDao.getArticlesByTag("").size() + 1;
		String artcl_id = "artcl_" + artcl_count;
		article.setArtcl_id(artcl_id);
		article.setArtcl_cat_id(articleModal.getArtcl_cat_id());
		article.setArtcl_owner_id(user.getUser_id());
		article.setArtcl_status(ThrashConstants.ARTCL_STATUS_ACTIVE);
		article.setArtcl_title(articleModal.getArtcl_title());
		article.setArtcl_brf_desc(articleModal.getArtcl_brf_desc());
		article.setArtcl_create_date(new Date());
		article.setArtcl_mod_date(new Date());
		List<String> artcl_tags = new LinkedList<String>();
		for (String tag : articleModal.getArtcl_tags()) {
			artcl_tags.add(tag);
		}
		article.setArtcl_tags(artcl_tags);
		article.setArtcl_Data(null);
		String artcl_filePath = poscode_root_dir+article_root_dir+artcl_id+"/";
		String artcl_fileName = artcl_id + ".txt";
		article.setArtcl_filePath(artcl_filePath + "/" + artcl_fileName);
		article.setArtcl_type(articleModal.getArtcl_type());
		article.setArtcl_visits(0); 
		article.setArtcl_hits_positive(0); 
		article.setArtcl_hits_negetive(0);
		if (articleDao.publishArticle(article) > 0) {
			if(commonUtil.createDataFile(artcl_id, artcl_id, articleModal.getArtcl_Data(), artcl_filePath,artcl_fileName)){
				return new ModelAndView("redirect:index");
			}
		}
		return new ModelAndView("articleNotFound");
	}

	@RequestMapping(value = "/renderArticleList")
	public @ResponseBody List<ArticleRenderList> renderArticleList(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response, @RequestParam("tags") String tags) throws Exception {
		List<ArticleRenderList> renderList = new LinkedList<ArticleRenderList>();
		articleList = new LinkedList<Article>();
		articleList = articleDao.getArticlesByTag(tags);
		for (Article article : articleList) {
			ArticleRenderList render = new ArticleRenderList();
			article = CommonUtil.highlightArticleSearchString(article, tags);
			render = CommonUtil.adaptArticleToRenderList(article,
					userDao.getUserById(article.getArtcl_owner_id()).getUser_fname(),
					commentDao.getComments(article.getArtcl_id()).size());
			renderList.add(render);
		}
		return renderList;
	}
	
	@RequestMapping(value = "/hitArticle", method = RequestMethod.POST)
	public @ResponseBody String hitArticle(@RequestParam("arctl_id") String argArctl_id,@RequestParam("hitType") String argHitType) throws Exception {
			List<UserActivity> userActivityList = userActivityDaoImpl.getUserActivitiesByArticleIdByUserId(argArctl_id, user.getUser_id());
			UserActivity newUserActivity = new UserActivity();
			newUserActivity.setUser_id(user.getUser_id());
			newUserActivity.setArtcl_id(argArctl_id);
			newUserActivity.setActvty_cat(ThrashConstants.ACTVTY_CAT_ARTCL);
			newUserActivity.setUser_actvty_create_date(new Date());
			
			Date user_actvty_mod_date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date1 = sdf.format(user_actvty_mod_date);
			Date d1 = sdf.parse(date1);
			
			newUserActivity.setUser_actvty_mod_date(new Date());
			if(argHitType.equals(ThrashConstants.ARTCL_HIT_POSITIVE)){
		       newUserActivity.setUser_actvty_id(user.getUser_id()+"_"+ThrashConstants.USER_ACTVTY_ID_ARTCL_LIKE);
		       newUserActivity.setActvty_id(ThrashConstants.ACTVTY_ID_ARTCL_LIKE);
		       newUserActivity.setUser_actvty_desc(user.getUser_id()+" "+ThrashConstants.USER_ACTVTY_DESC_ARTCL_LIKE+" "+argArctl_id);
			}else if(argHitType.equals(ThrashConstants.ARTCL_HIT_NEGETIVE)){
		       newUserActivity.setUser_actvty_id(user.getUser_id()+"_"+ThrashConstants.USER_ACTVTY_ID_ARTCL_DISLIKE);
		       newUserActivity.setActvty_id(ThrashConstants.ACTVTY_ID_ARTCL_DISLIKE);
		       newUserActivity.setUser_actvty_desc(user.getUser_id()+" "+ThrashConstants.USER_ACTVTY_DESC_ARTCL_DISLIKE+" "+argArctl_id);
			}
			
			if(userActivityList!=null && userActivityList.size()>0){
				if(userActivityDaoImpl.updateUserActivity(newUserActivity)>0){
					if(articleDao.hitArticleUpdate(argArctl_id, argHitType)){
						return ThrashConstants.STATUS_SUCCESS;
					}
				}
			}else{
				if(userActivityDaoImpl.createUserActivity(newUserActivity)>0){
					if(articleDao.hitArticle(argArctl_id, argHitType)){
						return ThrashConstants.STATUS_SUCCESS;
					}
				}
			}
		return ThrashConstants.STATUS_ERROR;
	}
	
	
}
