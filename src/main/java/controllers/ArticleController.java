package controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

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
import daoImpl.UserDaoImpl;
import models.Article;
import models.Comment;
import models.GenericWithImage;
import models.User;
import models.UserParameters;
import util.CommonUtil;
import util.Operation;
import util.ValueKeys;

@Scope("session")
@RestController
public class ArticleController extends Operation {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Autowired ArticleDaoImpl articleDao;
	@Autowired CommentDaoImpl commentDao;
	@Autowired UserDaoImpl userDao;
	@Autowired User user;
	@Autowired Comment comment;
	@Autowired CommonUtil commonUtil;
	@Autowired Article article;
	@Autowired ValueKeys valueKeys;
	@Autowired UserParameters userParameters;
	@Autowired GenericWithImage genericWithImage;
	@Autowired ArticleCategoriesDaoImpl articleCategoriesDao;
	@Value("${cmt_filePath}") private String cmt_filePath;
	@Value("${poscode_root_dir}") private String poscode_root_dir;
	
	
	
	
	private List<Article> articleList = null;
	private List<GenericWithImage> genericWithImageList = null;

	
	@RequestMapping(value = "/articles", method = RequestMethod.GET)
	public ModelAndView articles(Locale locale, Model model) throws IOException {
		
		logger.error("\n\n----" + "@mthd : articles()"+"\n");
		
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
		logger.error("\n\n----"+ "@mthd : fetchArticle()"+"\n"+ "@RequestParam :tags ="+tags+"\n");
		articleList = new LinkedList<Article>();
		articleList = articleDao.getArticles(tags);
		for (Article article : articleList) {
			String artcle_brf_desc = article.getArtcle_brf_desc();
			if(tags!=""){
				int index = artcle_brf_desc.toUpperCase().indexOf(tags.toUpperCase());
				String before="";
				String highlighted="";
				String after="";
				while(index>=0){
					int len = tags.length();
					before = artcle_brf_desc.substring(0,index);
					highlighted = "<span class='label label-success'>"+tags+"</span>";
					after = artcle_brf_desc.substring(index+len);
					artcle_brf_desc = before+highlighted+after;
					index = artcle_brf_desc.toUpperCase().indexOf(tags.toUpperCase(),index+highlighted.length());
				}
			}
			article.setArtcle_brf_desc(artcle_brf_desc);
		}
		return articleList;
	}
	
	//@RequestMapping(value = "/fetchArticleWithImg")
	public List<GenericWithImage> fetchArticleWithImg(String argTags) throws Exception {
		logger.error("\n\n----"+ "@mthd : fetchArticleWithImg()"+"\n"+ "@RequestParam :tags ="+argTags+"\n");
		articleList = new LinkedList<Article>();
		articleList = articleDao.getArticles(argTags);
		if(articleList!=null && articleList.size()>0){
			genericWithImageList = commonUtil.bundleArticleToGenericWithImg(articleList);
			for (GenericWithImage genericList : genericWithImageList) {
				CommonsMultipartFile commonsMultipartFile = userDao.getUserImgData(((Comment) genericList.getClassData()).getUser_id());
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
			HttpServletRequest request, HttpServletResponse response, @RequestParam("arctl_id") String arctl_id) throws Exception {

		logger.error("\n\n----"+ "@mthd : renderArticleFile()"+"\n"+ "@RequestParam : arctl_id ="+arctl_id+"\n");

		ModelAndView modelAndView = new ModelAndView("articlesRead");
		modelAndView.addObject("peak_index", null);
		modelAndView.addObject("peak_article_read", "articlesRead");
		modelAndView.addObject("peak_article_create", null);
		modelAndView.addObject("peak_notification", null);
		modelAndView.addObject("peak_user_profile", null);
		
		
		
		Article article = articleDao.getArticle(arctl_id);
		Article article_obj = null;
		if(commonUtil.ifDirExists(article.getArtcle_filePath())){
			article_obj=commonUtil.getAtclData(articleDao.getArticle(arctl_id));
			modelAndView.addObject("arctl_obj", article_obj);
			List<Comment> commentsList = commentDao.getComments(arctl_id);
			commentsList = commonUtil.getCmtData(commentsList);
			if (commentsList != null) {
				genericWithImageList = commonUtil.bundleCommentToGenericWithImg(commentsList);
				for (GenericWithImage genericList : genericWithImageList) {
					CommonsMultipartFile commonsMultipartFile = userDao.getUserImgData(((Comment) genericList.getClassData()).getUser_id());
					MultipartFile multipartFile = commonsMultipartFile;
					byte[] bytes = IOUtils.toByteArray(multipartFile.getInputStream());
					genericList.setImgData(commonsMultipartFile);
					genericList.setContentType(multipartFile.getContentType());
					genericList.setEncoding(Base64.encode(bytes));
				}
				modelAndView.addObject("genericWithImageList", genericWithImageList);
			}
		}else{
		 // error in article file..render error messgae
			return new ModelAndView("redirect:articleNotFound?argArticleTitle="+article.getArtcle_title());
		}
		
		// about the author
		
		User author = userDao.getUserById(article.getArtcl_owner_id());
		if (author.getUser_id() != null) {
			MultipartFile multipartFile = author.getUser_img();
	        InputStream stream = multipartFile.getInputStream();
	        byte[] bytes = IOUtils.toByteArray(stream);
	        modelAndView.addObject("author_image",Base64.encode(bytes));
	        modelAndView.addObject("author_fileoriginalsize", multipartFile.getSize());
	        modelAndView.addObject("author_contenttype", multipartFile.getContentType());
	        modelAndView.addObject("author_userId",author.getUser_id());
	        modelAndView.addObject("author_email",author.getUser_email());
	        modelAndView.addObject("author_fName",author.getUser_fname());
	        modelAndView.addObject("author_lName",author.getUser_lname());
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

		@SuppressWarnings("static-access")
		String testData = (String) getScopedValue(valueKeys.TEST);

		articleDao.updateArticleHits(arctl_id);

		return modelAndView;
	}

	@RequestMapping(value = "/prepreArticleToRead", method = RequestMethod.POST)
	public String prepreArticleToRead(@RequestParam("arctl_id") String arctl_id) throws Exception {
		logger.error("\n\n----"
				+ "@mthd : prepreArticleToRead()"+"\n"
				+ "@RequestParam : arctl_id ="+arctl_id+"\n");
		return "renderArticleFile?arctl_id=" + arctl_id;
	}

	@RequestMapping(value = "/postComment", method = RequestMethod.POST)
	public String postComment(@RequestParam("arctl_id") String arctl_id,@RequestParam("loggedInUserId") String loggedInUserId, @RequestParam("argCmtData") String argCmtData) throws Exception {
		logger.error("\n\n----"+ "@mthd : postComment()"+"\n"+ "@RequestParam : loggedInUserId ="+loggedInUserId+"\n"+ "@RequestParam : argCmtData ="+argCmtData+"\n");
		
		int cmtNo = commentDao.getComments(arctl_id).size() + 1;
		String cmtId = arctl_id + "_cmnt_" + cmtNo;
//		String cmt_filePath = "C:/REBB_REPO/REBB_REPO_ARCTL/REBB_REPO_ARCTL_CONTS/" + arctl_id;

		comment.setArctl_id(arctl_id);
		comment.setCmnt_id(cmtId);
		comment.setCmt_date(new Date());
		comment.setUser_fname(user.getUser_fname());
		comment.setUser_id(user.getUser_id());
		comment.setUser_lname(user.getUser_lname());
		comment.setCmt_filePath(cmt_filePath+arctl_id);
		String cmt_dataDB = (argCmtData.length()>=30 ? argCmtData.substring(0,30): argCmtData);
		comment.setCmt_data(cmt_dataDB);
		
		if (commentDao.setComment(comment) > 0) {
			commonUtil.createDataFile(arctl_id, cmtId, argCmtData, cmt_filePath+arctl_id, cmtId + ".txt");
			commentDao.setCommentNotifications(arctl_id, comment);
			return "success";
		} else
			return "error";
	}

	@RequestMapping(value = "/articlesCreate", method = RequestMethod.GET)
	public ModelAndView articlesCreate(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		logger.error("\n\n----"
				+ "@mthd : articlesCreate()"+"\n");
		
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

		return modelAndView;
	}
	
	@RequestMapping(value = "/publishArticle", method = RequestMethod.GET)
	public String publishArticle(
			@RequestParam("publishArticle_title") String publishArticle_title,
			@RequestParam("publishArticle_artcltypes") String publishArticle_artcltypes,
			@RequestParam("publishArticle_desc") String publishArticle_desc,
			@RequestParam("publishArticle_tags") String[] publishArticle_tags,
			@RequestParam("loggedInUserId") String loggedInUserId, 
			@RequestParam("encodedData") String encodedData)
					throws IOException {
		
		logger.error("\n\n----"
				+ "@mthd : publishArticle()"+"\n"
				+ "@RequestParam : publishArticle_title ="+publishArticle_title+"\n"
				+ "@RequestParam : publishArticle_artcltypes ="+publishArticle_artcltypes+"\n"
				+ "@RequestParam : publishArticle_desc ="+publishArticle_desc+"\n"
				+ "@RequestParam : publishArticle_tags ="+Arrays.asList(publishArticle_tags)+"\n"
				);

		int artcl_count = articleDao.getArticles("").size() + 1;
		String artcl_id = "artcl_" + artcl_count;
		article.setArtcl_id(artcl_id);
		article.setArtcl_date(new Date());
		article.setArtcl_owner_name(user.getUser_fname());
		/*String artcl_filePath = valueKeys.artcl_filePath + artcl_id;*/
		String artcl_filePath = poscode_root_dir;
		String artcl_fileName = artcl_id + ".txt";

		List<String> artcl_tags = new LinkedList<String>();
		
		for (String tag : publishArticle_tags) {
			artcl_tags.add(tag);
		}
		
		article.setArtcl_owner_id(user.getUser_id());
		article.setArtcle_title(publishArticle_title);
		article.setArtcle_type(publishArticle_artcltypes);
		article.setArtcle_brf_desc(publishArticle_desc);
		article.setArtcl_tags(artcl_tags);
		article.setArtcle_filePath(artcl_filePath + "/" + artcl_fileName);

		if (articleDao.publishArticle(article) > 0) {
			commonUtil.createDataFile(artcl_id, artcl_id, encodedData, artcl_filePath, artcl_fileName);
			return "index";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/likeComment", method = RequestMethod.POST)
	public void likeComment(Locale locale, Model model, @RequestParam("arctl_id") String arctl_id,
			@RequestParam("cmt_id") String cmt_id) {
		logger.error("\n\n----"
				+ "@mthd : likeComment()"+"\n"
				+ "@RequestParam : arctl_id ="+arctl_id+"\n"
				+ "@RequestParam : cmt_id ="+cmt_id+"\n"
				);
		commentDao.likeUserComment(arctl_id, cmt_id);
	}

	@RequestMapping(value = "/dislikeComment", method = RequestMethod.POST)
	public void dislikeComment(Locale locale, Model model, @RequestParam("arctl_id") String arctl_id,
			@RequestParam("cmt_id") String cmt_id) {
		logger.error("\n\n----"
				+ "@mthd : dislikeComment()"+"\n"
				+ "@RequestParam : arctl_id ="+arctl_id+"\n"
				+ "@RequestParam : cmt_id ="+cmt_id+"\n"
				);
		commentDao.dislikeUserComment(arctl_id, cmt_id);
	}
	
	@RequestMapping(value = "/navbar_bootsnipp", method = RequestMethod.GET)
	public ModelAndView navbarBootsnipp(Locale locale, Model model) throws IOException {
		
		logger.error("\n\n----"
				+ "@mthd : navbarBootsnipp()"+"\n"
				);
		
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
	        modelAndView.addObject("userimage",Base64.encode(bytes));
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

	@RequestMapping(value = "/publishArticle_", method = RequestMethod.GET)
	public String publishArticle_(HttpServletRequest request, HttpServletResponse response){
		
		logger.error("\n\n----"
				+ "@mthd : publishArticle_()"+"\n"
				);
		
		request.getAttribute("loggedInUserId");
		request.getParameter("publishArticle_tags");
		Map<String, String> reqParams = request.getParameterMap();
		for (String entry : reqParams.keySet()){
			System.out.println(entry+" - "+reqParams.get(entry));
		}
		return null;
	}
	@RequestMapping(value = "/fetchArticleFile")
	public @ResponseBody String fetchArticleFile(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response, @RequestParam("file") File file) throws Exception {
		
		BufferedReader br = null;

		try {

			String sCurrentLine;

			/*br = new BufferedReader(new FileReader("C:\\testing.txt"));*/
			br  = new BufferedReader(new FileReader(file));

			while ((sCurrentLine = br.readLine()) != null) {
				System.out.println(sCurrentLine);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}

		
		return "success";
	}

	@RequestMapping(value = "/publishArticleByForm", method = RequestMethod.GET)
	public ModelAndView publishArticleByForm(@ModelAttribute("articleModal") Article articleModal) throws IOException{
		
		int artcl_count = articleDao.getArticles("").size() + 1;
		String artcl_id = "artcl_" + artcl_count;
		article.setArtcl_id(artcl_id);
		article.setArtcl_date(new Date());
		article.setArtcl_owner_name(user.getUser_fname());
		/*String artcl_filePath = valueKeys.artcl_filePath + artcl_id;*/
		String artcl_filePath = poscode_root_dir;
		String artcl_fileName = artcl_id + ".txt";

		List<String> artcl_tags = new LinkedList<String>();
		
		for (String tag : articleModal.getArtcl_tags()) {
			artcl_tags.add(tag);
		}
		
		article.setArtcl_owner_id(user.getUser_id());
		article.setArtcle_title(articleModal.getArtcle_title());
		article.setArtcle_type(articleModal.getArtcle_type());
		article.setArtcle_brf_desc(articleModal.getArtcle_brf_desc());
		article.setArtcl_tags(artcl_tags);
		article.setArtcle_filePath(artcl_filePath + "/" + artcl_fileName);
		article.setArtcl_cat_id("artcl_cat_id_test"+new Random().nextInt());
		
		if (articleDao.publishArticle(article) > 0) {
			commonUtil.createDataFile(artcl_id, artcl_id, articleModal.getArtcle_Data(), artcl_filePath, artcl_fileName);
			return new ModelAndView("redirect:index");
		} else {
			return new ModelAndView("articleNotFound");
		}

	}


}
