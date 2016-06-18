
<!DOCTYPE html>
<html data-clipboard-buttons="" data-code-prettify=""
	data-code-sidebar="" data-hide-show-guide="" data-sts-import=""
	data-mobile-support="" data-search="">
<head>
<title>Tutorial · React.js and Spring Data REST</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no"
	id="Viewport" name="viewport" />
<link rel="shortcut icon" type="image/x-icon"
	href="/img/favicon-ca31b78daf0dd9a106bbf3c6d87d4ec7.png" />
<link
	href="https://fonts.googleapis.com/css?family=Varela+Round|Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="/css/main-d6b3e3989fb7ce5ccf3f17374571f687.css" />
<script>
	var baseUrl = '/';
</script>
<script async=""
	src="/lib/curl/src/curl-af0e5211f469b994b367d180c29b7ae3.js"
	data-curl-run="/run-294fd5dfc2be5d3d97a0928eb436c28c.js"></script>
<meta content="7qGntFPD9lWAVCtUu5U77v4l68PsTHf6xpzgjQv2j2M"
	name="google-site-verification" />
<script>
	//
	var _gaq = _gaq || [];
	var pluginUrl = '//www.google-analytics.com/plugins/ga/inpage_linkid.js';
	_gaq.push([ '_require', 'inpage_linkid', pluginUrl ], [ '_setAccount',
			'UA-2728886-20' ], [ '_trackPageview' ], [ 'b._require',
			'inpage_linkid', pluginUrl ], [ 'b._setAccount', 'UA-2728886-19' ],
			[ 'b._trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
<link rel="stylesheet" type="text/css"
	href="/css/gsguide-d82195d19c5a1551f6453c7ad9519dfc.css" />

<meta property="og:title" content="React.js and Spring Data REST" />
<meta property="og:image"
	content="/img/spring-by-pivotal-9066b55828deb3c10e27e609af322c40.png" />
<meta property="og:description"
	content="this tutorial is designed to be completed in 2-3 hours, it provides deeper, in-context explorations of enterprise application development topics, leaving you ready to implement real-world solutions." />
</head>
<body>
	<script type="text/javascript">
		// Work around Google font rendering issues in webkit browsers on Windows 7
		if (navigator.userAgent.indexOf("NT 6.1") != -1) {
			document.body.style.WebkitTextStroke = "0.5px";
		}
	</script>
	<div class="viewport">
		<header class="navbar header--navbar desktop-only">
			<div class="navbar-inner">
				<div class="container-fluid">
					<div class="spring-logo--container">
						<a class="spring-logo" href="/"><span></span></a>
					</div>
					<ul class="nav pull-right">
						<li class="navbar-link"><a href="/docs">Docs</a></li>
						<li class="navbar-link active"><a href="/guides">Guides</a></li>
						<li class="navbar-link"><a href="/projects">Projects</a></li>
						<li class="navbar-link"><a href="/blog">Blog</a></li>
						<li class="navbar-link"><a href="/questions">Questions</a></li>
						<li class="navbar-link nav-search"><i
							class="icon-search navbar-search--icon js-search-input-open"></i>
							<div class="search-input-close js-search-input-close">x</div></li>
					</ul>
				</div>
			</div>
			<div class="search-dropdown--container js-search-dropdown">
				<div class="container-fluid">
					<div class="search-form--container">
						<form action="/search" class="form-inline form-search"
							method="get">
							<input class="search-query search-form--form js-search-input"
								name="q"
								placeholder="Search for documentation, guides, and posts..."
								type="text" value="" />
							<button class="search-form--submit" type="submit">
								<i class="icon-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</header>
		<div>
			<div class="mobile-navigation--wrapper mobile-only">
				<div class="navigation-drawer--container">
					<div class="mobile-search--container">
						<form action="/search" class="form-inline form-search"
							method="get">
							<button class="search-form--submit" type="submit">
								<i class="icon-search"></i>
							</button>
							<input class="search-query search-form--form js-search-input"
								name="q" placeholder="Search..." type="text" value="" />
						</form>
					</div>
					<div class="navigation-item-list">
						<div class="navbar-link">
							<a href="/"> Home <i class="icon-chevron-right pull-right"></i>
							</a>
						</div>
						<div class="navbar-link active">
							<a href="/guides"> Guides <i
								class="icon-chevron-right pull-right"></i>
							</a>
						</div>
						<div class="navbar-link">
							<a href="/projects"> Projects <i
								class="icon-chevron-right pull-right"></i>
							</a>
						</div>
						<div class="navbar-link">
							<a href="/blog"> Blog <i
								class="icon-chevron-right pull-right"></i>
							</a>
						</div>
						<div class="navbar-link">
							<a href="/questions"> Questions <i
								class="icon-chevron-right pull-right"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="mobile-nav">
					<div class="nav-icon js-open-nav-drawer">
						<i class="icon-reorder"></i>
					</div>
					<div class="header-center-icon">
						<a href="/">
							<div class="icon icon-spring-logo-mobile"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="header--container"></div>
		<div class="container-fluid"></div>
		<div></div>
		<div class="container-fluid">
			<main class="main-body--wrapper">
			<div class="row-fluid">
				<div class="span8 mobile-left-pane">
					<div class="content--title desktop-only">Tutorial</div>
					<article class="content--container">
						<h1 class="title">React.js and Spring Data REST</h1>
						<div class="article-body">
							<div id="preamble">
								<div class="sectionbody">
									<div class="paragraph">
										<p>This tutorial shows a collection of apps that use
											Spring Data REST and its powerful backend functionality
											combined with React’s sophisticated features to build an
											easy-to-grok UI.</p>
									</div>
									<div class="ulist">
										<ul>
											<li>
												<p>
													<a href="https://www.youtube.com/watch?v=TgCr7v9tdKM">Spring
														Data REST</a> provides a fast way to build hypermedia-powered
													repositories.
												</p>
											</li>
											<li>
												<p>
													<a href="http://facebook.github.io/react/index.html">React</a>
													is Facebook’s solution to efficient, fast, and easy-to-use
													views in the land of JavaScript.
												</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="sect1">
								<h2 id="react-and-spring-data-rest-part-1">Part 1 - Basic
									Features</h2>
								<div class="sectionbody">
									<div class="paragraph">
										<p>Welcome Spring community,</p>
									</div>
									<div class="paragraph">
										<p>In this section, you will see how to get a bare-bones
											Spring Data REST application up and running quickly. Then you
											will build a simple UI on top of it using Facebook’s React.js
											toolset.</p>
									</div>
									<div class="sect2">
										<h3 id="_step_0_setting_up_your_environment">Step 0 -
											Setting up your environment</h3>
										<div class="paragraph">
											<p>
												Feel free to <a
													href="https://github.com/spring-guides/tut-react-and-spring-data-rest/tree/master/basic">grab
													the code</a> from this repository and follow along.
											</p>
										</div>
										<div class="paragraph">
											<p>
												If you want to do it yourself, visit <a
													href="http://start.spring.io" class="bare">http://start.spring.io</a>
												and pick these items:
											</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>Rest Repositories</p>
												</li>
												<li>
													<p>Thymeleaf</p>
												</li>
												<li>
													<p>JPA</p>
												</li>
												<li>
													<p>H2</p>
												</li>
												<li>
													<p>Lombok (May want to ensure your IDE has support for
														this as well.)</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												This demo uses Java 8, Maven Project, and the latest stable
												release of Spring Boot. It also uses React.js coded in <a
													href="http://es6-features.org/">ES6</a>. This will give you
												a clean, empty project. From there, you can add the various
												files shown explicitly in this section, and/or borrow from
												the repository listed above.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_in_the_beginning">In the beginning…​</h3>
										<div class="paragraph">
											<p>In the beginning there was data. And it was good. But
												then people wanted to access the data through various means.
												Over the years, people cobbled together lots of MVC
												controllers, many using Spring’s powerful REST support. But
												doing over and over cost a lot of time.</p>
										</div>
										<div class="paragraph">
											<p>Spring Data REST addresses how simple this problem can
												be if some assumptions are made:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>The developer uses a Spring Data project that
														supports the repository model.</p>
												</li>
												<li>
													<p>The system uses well accepted, industry standard
														protocols, like HTTP verbs, standardized media types, and
														IANA-approved link names.</p>
												</li>
											</ul>
										</div>
										<div class="sect3">
											<h4 id="_declaring_your_domain">Declaring your domain</h4>
											<div class="paragraph">
												<p>The cornerstone of any Spring Data REST-based
													application are the domain objects. For this section, you
													will build an application to track the employees for a
													company. Kick that off by creating a data type like this:</p>
											</div>
											<div class="listingblock">
												<div class="title">
													src/main/java/com/greglturnquist/payroll/Employee.java</div>
												<div class="content">
													<pre class="prettyprint highlight">
														<code class="language-java" data-lang="java">@Data
@Entity
public class Employee {

	private @Id @GeneratedValue Long id;
	private String firstName;
	private String lastName;
	private String description;

	private Employee() {}

	public Employee(String firstName, String lastName, String description) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.description = description;
	}
}</code>
													</pre>
												</div>
											</div>
											<div class="ulist">
												<ul>
													<li>
														<p>
															<code>@Entity</code>
															is a JPA annotation that denotes the whole class for
															storage in a relational table.
														</p>
													</li>
													<li>
														<p>
															<code>@Id</code>
															and
															<code>@GeneratedValue</code>
															are JPA annotations to note the primary key and that is
															generated automatically when needed.
														</p>
													</li>
													<li>
														<p>
															<code>@Data</code>
															is a Project Lombok annotation to autogenerate getters,
															setters, constructors, toString, hash, equals, and other
															things. It cuts down on the boilerplate.
														</p>
													</li>
												</ul>
											</div>
											<div class="paragraph">
												<p>This entity is used to track employee information. In
													this case, their name and job description.</p>
											</div>
											<div class="admonitionblock note">
												<table>
													<tbody>
														<tr>
															<td class="icon"><i class="fa icon-note"
																title="Note"></i></td>
															<td class="content">Spring Data REST isn’t confined
																to JPA. It supports many NoSQL data stores, but you
																won’t be covering those here.</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_defining_the_repository">Defining the repository</h3>
										<div class="paragraph">
											<p>Another key piece of a Spring Data REST application is
												to create a corresponding repository definition.</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/java/com/greglturnquist/payroll/EmployeeRepository.java
											</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">public interface EmployeeRepository extends CrudRepository&lt;Employee, Long&gt; {

}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														The repository extends Spring Data Commons'
														<code>CrudRepository</code>
														and plugs in the type of the domain object and its primary
														key
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												That is all that is needed! In fact, you don’t even have to
												annotate this if it’s top-level and visible. If you use your
												IDE and open up
												<code>CrudRepository</code>
												, you’ll find a fist full of pre-built methods already
												defined.
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">You can define <a
															href="http://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.definition">your
																own repository</a> if you wish. Spring Data REST supports
															that as well.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_pre_loading_the_demo">Pre-loading the demo</h3>
										<div class="paragraph">
											<p>To work with this application, you need to pre-load it
												with some data like this:</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/java/com/greglturnquist/payroll/DatabaseLoader.java
											</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Component
public class DatabaseLoader implements CommandLineRunner {

	private final EmployeeRepository repository;

	@Autowired
	public DatabaseLoader(EmployeeRepository repository) {
		this.repository = repository;
	}

	@Override
	public void run(String... strings) throws Exception {
		this.repository.save(new Employee("Frodo", "Baggins", "ring bearer"));
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														This class is marked with Spring’s
														<code>@Component</code>
														annotation so that it is automatically picked up by
														<code>@SpringBootApplication</code>
														.
													</p>
												</li>
												<li>
													<p>
														It implements Spring Boot’s
														<code>CommandLineRunner</code>
														so that it gets run after all the beans are created and
														registered.
													</p>
												</li>
												<li>
													<p>
														It uses constructor injection and autowiring to get Spring
														Data’s automatically created
														<code>EmployeeRepository</code>
														.
													</p>
												</li>
												<li>
													<p>
														The
														<code>run()</code>
														method is invoked with command line arguments, loading up
														your data.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												One of the biggest, most powerful features of Spring Data is
												its ability to write JPA queries for you. This not only cuts
												down on your development time, but also reduces the risk of
												bugs and errors. Spring Data <a
													href="http://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.query-methods.details">looks
													at the name of methods</a> in a repository class and figures
												out the operation you need including saving, deleting, and
												finding.
											</p>
										</div>
										<div class="paragraph">
											<p>That is how we can write an empty interface and
												inherit already built save, find, and delete operations.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_adjusting_the_root_uri">Adjusting the root URI</h3>
										<div class="paragraph">
											<p>
												By default, Spring Data REST hosts a root collection of
												links at
												<code>/</code>
												. Because you will host a web UI on the same path, you need
												to change the root URI.
											</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/resources/application.properties</div>
											<div class="content">
												<pre>spring.data.rest.base-path=/api</pre>
											</div>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_launching_the_backend">Launching the backend</h3>
										<div class="paragraph">
											<p>
												The last step needed to get a fully operational REST API off
												the ground is to write a
												<code>public static void main</code>
												using Spring Boot:
											</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/java/com/greglturnquist/payroll/ReactAndSpringDataRestApplication.java
											</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@SpringBootApplication
public class ReactAndSpringDataRestApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReactAndSpringDataRestApplication.class, args);
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Assuming the previous class as well as your Maven build file
												were generated from <a href="http://start.spring.io"
													class="bare">http://start.spring.io</a>, you can now launch
												it either by running that
												<code>main()</code>
												method inside your IDE, or type
												<code>./mvnw spring-boot:run</code>
												on the command line. (mvnw.bat for Windows users).
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">If you aren’t up-to-date on
															Spring Boot and how it works, you should consider watch
															one of <a
															href="https://www.youtube.com/watch?v=sbPSjI4tt10">Josh
																Long’s introductory presentations</a>. Did it? Press on!
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_touring_your_rest_service">Touring your REST
											service</h3>
										<div class="paragraph">
											<p>
												With the app running, you can check things out on the
												command line using <a href="http://curl.haxx.se/">cURL</a>
												(or any other tool you like).
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl localhost:8080/api
{
  "_links" : {
    "employees" : {
      "href" : "http://localhost:8080/api/employees"
    },
    "profile" : {
      "href" : "http://localhost:8080/api/profile"
    }
  }
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												When you ping the root node, you get back a collection of
												links wrapped up in a <a
													href="http://stateless.co/hal_specification.html">HAL-formatted
													JSON document</a>.
											</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<strong>_links</strong> is a the collection of links
														available.
													</p>
												</li>
												<li>
													<p>
														<strong>employees</strong> points to an aggregate root for
														the employee objects defined by the
														<code>EmployeeRepository</code>
														interface.
													</p>
												</li>
												<li>
													<p>
														<strong>profile</strong> is an IANA-standard relation and
														points to discoverable metadata about the entire service.
														We’ll explore this in a later section.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												You can further dig into this service by navigating the <strong>employees</strong>
												link.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl localhost:8080/api/employees
{
  "_embedded" : {
    "employees" : [ {
      "firstName" : "Frodo",
      "lastName" : "Baggins",
      "description" : "ring bearer",
      "_links" : {
        "self" : {
          "href" : "http://localhost:8080/api/employees/1"
        }
      }
    } ]
  }
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>At this stage, you are viewing the entire collection
												of employees.</p>
										</div>
										<div class="paragraph">
											<p>
												What’s included along with the data you pre-loaded earlier
												is a <strong>_links</strong> attribute with a <strong>self</strong>
												link. This is the canonical link for that particular
												employee. What is canonical? It means free of context. For
												example, the same user could be fetched through a link like
												/api/orders/1/processor, in which the employee is assocated
												with processing a particular order. Here, there is no
												relationship to other entities.
											</p>
										</div>
										<div class="admonitionblock important">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-important"
															title="Important"></i></td>
														<td class="content">Links are a critical facet of
															REST. They provide the power to navigate to related
															items. It makes it possible for other parties to navigate
															around your API without having to rewrite things
															everytime there is a change. Updates in the client is a
															common problem when the clients hard code paths to
															resources. Restructuring resources can cause big
															upheavals in code. If links are used and instead the
															navigation route is maintained, then it becomes easy and
															flexible to make such adjustments.</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>You can decide to view that one employee if you wish.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl localhost:8080/api/employees/1
{
  "firstName" : "Frodo",
  "lastName" : "Baggins",
  "description" : "ring bearer",
  "_links" : {
    "self" : {
      "href" : "http://localhost:8080/api/employees/1"
    }
  }
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Little change here, except that there is no need for the <strong>_embedded</strong>
												wrapper since there is only domain object.
											</p>
										</div>
										<div class="paragraph">
											<p>That’s all and good, but you are probably itching to
												create some new entries.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl -X POST localhost:8080/api/employees -d '{"firstName": "Bilbo", "lastName": "Baggins", "description": "burglar"}' -H 'Content-Type:application/json'
{
  "firstName" : "Bilbo",
  "lastName" : "Baggins",
  "description" : "burglar",
  "_links" : {
    "self" : {
      "href" : "http://localhost:8080/api/employees/2"
    }
  }
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												You can also PUT, PATCH, and DELETE as shown in <a
													href="https://spring.io/guides/gs/accessing-data-rest/">this
													related guide</a>. But let’s not dig into that. You have
												already spent way too much time interacting with this REST
												service manually. Don’t you want to build a slick UI
												instead?
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_setting_up_a_custom_ui_controller">Setting up a
											custom UI controller</h3>
										<div class="paragraph">
											<p>Spring Boot makes it super simple to stand up a custom
												web page. First, you need a Spring MVC controller.</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/java/com/greglturnquist/payroll/HomeController.java
											</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Controller
public class HomeController {

	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}

}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>@Controller</code>
														marks this class as a Spring MVC controller.
													</p>
												</li>
												<li>
													<p>
														<code>@RequestMapping</code>
														flags the
														<code>index()</code>
														method to support the
														<code>/</code>
														route.
													</p>
												</li>
												<li>
													<p>
														It returns
														<code>index</code>
														as the name of the template, which Spring Boot’s
														autoconfigured view resolver will map to
														<code>src/main/resources/templates/index.html</code>
														.
													</p>
												</li>
											</ul>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_defining_an_html_template">Defining an HTML
											template</h3>
										<div class="paragraph">
											<p>You are using Thymeleaf, although you won’t really use
												many of its features.</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/resources/templates/index.html</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-html" data-lang="html">&lt;!DOCTYPE html&gt;
&lt;html xmlns:th="http://www.thymeleaf.org"&gt;
&lt;head lang="en"&gt;
    &lt;meta charset="UTF-8"/&gt;
    &lt;title&gt;ReactJS + Spring Data REST&lt;/title&gt;
    &lt;link rel="stylesheet" href="/main.css" /&gt;
&lt;/head&gt;
&lt;body&gt;

    &lt;div id="react"&gt;&lt;/div&gt;

    &lt;script src="built/bundle.js"&gt;&lt;/script&gt;

&lt;/body&gt;
&lt;/html&gt;</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												The key part in this template is the
												<code>&lt;div id="react"&gt;&lt;/div&gt;</code>
												component in the middle. It is where you will direct React
												to plug in the rendered output.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_loading_javascript_modules">Loading JavaScript
											modules</h3>
										<div class="paragraph">
											<p>
												This tutorial won’t go into extensive detail on how it uses
												<a href="https://webpack.github.io/">webpack</a> to load
												JavaScript modules. But thanks to the <strong>frontend-maven-plugin</strong>,
												you don’t <em>have</em> to install any of the node.js tools
												to build and run the code.
											</p>
										</div>
										<div class="paragraph">
											<p>The following JavaScript modules will be used:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>webpack</p>
												</li>
												<li>
													<p>babel</p>
												</li>
												<li>
													<p>react.js</p>
												</li>
												<li>
													<p>rest.js</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>With the power of babel, the JavaScript is written in
												ES6.</p>
										</div>
										<div class="paragraph">
											<p>
												If you’re interested, the paths for the JavaScript moodules
												are defined in <a
													href="https://github.com/spring-guides/tut-react-and-spring-data-rest/blob/master/basic/src/main/resources/static/webpack.config.js">webpack.config.js</a>.
												This is then used by webpack to generate a JavaScript
												bundle, which is loaded inside the template.
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">Want to see your JavaScript
															changes automatically? Move into the <code>src/main/resource/static</code>,
															and run <code>npm run-script watch</code> to put webpack
															into watch mode. It will regenerate bundle.js as you edit
															the source. Assuming you’ve <a
															href="http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#howto-hotswapping">setup
																your IDE properly</a>, <strong>spring-boot-devtools</strong>
															combined with this should speed up changes.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>With all that in place, you can focus on the React
												bits which are fetched after the DOM is loaded. It’s broken
												down into parts as below:</p>
										</div>
										<div class="paragraph">
											<p>Since you are using webpack to assemble things, go
												ahead and fetch the modules you need:</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">const React = require('react');
const client = require('./client');</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>React</code>
														is the main library from Facebook for building this app.
													</p>
												</li>
												<li>
													<p>
														<code>client</code>
														is custom code that configures rest.js to include support
														for HAL, URI Templates, and other things. It also sets the
														default <strong>Accept</strong> request header to <strong>application/hal+json</strong>.
														You can <a
															href="https://github.com/spring-guides/tut-react-and-spring-data-rest/blob/master/basic/src/main/resources/static/client.js">read
															the code here</a>.
													</p>
												</li>
											</ul>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_diving_into_react">Diving into React</h3>
										<div class="paragraph">
											<p>React is based on defining components. Oftentimes, one
												component can hold multiple instances of another in a
												parent-child relationship. It’s easy for this concept to
												extend several layers.</p>
										</div>
										<div class="paragraph">
											<p>To start things off, it’s very handy to have a top
												level container for all components. (This will become more
												evident as you expand upon the code throughout this series.)
												Right now, you only have the employee list. But you might
												need some other related components later on, so let’s start
												with this:</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												App component</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class App extends React.Component {

	constructor(props) {
		super(props);
		this.state = {employees: []};
	}

	componentDidMount() {
		client({method: 'GET', path: '/api/employees'}).done(response =&gt; {
			this.setState({employees: response.entity._embedded.employees});
		});
	}

	render() {
		return (
			&lt;EmployeeList employees={this.state.employees}/&gt;
		)
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>class Foo extends React.Component{…​}</code>
														is the method to create a React component.
													</p>
												</li>
												<li>
													<p>
														<code>componentDidMount</code>
														is the API invoked after React renders a component in the
														DOM.
													</p>
												</li>
												<li>
													<p>
														<code>render</code>
														is the API to "draw" the component on the screen.
													</p>
												</li>
											</ul>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">In React, uppercase is the
															convention for naming components.</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>
												In the <strong>App</strong> component, an array of employees
												is fetched from the Spring Data REST backend and stored in
												this component’s <strong>state</strong> data.
											</p>
										</div>
										<div id="NOTE" class="exampleblock">
											<div class="content">
												<div class="paragraph">
													<p>
														React components have two types of data: <strong>state</strong>
														and <strong>properties</strong>.
													</p>
												</div>
												<div class="paragraph">
													<p>
														<strong>State</strong> is data that the component is
														expected to handle itself. It is also data that can
														fluctuate and change. To read the state, you use
														<code>this.state</code>
														. To update it, you use
														<code>this.setState()</code>
														. Every time
														<code>this.setState()</code>
														is called, React updates the state, calculates a diff
														between the previous state and the new state, and injects
														a set of changes to the DOM on the page. This results a
														fast and efficient updates to your UI.
													</p>
												</div>
												<div class="paragraph">
													<p>
														The common convention is to initialize state with all your
														attributes empty in the constructor. Then you lookup data
														from the server using
														<code>componentDidMount</code>
														and populate your attributes. From there on, updates can
														be driven by user action or other events.
													</p>
												</div>
												<div class="paragraph">
													<p>
														<strong>Properties</strong> encompass data that is passed
														into the component. Properties do NOT change but are
														instead fixed values. To set them, you assign them to
														attributes when creating a new component and you’ll soon
														see.
													</p>
												</div>
												<div class="admonitionblock warning">
													<table>
														<tbody>
															<tr>
																<td class="icon"><i class="fa icon-warning"
																	title="Warning"></i></td>
																<td class="content">JavaScript doesn’t lock down
																	data structures like other languages. You can try to
																	subvert properties by assigning values, but this
																	doesn’t work with React’s differential engine and
																	should be avoided.</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="paragraph">
											<p>
												In this code, the function loads data via
												<code>client</code>
												, a <a href="https://promisesaplus.com/">Promise
													compliant</a> instance of rest.js. When it is done retrieving
												from
												<code>/api/employees</code>
												, it then invokes the function inside
												<code>done()</code>
												and set’s the state based on it’s HAL document (
												<code>response.entity._embedded.employees</code>
												). You might remember the structure of
												<code>curl /api/employees</code>
												<a href="#_touring_your_rest_service">earlier</a> and see
												how it maps onto this structure.
											</p>
										</div>
										<div class="paragraph">
											<p>
												When the state is updated, the
												<code>render()</code>
												function is invoked by the framework. The employee state
												data is included in creation of the
												<code>&lt;EmployeeList /&gt;</code>
												React component as an input parameter.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Below is the definition for an
												<code>EmployeeList</code>
												.
											</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												EmployeeList component</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class EmployeeList extends React.Component{
	render() {
		var employees = this.props.employees.map(employee =&gt;
			&lt;Employee key={employee._links.self.href} employee={employee}/&gt;
		);
		return (
			&lt;table&gt;
				&lt;tr&gt;
					&lt;th&gt;First Name&lt;/th&gt;
					&lt;th&gt;Last Name&lt;/th&gt;
					&lt;th&gt;Description&lt;/th&gt;
				&lt;/tr&gt;
				{employees}
			&lt;/table&gt;
		)
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Using JavaScript’s map function,
												<code>this.props.employees</code>
												is transformed from an array of employee records into an
												array of
												<code>&lt;Element /&gt;</code>
												React components (which you’ll see a little further down).
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">&lt;Employee key={employee._links.self.href} data={employee} /&gt;</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This shows a new React component (note the uppercase format)
												being created along with two properties: <strong>key</strong>
												and <strong>data</strong>. These are supplied the values
												from
												<code>employee._links.self.href</code>
												and
												<code>employee</code>
												.
											</p>
										</div>
										<div class="admonitionblock important">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-important"
															title="Important"></i></td>
														<td class="content">Whenever you work with Spring
															Data REST, the <strong>self</strong> link IS the key for
															a given resource. React needs a unique identifer for
															child nodes, and <code>_links.self.href</code> is
															perfect.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>
												Finally, you return an HTML table wrapped around the array
												of
												<code>employees</code>
												built with mapping.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-html" data-lang="html">&lt;table&gt;
    &lt;tr&gt;
        &lt;th&gt;First Name&lt;/th&gt;
        &lt;th&gt;Last Name&lt;/th&gt;
        &lt;th&gt;Description&lt;/th&gt;
    &lt;/tr&gt;
    {employees}
&lt;/table&gt;</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>This simple layout of state, properties, and HTML
												shows how React lets you declaritively create a simple and
												easy-to-understand component.</p>
										</div>
										<div id="NOTE" class="exampleblock">
											<div class="content">
												<div class="paragraph">
													<p>
														Does this code contain both HTML <em>and</em> JavaScript?
														Yes, this is <a href="https://facebook.github.io/js/">JSX</a>.
														There is no requirement to use it. React can be written
														using pure JavaScript, but the JSX syntax is quite terse.
														Thanks to rapid work on the Babel.js, the transpiler
														provides both JSX and ES6 support all at once
													</p>
												</div>
												<div class="paragraph">
													<p>
														JSX also includes bits and pieces of <a
															href="http://es6-features.org/#Constants">ES6</a>. The
														one used in the code is the <a
															href="http://es6-features.org/#ExpressionBodies">arrow
															function</a>. It avoids creating a nested function() with its
														own scoped <strong>this</strong>, and avoids needing a <a
															href="http://stackoverflow.com/a/962040/28214"><strong>self</strong>
															variable</a>.
													</p>
												</div>
												<div class="paragraph">
													<p>Worried about mixing logic with your structure?
														React’s APIs encourage nice, declarative structure
														combined with state and properties. Instead of mixing a
														bunch of unrelated JavaScript and HTML, React encourages
														building simple components with small bits of related
														state and properties that work well together. It lets you
														look at a single component and understand the design. Then
														they are easy to combine together for bigger structures.</p>
												</div>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Next, you need to actually define what an
												<code>&lt;Employee /&gt;</code>
												is.
											</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												Employee component</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class Employee extends React.Component{
	render() {
		return (
			&lt;tr&gt;
				&lt;td&gt;{this.props.employee.firstName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.lastName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.description}&lt;/td&gt;
			&lt;/tr&gt;
		)
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This component is very simple. It has a single HTML table
												row wrapped around the employee’s three properties. The
												property itself is
												<code>this.props.employee</code>
												. Notice how passing in a JavaScript object makes it easy to
												pass along data fetched from the server?
											</p>
										</div>
										<div class="paragraph">
											<p>
												Because this component doesn’t manage any state nor does it
												deal with user input, there is nothing else to do. This
												might tempt you to cram it into the
												<code>&lt;EmployeeList /&gt;</code>
												up above. Don’t do it! Instead, splitting your app up into
												small components that each do one job will make it easier to
												build up functionality in the future.
											</p>
										</div>
										<div class="paragraph">
											<p>The last step is to render the whole thing.</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												rendering code</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">React.render(
	&lt;App /&gt;,
	document.getElementById('react')
)</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												<code>React.render()</code>
												accepts two arguments: a React component you defined as well
												as a DOM node to inject it into. Remember how you saw the
												<code>&lt;div id="react"&gt;&lt;/div&gt;</code>
												item earlier from the HTML page? This is where it gets
												picked up and plugged in.
											</p>
										</div>
										<div class="paragraph">
											<p>
												With all this in place, re-run the application (
												<code>./mvnw spring-boot:run</code>
												) and visit <a href="http://localhost:8080" class="bare">http://localhost:8080</a>.
											</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/basic/images/basic-1.png"
													alt="basic 1">
											</div>
										</div>
										<div class="paragraph">
											<p>You can see the initial employee loaded up by the
												system.</p>
										</div>
										<div class="paragraph">
											<p>Remember using cURL to create new entries? Do that
												again.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>curl -X POST localhost:8080/api/employees -d '{"firstName": "Bilbo", "lastName": "Baggins", "description": "burglar"}' -H 'Content-Type:application/json'</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>Refresh the browser, and you should see the new entry:</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/basic/images/basic-2.png"
													alt="basic 2">
											</div>
										</div>
										<div class="paragraph">
											<p>And now you can see both of them listed on the web
												site.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_review">Review</h3>
										<div class="paragraph">
											<p>In this section:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>You defined a domain object and a corresponding
														repository.</p>
												</li>
												<li>
													<p>You let Spring Data REST export it with full blown
														hypermedia controls.</p>
												</li>
												<li>
													<p>You created two simple React components in a
														parent-child relationship.</p>
												</li>
												<li>
													<p>You fetched server data and rendered them in as a
														simple, static HTML structure.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>Issues?</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>The web page wasn’t dynamic. You had to refresh the
														browser to fetch new records.</p>
												</li>
												<li>
													<p>
														The web page didn’t use any hypermedia controls or
														metadata. Instead, it was hardcoded to fetch data from
														<code>/api/employees</code>
														.
													</p>
												</li>
												<li>
													<p>It’s read only. While you can alter records using
														cURL, the web page offers none of that.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>These are things we can address in the next section.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="sect1">
								<h2 id="react-and-spring-data-rest-part-2">Part 2 -
									Hypermedia Controls</h2>
								<div class="sectionbody">
									<div class="paragraph">
										<p>
											In the <a href="#react-and-spring-data-rest-part-1">previous
												section</a>, you found out how to stand up a backend payroll
											service to store employee data using Spring Data REST. A key
											feature it lacked was using the hypermedia controls and
											navigation by links. Instead, it hard coded the path to find
											data.
										</p>
									</div>
									<div class="paragraph">
										<p>
											Feel free to <a
												href="https://github.com/spring-guides/tut-react-and-spring-data-rest/tree/master/hypermedia">grab
												the code</a> from this repository and follow along. This section
											is based on the previous section’s app with extra things
											added.
										</p>
									</div>
									<div class="sect2">
										<h3
											id="_in_the_beginning_there_was_data_and_then_there_was_rest">In
											the beginning there was data…​and then there was REST</h3>
										<div class="quoteblock">
											<blockquote>I am getting frustrated by the
												number of people calling any HTTP-based interface a REST
												API. Today’s example is the SocialSite REST API. That is
												RPC. It screams RPC…​.What needs to be done to make the REST
												architectural style clear on the notion that hypertext is a
												constraint? In other words, if the engine of application
												state (and hence the API) is not being driven by hypertext,
												then it cannot be RESTful and cannot be a REST API. Period.
												Is there some broken manual somewhere that needs to be
												fixed?</blockquote>
											<div class="attribution">
												— Roy T. Fielding <br> <cite>http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven</cite>
											</div>
										</div>
										<div class="paragraph">
											<p>So, what exactly ARE hypermedia controls, i.e.
												hypertext, and how can you use them? To find out, let’s take
												a step back and look at the core mission of REST.</p>
										</div>
										<div class="paragraph">
											<p>The concept of REST was to borrow ideas that made the
												web so successful and apply them to APIs. Despite the web’s
												vast size, dynamic nature, and low rate that clients, i.e.
												browsers, are updated, the web is an amazing success. Roy
												Fielding sought to use some of its constraints and features
												and see if that would afford similar expansion of API
												production and consumption.</p>
										</div>
										<div class="paragraph">
											<p>One of the constraints is to limit the number of
												verbs. For REST, the primary ones are GET, POST, PUT,
												DELETE, and PATCH. There are others, but we won’t get into
												them here.</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>GET - fetch the state of a resource without altering
														the system</p>
												</li>
												<li>
													<p>POST - create a new resource without saying where</p>
												</li>
												<li>
													<p>PUT - replace an existing resource, overwriting
														whatever else is already there (if anything)</p>
												</li>
												<li>
													<p>DELETE - remove an existing resource</p>
												</li>
												<li>
													<p>PATCH - alter an existing resource partially</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>These are standardized HTTP verbs with well written
												specs. By picking up and using already coined HTTP
												operations, we don’t have to invent a new language and
												educate the industry.</p>
										</div>
										<div class="paragraph">
											<p>Another constraint of REST is to use media types to
												define the format of data. Instead of everyone writing their
												own dialect for the exchange of information, it would be
												prudent to develop some media types. One of the most popular
												ones to be accepted is HAL, media type application/hal+json.
												It is Spring Data REST’s default media type. A keen value is
												that there is no centralized, single media type for REST.
												Instead, people can develop media types and plug them in.
												Try them out. As different needs become available, the
												industry can flexibly move.</p>
										</div>
										<div class="paragraph">
											<p>A key feature of REST is to include links to relevant
												resources. For example, if you were looking at an order, a
												RESTful API would include a link to the related customer,
												links to the catalog of items, and perhaps a link to the
												store from which the order was placed. In this section, you
												will introduce paging, and see how to also use navigational
												paging links.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_turning_on_paging_from_the_backend">Turning on
											paging from the backend</h3>
										<div class="paragraph">
											<p>To get underway with using frontend hypermedia
												controls, you need to turn on some extra controls. Spring
												Data REST provides paging support. To use it, just tweak the
												repository definition:</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/java/com/greglturnquist/payroll/EmployeeRepository.java
											</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">public interface EmployeeRepository extends PagingAndSortingRepository&lt;Employee, Long&gt; {

}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Your interface now extends
												<code>PagingAndSortingRepository</code>
												which adds extra options to set page size, and also adds
												navigational links to hop from page to page. The rest of the
												backend is the same (exception for some <a
													href="https://github.com/spring-guides/tut-react-and-spring-data-rest/blob/master/hypermedia/src/main/java/com/greglturnquist/payroll/DatabaseLoader.java">extra
													pre-loaded data</a> to make things interesting).
											</p>
										</div>
										<div class="paragraph">
											<p>
												Restart the application (
												<code>./mvnw spring-boot:run</code>
												) and see how it works.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl localhost:8080/api/employees?size=2
{
  "_links" : {
    "first" : {
      "href" : "http://localhost:8080/api/employees?page=0&amp;size=2"
    },
    "self" : {
      "href" : "http://localhost:8080/api/employees"
    },
    "next" : {
      "href" : "http://localhost:8080/api/employees?page=1&amp;size=2"
    },
    "last" : {
      "href" : "http://localhost:8080/api/employees?page=2&amp;size=2"
    }
  },
  "_embedded" : {
    "employees" : [ {
      "firstName" : "Frodo",
      "lastName" : "Baggins",
      "description" : "ring bearer",
      "_links" : {
        "self" : {
          "href" : "http://localhost:8080/api/employees/1"
        }
      }
    }, {
      "firstName" : "Bilbo",
      "lastName" : "Baggins",
      "description" : "burglar",
      "_links" : {
        "self" : {
          "href" : "http://localhost:8080/api/employees/2"
        }
      }
    } ]
  },
  "page" : {
    "size" : 2,
    "totalElements" : 6,
    "totalPages" : 3,
    "number" : 0
  }
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												The default page size is 20, so to see it in action,
												<code>?size=2</code>
												applied. As expected, only two employees are listed. In
												addition, there is also a <strong>first</strong>, <strong>next</strong>,
												and <strong>last</strong> link. There is also the <strong>self</strong>
												link, free of context <em>including page parameters</em>.
											</p>
										</div>
										<div class="paragraph">
											<p>
												If you navigate to the <strong>next</strong> link, you’ll
												then see a <strong>prev</strong> link as well:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl "http://localhost:8080/api/employees?page=1&amp;size=2"
{
  "_links" : {
    "first" : {
      "href" : "http://localhost:8080/api/employees?page=0&amp;size=2"
    },
    "prev" : {
      "href" : "http://localhost:8080/api/employees?page=0&amp;size=2"
    },
    "self" : {
      "href" : "http://localhost:8080/api/employees"
    },
    "next" : {
      "href" : "http://localhost:8080/api/employees?page=2&amp;size=2"
    },
    "last" : {
      "href" : "http://localhost:8080/api/employees?page=2&amp;size=2"
    }
  },
...</pre>
											</div>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">When using "&amp;" in URL query
															parameters, the command line thinks it’s a line break.
															Wrap the whole URL with quotation marks to bypass that.</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>That looks neat, but it will be even better when you
												update the frontend to take advantage of that.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_navigating_by_relationship">Navigating by
											relationship</h3>
										<div class="paragraph">
											<p>That’s it! No more changes are needed on the backend
												to start using the hypermedia controls Spring Data REST
												provides out of the box. You can switch to working on the
												frontend. (That’s part of the beauty of Spring Data REST. No
												messy controller updates!)</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">It’s important to point out, this
															application isn’t "Spring Data REST-specific." Instead,
															it uses <a
															href="http://stateless.co/hal_specification.html">HAL</a>,
															<a href="https://tools.ietf.org/html/rfc6570">URI
																Templates</a>, and other standards. That’s how using rest.js
															is a snap: that library comes with HAL support.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>
												In the previous section, you hardcoded the path to
												<code>/api/employees</code>
												. Instead, the ONLY path you should hardcode is the root.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">...
var root = '/api';
...</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												With a handy little <a
													href="https://github.com/spring-guides/tut-react-and-spring-data-rest/blob/master/hypermedia/src/main/resources/static/follow.js"><code>follow()</code>
													function</a>, you can now start from the root and navigate to
												where you need!
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">componentDidMount() {
    this.loadFromServer(this.state.pageSize);
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												In the previous section, the loading was done directly
												inside
												<code>componentDidMount()</code>
												. In this section, we are making it possible to reload the
												entire list of employees when the page size is updated. To
												do so, we have moved things into
												<code>loadFromServer()</code>
												.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">loadFromServer(pageSize) {
    follow(client, root, [
        {rel: 'employees', params: {size: pageSize}}]
    ).then(employeeCollection =&gt; {
        return client({
            method: 'GET',
            path: employeeCollection.entity._links.profile.href,
            headers: {'Accept': 'application/schema+json'}
        }).then(schema =&gt; {
            this.schema = schema.entity;
            return employeeCollection;
        });
    }).done(employeeCollection =&gt; {
        this.setState({
            employees: employeeCollection.entity._embedded.employees,
            attributes: Object.keys(this.schema.properties),
            pageSize: pageSize,
            links: employeeCollection.entity._links});
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												<code>loadFromServer</code>
												is very similar the previous section, but instead if uses
												<code>follow()</code>
												:
											</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														The first argument to the follow() function is the
														<code>client</code>
														object used to make REST calls.
													</p>
												</li>
												<li>
													<p>The second argument is the root URI to start from.</p>
												</li>
												<li>
													<p>The third argument is an array of relationships to
														navigate along. Each one can be a string or an object.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												The array of relationships can be as simple as
												<code>["employees"]</code>
												, meaning when the first call is made, look in <strong>_links</strong>
												for the relationship (or <strong>rel</strong>) named <strong>employees</strong>.
												Find its <strong>href</strong> and navigate to it. If there
												is another relationship in the array, rinse and repeat.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Sometimes, a rel by itself isn’t enough. In this fragment of
												code, it also plugs in a query parameter of <strong>?size=&lt;pageSize&gt;</strong>.
												There are other options that can be supplied, as you’ll see
												further along.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_grabbing_json_schema_metadata">Grabbing JSON
											Schema metadata</h3>
										<div class="paragraph">
											<p>
												After navigating to <strong>employees</strong> with the
												size-based query, the <strong>employeeCollection</strong> is
												at your fingertips. In the previous section, we called it
												day and displayed that data inside
												<code>&lt;EmployeeList /&gt;</code>
												. Today, you are performing another call to grab some <a
													href="http://json-schema.org/">JSON Schema metadata</a>
												found at
												<code>/api/profile/employees/</code>
												.
											</p>
										</div>
										<div class="paragraph">
											<p>You can see the data yourself:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl http://localhost:8080/api/profile/employees -H 'Accept:application/schema+json'
{
  "title" : "Employee",
  "properties" : {
    "firstName" : {
      "title" : "First name",
      "readOnly" : false,
      "type" : "string"
    },
    "lastName" : {
      "title" : "Last name",
      "readOnly" : false,
      "type" : "string"
    },
    "description" : {
      "title" : "Description",
      "readOnly" : false,
      "type" : "string"
    }
  },
  "definitions" : { },
  "type" : "object",
  "$schema" : "http://json-schema.org/draft-04/schema#"
}</pre>
											</div>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">The default form of metadata at
															/profile/employees is ALPS. In this case, though, you are
															using content negotation to fetch JSON Schema.</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>By capturing this information in the`&lt;App /&gt;`
												component’s state, you can make good use of it later on when
												building input forms.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="creating-new-records">Creating new records</h3>
										<div class="paragraph">
											<p>
												Equipped with this metadata, you can now add some extra
												controls to the UI. Create a new React component,
												<code>&lt;CreateDialog /&gt;</code>
												.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class CreateDialog extends React.Component {

	constructor(props) {
		super(props);
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	handleSubmit(e) {
		e.preventDefault();
		var newEmployee = {};
		this.props.attributes.forEach(attribute =&gt; {
			newEmployee[attribute] = React.findDOMNode(this.refs[attribute]).value.trim();
		});
		this.props.onCreate(newEmployee);

		// clear out the dialog's inputs
		this.props.attributes.forEach(attribute =&gt; {
			React.findDOMNode(this.refs[attribute]).value = '';
		});

		// Navigate away from the dialog to hide it.
		window.location = "#";
	}

	render() {
		var inputs = this.props.attributes.map(attribute =&gt;
			&lt;p key={attribute}&gt;
				&lt;input type="text" placeholder={attribute} ref={attribute} className="field" /&gt;
			&lt;/p&gt;
		);

		return (
			&lt;div&gt;
				&lt;a href="#createEmployee"&gt;Create&lt;/a&gt;

				&lt;div id="createEmployee" className="modalDialog"&gt;
					&lt;div&gt;
						&lt;a href="#" title="Close" className="close"&gt;X&lt;/a&gt;

						&lt;h2&gt;Create new employee&lt;/h2&gt;

						&lt;form&gt;
							{inputs}
							&lt;button onClick={this.handleSubmit}&gt;Create&lt;/button&gt;
						&lt;/form&gt;
					&lt;/div&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		)
	}

}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This new component has both a
												<code>handleSubmit()</code>
												function as well as the expected
												<code>render()</code>
												function.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Let’s dig into these functions in reverse order, and first
												look at the
												<code>render()</code>
												function.
											</p>
										</div>
										<div class="sect3">
											<h4 id="hypermedia-rendering">Rendering</h4>
											<div class="paragraph">
												<p>
													Your code maps over the JSON Schema data found in the <strong>attributes</strong>
													property and converts it into an array of
													<code>&lt;p&gt;&lt;input&gt;&lt;/p&gt;</code>
													elements.
												</p>
											</div>
											<div class="ulist">
												<ul>
													<li>
														<p>
															<strong>key</strong> is again needed by React to
															distinguish between multiple child nodes.
														</p>
													</li>
													<li>
														<p>It’s a simple text-based entry field.</p>
													</li>
													<li>
														<p>
															<strong>placeholder</strong> is where we can show the
															user with field is which.
														</p>
													</li>
													<li>
														<p>
															You may used to having a <strong>name</strong> attribute,
															but it’s not necessary. With React, <strong>ref</strong>
															is the mechanism to grab a particular DOM node (as you’ll
															soon see).
														</p>
													</li>
												</ul>
											</div>
											<div class="paragraph">
												<p>This represents the dynamic nature of the component,
													driven by loading data from the server.</p>
											</div>
											<div class="paragraph">
												<p>
													Inside this component’s top-level
													<code>&lt;div&gt;</code>
													is an anchor tag and another
													<code>&lt;div&gt;</code>
													. The anchor tag is the button to open the dialog. And the
													nested
													<code>&lt;div&gt;</code>
													is the hidden dialog itself. In this example, you are use
													pure HTML5 and CSS3. No JavaScript at all! You can <a
														href="https://github.com/spring-guides/tut-react-and-spring-data-rest/blob/master/hypermedia/src/main/resources/static/main.css">see
														the CSS code</a> used to show/hide the dialog. We won’t dive
													into that here.
												</p>
											</div>
											<div class="paragraph">
												<p>
													Nestled inside
													<code>&lt;div id="createEmployee"&gt;</code>
													is a form where your dynamic list of input fields are
													injected followed by the <strong>Create</strong> button.
													That button has an
													<code>onClick={this.handleSubmit}</code>
													event handler. This is the React way of registering an
													event handler.
												</p>
											</div>
											<div class="admonitionblock note">
												<table>
													<tbody>
														<tr>
															<td class="icon"><i class="fa icon-note"
																title="Note"></i></td>
															<td class="content">React doesn’t create a fistful
																of event handlers on every DOM element. Instead, it has
																a <a
																href="https://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html#under-the-hood-autobinding-and-event-delegation">much
																	more performant and sophisticated</a> solution. The point
																being you don’t have to manage that infrastructure and
																can instead focus on writing functional code.
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="sect3">
											<h4 id="_handling_user_input">Handling user input</h4>
											<div class="paragraph">
												<p>
													The
													<code>handleSubmit()</code>
													function first stops the event from bubbling further up the
													hierarchy. It then uses the same JSON Schema attribute
													property to find each
													<code>&lt;input&gt;</code>
													using
													<code>React.findDOMNode(this.refs[attribute])</code>
													.
												</p>
											</div>
											<div class="paragraph">
												<p>
													<code>this.refs</code>
													is a way to reach out and grab a particular React component
													by name. In that sense, you are ONLY getting the virtual
													DOM component. To grab the actual DOM element you need to
													use
													<code>React.findDOMNode()</code>
													.
												</p>
											</div>
											<div class="paragraph">
												<p>
													After iterating over every input and building up the
													<code>newEmployee</code>
													object, we invoke a callback to
													<code>onCreate()</code>
													the new employee. This function is up top inside
													<code>App.onCreate</code>
													and was provided to this React component as another
													property. Look at how that top-level function operates:
												</p>
											</div>
											<div class="listingblock">
												<div class="content">
													<pre class="prettyprint highlight">
														<code class="language-javascript" data-lang="javascript">onCreate(newEmployee) {
    follow(client, root, ['employees']).then(employeeCollection =&gt; {
        return client({
            method: 'POST',
            path: employeeCollection.entity._links.self.href,
            entity: newEmployee,
            headers: {'Content-Type': 'application/json'}
        })
    }).then(response =&gt; {
        return follow(client, root, [
            {rel: 'employees', params: {'size': this.state.pageSize}}]);
    }).done(response =&gt; {
        this.onNavigate(response.entity._links.last.href);
    });
}</code>
													</pre>
												</div>
											</div>
											<div class="paragraph">
												<p>
													Once again, use the
													<code>follow()</code>
													function to navigate to the <strong>employees</strong>
													resource where POST operations are performed. In this case,
													there was no need to apply any parameters, so the
													string-based array of rels is fine. In this situation, the
													POST call is returned. This allows the next
													<code>then()</code>
													clause to handle processing the outcome of the POST.
												</p>
											</div>
											<div class="paragraph">
												<p>
													New records are typically added to the end of the dataset.
													Since you are looking at a certain page, it’s logical to
													expect the new employee record to not be on the current
													page. To handle this, you need to fetch a new batch of data
													with the same page size applied. That promise is returned
													for the final clause inside
													<code>done()</code>
													.
												</p>
											</div>
											<div class="paragraph">
												<p>
													Since the user probably wants to see the newly created
													employee, you can then use the hypermedia controls and
													navigate to the <strong>last</strong> entry.
												</p>
											</div>
											<div class="paragraph">
												<p>This introduces the concept of paging in our UI.
													Let’s tackle that next!</p>
											</div>
											<div id="NOTE" class="exampleblock">
												<div class="content">
													<div class="paragraph">
														<p>
															First time using a promise-based API? <a
																href="https://promisesaplus.com/">Promises</a> are a way
															to kick of asynchronous operations and then register a
															function to respond when the task is done. Promises are
															designed to be chained together to avoid "callback hell".
															Look at the following flow:
														</p>
													</div>
													<div class="listingblock">
														<div class="content">
															<pre class="prettyprint highlight">
																<code class="language-javascript" data-lang="javascript">when.promise(async_func_call())
	.then(function(results) {
		/* process the outcome of async_func_call */
	})
	.then(function(more_results) {
		/* process the previous then() return value */
	})
	.done(function(yet_more) {
		/* process the previous then() and wrap things up */
	});</code>
															</pre>
														</div>
													</div>
													<div class="paragraph">
														<p>
															For more details, check out <a
																href="http://know.cujojs.com/tutorials/promises/consuming-promises">this
																tutorial on promises</a>.
														</p>
													</div>
													<div class="paragraph">
														<p>
															The secret thing to remember with promises is that
															<code>then()</code>
															functions <em>need</em> to return something, whether it’s
															a value or another promise.
															<code>done()</code>
															functions do NOT return anything, and you don’t chain
															anything after it. In case you haven’t noticed yet,
															<code>client</code>
															(which is an instance of
															<code>rest</code>
															from rest.js) as well as the
															<code>follow</code>
															function return promises.
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_paging_through_data">Paging through data</h3>
										<div class="paragraph">
											<p>You set up paging on the backend and have already
												starting taking advantage of it when creating new employees.</p>
										</div>
										<div class="paragraph">
											<p>
												In <a href="#creating-new-records">the previous section</a>,
												you used the page controls to jump to the <strong>last</strong>
												page. It would be really handy to dynamically apply it to
												the UI and let the user navigate as desired. Adjusting the
												controls dynamically based on available navigation links
												would be great.
											</p>
										</div>
										<div class="paragraph">
											<p>
												First, let’s check out the
												<code>onNavigate()</code>
												function you used.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">onNavigate(navUri) {
    client({method: 'GET', path: navUri}).done(employeeCollection =&gt; {
        this.setState({
            employees: employeeCollection.entity._embedded.employees,
            attributes: this.state.attributes,
            pageSize: this.state.pageSize,
            links: employeeCollection.entity._links
        });
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This is defined at the top, inside
												<code>App.onNavigate</code>
												. Again, this is to allow managing the state of the UI in
												the top component. After passing
												<code>onNavigate()</code>
												down to the
												<code>&lt;EmployeeList /&gt;</code>
												React component, the following handlers are coded up to
												handle clicking on some buttons:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">handleNavFirst(e){
    e.preventDefault();
    this.props.onNavigate(this.props.links.first.href);
}

handleNavPrev(e) {
    e.preventDefault();
    this.props.onNavigate(this.props.links.prev.href);
}

handleNavNext(e) {
    e.preventDefault();
    this.props.onNavigate(this.props.links.next.href);
}

handleNavLast(e) {
    e.preventDefault();
    this.props.onNavigate(this.props.links.last.href);
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Each of these functions intercepts the default event and
												stops it from bubbling up. Then it invokes the
												<code>onNavigate()</code>
												function with the proper hypermedia link.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Now conditionally display the controls based on which links
												appear in the hypermedia links in
												<code>EmployeeList.render</code>
												:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">render() {
    var employees = this.props.employees.map(employee =&gt;
        &lt;Employee key={employee._links.self.href} employee={employee} onDelete={this.props.onDelete}/&gt;
    );

    var navLinks = [];
    if ("first" in this.props.links) {
        navLinks.push(&lt;button key="first" onClick={this.handleNavFirst}&gt;&amp;lt;&amp;lt;&lt;/button&gt;);
    }
    if ("prev" in this.props.links) {
        navLinks.push(&lt;button key="prev" onClick={this.handleNavPrev}&gt;&amp;lt;&lt;/button&gt;);
    }
    if ("next" in this.props.links) {
        navLinks.push(&lt;button key="next" onClick={this.handleNavNext}&gt;&amp;gt;&lt;/button&gt;);
    }
    if ("last" in this.props.links) {
        navLinks.push(&lt;button key="last" onClick={this.handleNavLast}&gt;&amp;gt;&amp;gt;&lt;/button&gt;);
    }

    return (
        &lt;div&gt;
            &lt;input ref="pageSize" defaultValue={this.props.pageSize} onInput={this.handleInput}/&gt;
            &lt;table&gt;
                &lt;tr&gt;
                    &lt;th&gt;First Name&lt;/th&gt;
                    &lt;th&gt;Last Name&lt;/th&gt;
                    &lt;th&gt;Description&lt;/th&gt;
                    &lt;th&gt;&lt;/th&gt;
                &lt;/tr&gt;
                {employees}
            &lt;/table&gt;
            &lt;div&gt;
                {navLinks}
            &lt;/div&gt;
        &lt;/div&gt;
    )
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												As in the previous section, it still transforms
												<code>this.props.employees</code>
												into an array of
												<code>&lt;Element /&gt;</code>
												components. Then it builds up an array of
												<code>navLinks</code>
												, an array of HTML buttons.
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">Because React is based on XML,
															you can’t put "&lt;" inside the <code>&lt;button&gt;</code>
															element. You must instead use the encoded version.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>
												Then you can see
												<code>{navLinks}</code>
												inserted towards the bottom of the returned HTML.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_deleting_existing_records">Deleting existing
											records</h3>
										<div class="paragraph">
											<p>
												Deleting entries is much easier. Get a hold of its HAL-based
												record and apply <strong>DELETE</strong> to its <strong>self</strong>
												link.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class Employee extends React.Component {

	constructor(props) {
		super(props);
		this.handleDelete = this.handleDelete.bind(this);
	}

	handleDelete() {
		this.props.onDelete(this.props.employee);
	}

	render() {
		return (
			&lt;tr&gt;
				&lt;td&gt;{this.props.employee.firstName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.lastName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.description}&lt;/td&gt;
				&lt;td&gt;
					&lt;button onClick={this.handleDelete}&gt;Delete&lt;/button&gt;
				&lt;/td&gt;
			&lt;/tr&gt;
		)
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This updated version of the Employee component shows an
												extra entry at the end of the row, a delete button. It is
												registered to invoke
												<code>this.handleDelete</code>
												when clicked upon. The
												<code>handleDelete()</code>
												function can then invoke the callback passed down while
												supplying the contextually important
												<code>this.props.employee</code>
												record.
											</p>
										</div>
										<div class="admonitionblock important">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-important"
															title="Important"></i></td>
														<td class="content">This shows again that it is
															easiest to manage state in the top component, in one
															place. This might not <em>always</em> be the case, but
															oftentimes, managing state in one place makes it easier
															to keep straight and simpler. By invoking the callback
															with component-specific details (<code>this.props.onDelete(this.props.employee)</code>),
															it is very easy to orchestrate behavior between
															components.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>
												Tracing the
												<code>onDelete()</code>
												function back to the top at
												<code>App.onDelete</code>
												, you can see how it operates:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">onDelete(employee) {
    client({method: 'DELETE', path: employee._links.self.href}).done(response =&gt; {
        this.loadFromServer(this.state.pageSize);
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>The behavior to apply after deleting a record with a
												page-based UI is a bit tricky. In this case, it reloads the
												whole data from the server, applying the same page size.
												Then it shows the first page.</p>
										</div>
										<div class="paragraph">
											<p>If you are deleting the last record on the last page,
												it will jump to the first page.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_adjusting_the_page_size">Adjusting the page size</h3>
										<div class="paragraph">
											<p>One way to see how hypermedia really shines is to
												update the page size. Spring Data REST fluidly updates the
												navigational links based on the page size.</p>
										</div>
										<div class="paragraph">
											<p>
												There is an HTML element at the top of
												<code>ElementList.render</code>
												:
												<code>&lt;input ref="pageSize"
													defaultValue={this.props.pageSize}
													onInput={this.handleInput}/&gt;</code>
												.
											</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>ref="pageSize"</code>
														makes it easy to grab that element via this.refs.pageSize.
													</p>
												</li>
												<li>
													<p>
														<code>defaultValue</code>
														initializes it with the state’s <strong>pageSize</strong>.
													</p>
												</li>
												<li>
													<p>
														<code>onInput</code>
														registers a handler as shown below.
													</p>
												</li>
											</ul>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">handleInput(e) {
    e.preventDefault();
    var pageSize = React.findDOMNode(this.refs.pageSize).value;
    if (/^[0-9]+$/.test(pageSize)) {
        this.props.updatePageSize(pageSize);
    } else {
        React.findDOMNode(this.refs.pageSize).value =
            pageSize.substring(0, pageSize.length - 1);
    }
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												It stops the event from bubbling up. Then it uses the <strong>ref</strong>
												attribute of the
												<code>&lt;input&gt;</code>
												to find the DOM node and extract its value, all through
												React’s
												<code>findDOMNode()</code>
												helper function. It tests if the input is really a number by
												checking if it’s a string of digits. If so, it invokes the
												callback, sending the new page size to the
												<code>App</code>
												React component. If not, the character just entered is
												stripped off the input.
											</p>
										</div>
										<div class="paragraph">
											<p>
												What does
												<code>App</code>
												do when it gets a
												<code>updatePageSize()</code>
												? Check it out:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">updatePageSize(pageSize) {
    if (pageSize !== this.state.pageSize) {
        this.loadFromServer(pageSize);
    }
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>Because a new page size causes changes to all the
												navigation links, it’s best to refetch the data and start
												from the beginning.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_putting_it_all_together">Putting it all together</h3>
										<div class="paragraph">
											<p>With all these nice additions, you now have a really
												vamped up UI.</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/hypermedia/images/hypermedia-1.png"
													alt="hypermedia 1">
											</div>
										</div>
										<div class="paragraph">
											<p>You can see the page size setting at the top, the
												delete buttons on each row, and the navigational buttons at
												the bottom. The navigational buttons illustrate a powerful
												feature of hypermedia controls.</p>
										</div>
										<div class="paragraph">
											<p>
												Down below, you can see the
												<code>CreateDialog</code>
												with the metadata plugged into the HTML input placeholders.
											</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/hypermedia/images/hypermedia-2.png"
													alt="hypermedia 2">
											</div>
										</div>
										<div class="paragraph">
											<p>
												This really shows the power of using hypermedia coupled with
												domain-driven metadata (JSON Schema). The web page doesn’t
												have to know which field is which. Instead, the user can <em>see</em>
												it and know how to use it. If you added another field to the
												<code>Employee</code>
												domain object, this pop-up would automatically display it.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_review_2">Review</h3>
										<div class="paragraph">
											<p>In this section:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>You turned on Spring Data REST’s paging feature.</p>
												</li>
												<li>
													<p>You threw out hardcoded URI paths and started using
														the root URI combined with relationship names or "rels".</p>
												</li>
												<li>
													<p>You updated the UI to dynamically use page-based
														hypermedia controls.</p>
												</li>
												<li>
													<p>You added the ability to create &amp; delete
														employees and update the UI as needed.</p>
												</li>
												<li>
													<p>You made it possible to change the page size and
														have the UI flexibly respond.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>Issues?</p>
										</div>
										<div class="paragraph">
											<p>You made the webpage dynamic. But open another browser
												tab and point it at the same app. Changes in one tab won’t
												update anything in the other.</p>
										</div>
										<div class="paragraph">
											<p>That is something we can address in the next section.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="sect1">
								<h2 id="react-and-spring-data-rest-part-3">Part 3 -
									Conditional Operations</h2>
								<div class="sectionbody">
									<div class="paragraph">
										<p>
											In the <a href="#react-and-spring-data-rest-part-2">previous
												section</a>, you found out how to turn on Spring Data REST’s
											hypermedia controls, have the UI navigate by paging, and
											dynamically resize based on changing the page size. You added
											the ability to create and delete employees and have the pages
											adjust. But no solution is complete with taking into
											consideration updates made by other users on the same bit of
											data you are currently editing.
										</p>
									</div>
									<div class="paragraph">
										<p>
											Feel free to <a
												href="https://github.com/spring-guides/tut-react-and-spring-data-rest/tree/master/conditional">grab
												the code</a> from this repository and follow along. This section
											is based on the previous section’s app with extra things
											added.
										</p>
									</div>
									<div class="sect2">
										<h3 id="_to_put_or_not_to_put_that_is_the_question">To
											PUT or not to PUT, that is the question</h3>
										<div class="paragraph">
											<p>When you fetch a resource, there is risk is that it
												might go stale if someone else updates it. To deal with
												this, Spring Data REST integrates two technologies:
												versioning of resources and ETags.</p>
										</div>
										<div class="paragraph">
											<p>By versioning resources on the backend and using ETags
												in the frontend, it is possible to conditially PUT a change.
												In other words, you can detect if a resource has changed and
												prevent a PUT (or a PATCH) from stomping on someone else’s
												update. Let’s check it out.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_versioning_rest_resources">Versioning REST
											resources</h3>
										<div class="paragraph">
											<p>To support versioning of resources, define a version
												attribute for your domain objects that need this type of
												protection.</p>
										</div>
										<div class="listingblock">
											<div class="title">
												src/main/java/com/greglturnquist/payroll/Employee.java</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Data
@Entity
public class Employee {

	private @Id @GeneratedValue Long id;
	private String firstName;
	private String lastName;
	private String description;

	private @Version @JsonIgnore Long version;

	private Employee() {}

	public Employee(String firstName, String lastName, String description) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.description = description;
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														The <strong>version</strong> field is annotated with
														<code>javax.persistence.Version</code>
														. It causes a value to be automatically stored and updated
														everytime a row is inserted and updated.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												When fetching an individual resource (not a collection
												resource), Spring Data REST will automatically add an <a
													href="http://tools.ietf.org/html/rfc7232#section-2.3">ETag
													response header</a> with the value of this field.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_fetching_individual_resources_and_their_headers">Fetching
											individual resources and their headers</h3>
										<div class="paragraph">
											<p>
												In the <a href="#react-and-spring-data-rest-part-2">previous
													section</a> you used the collection resource to gather data and
												populate the UI’s HTML table. With Spring Data REST, the <strong>_embedded</strong>
												data set is considered a preview of data. While useful for
												glancing at data, to get headers like ETags, you need to
												fetch each resource individually.
											</p>
										</div>
										<div class="paragraph">
											<p>
												In this version,
												<code>loadFromServer</code>
												is updated to fetch the collection and then use the URIs to
												retrieve each individual resource.
											</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												Fetching each resource</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">loadFromServer(pageSize) {
    follow(client, root, [
        {rel: 'employees', params: {size: pageSize}}]
    ).then(employeeCollection =&gt; {
        return client({
            method: 'GET',
            path: employeeCollection.entity._links.profile.href,
            headers: {'Accept': 'application/schema+json'}
        }).then(schema =&gt; {
            this.schema = schema.entity;
            this.links = employeeCollection.entity._links;
            return employeeCollection;
        });
    }).then(employeeCollection =&gt; {
        return employeeCollection.entity._embedded.employees.map(employee =&gt;
                client({
                    method: 'GET',
                    path: employee._links.self.href
                })
        );
    }).then(employeePromises =&gt; {
        return when.all(employeePromises);
    }).done(employees =&gt; {
        this.setState({
            employees: employees,
            attributes: Object.keys(this.schema.properties),
            pageSize: pageSize,
            links: this.links
        });
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="olist arabic">
											<ol class="arabic">
												<li>
													<p>
														The
														<code>follow()</code>
														function goes to the <strong>employees</strong> collection
														resource.
													</p>
												</li>
												<li>
													<p>
														The
														<code>then(employeeCollection ⇒ …​)</code>
														clause creates a call to fetch JSON Schema data. This has
														a sub-then clause to store the metadata and navigational
														links in the
														<code>&lt;App/&gt;</code>
														component.
													</p>
													<div class="ulist">
														<ul>
															<li>
																<p>Notice that this embedded promise returns the
																	employeeCollection. That way, the collection can be
																	passed onto the next call while letting you grab the
																	metadata along the way.</p>
															</li>
														</ul>
													</div>
												</li>
												<li>
													<p>
														The second
														<code>then(employeeCollection ⇒ …​)</code>
														clause converts the collection of employees into an array
														of GET promises to fetch each individual resource. <strong>This
															is what you need to fetch an ETag header for each
															employee.</strong>
													</p>
												</li>
												<li>
													<p>
														The
														<code>then(employeePromises ⇒ …​)</code>
														clause takes the array of GET promises and merges them
														into a single promise with
														<code>when.all()</code>
														, resolved when all the GET promises are resolved.
													</p>
												</li>
												<li>
													<p>
														<code>loadFromServer</code>
														wraps up with
														<code>done(employees ⇒ …​)</code>
														where the UI state is updated using this amalgamation of
														data.
													</p>
												</li>
											</ol>
										</div>
										<div class="paragraph">
											<p>
												This chain is implemented in other places as well. For
												example,
												<code>onNavigate()</code>
												, which is used to jump to different pages, has been updated
												to fetch individual resources. Since it’s mostly the same as
												what’s shown above, it’s been left out of this section.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_updating_existing_resources">Updating existing
											resources</h3>
										<div class="paragraph">
											<p>
												In this section, you are adding an
												<code>UpdateDialog</code>
												React component to edit existing employee records.
											</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												UpdateDialog component</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class UpdateDialog extends React.Component {

	constructor(props) {
		super(props);
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	handleSubmit(e) {
		e.preventDefault();
		var updatedEmployee = {};
		this.props.attributes.forEach(attribute =&gt; {
			updatedEmployee[attribute] = React.findDOMNode(this.refs[attribute]).value.trim();
		});
		this.props.onUpdate(this.props.employee, updatedEmployee);
		window.location = "#";
	}

	render() {
		var inputs = this.props.attributes.map(attribute =&gt;
				&lt;p key={this.props.employee.entity[attribute]}&gt;
					&lt;input type="text" placeholder={attribute}
						   defaultValue={this.props.employee.entity[attribute]}
						   ref={attribute} className="field" /&gt;
				&lt;/p&gt;
		);

		var dialogId = "updateEmployee-" + this.props.employee.entity._links.self.href;

		return (
			&lt;div key={this.props.employee.entity._links.self.href}&gt;
				&lt;a href={"#" + dialogId}&gt;Update&lt;/a&gt;
				&lt;div id={dialogId} className="modalDialog"&gt;
					&lt;div&gt;
						&lt;a href="#" title="Close" className="close"&gt;X&lt;/a&gt;

						&lt;h2&gt;Update an employee&lt;/h2&gt;

						&lt;form&gt;
							{inputs}
							&lt;button onClick={this.handleSubmit}&gt;Update&lt;/button&gt;
						&lt;/form&gt;
					&lt;/div&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		)
	}

};</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This new component has both a
												<code>handleSubmit()</code>
												function as well as the expected
												<code>render()</code>
												function, similar to the
												<code>&lt;CreateDialog /&gt;</code>
												component.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Let’s dig into these functions in reverse order, and first
												look at the
												<code>render()</code>
												function.
											</p>
										</div>
										<div class="sect3">
											<h4 id="_rendering">Rendering</h4>
											<div class="paragraph">
												<p>
													This component uses the same CSS/HTML tactics to show and
													hide the dialog as the
													<code>&lt;CreateDialog /&gt;</code>
													from the previous section.
												</p>
											</div>
											<div class="paragraph">
												<p>
													It converts the array of JSON Schema attributes into an
													array of HTML inputs, wrapped in paragraph elements for
													styling. This is also the same as the
													<code>&lt;CreateDialog /&gt;</code>
													with one difference: the fields are loaded with <strong>this.props.employee</strong>.
													In the CreateDialog component, the fields are empty.
												</p>
											</div>
											<div class="paragraph">
												<p>
													The <strong>id</strong> field is built differently. There
													is only one CreateDialog link on the entire UI, but a
													separate UpdateDialog link for every row displayed. Hence,
													the <strong>id</strong> field is based on the <strong>self</strong>
													link’s URI. This is used in both the &lt;div&gt; element’s
													React <strong>key</strong> as well as the HTML anchor tag
													and the hidden pop-up.
												</p>
											</div>
										</div>
										<div class="sect3">
											<h4 id="_handling_user_input_2">Handling user input</h4>
											<div class="paragraph">
												<p>
													The submit button is linked to the component’s
													<code>handleSubmit()</code>
													function. This handily uses
													<code>React.findDOMNode()</code>
													to extract the details of the pop-up using <a
														href="http://facebook.github.io/react/docs/more-about-refs.html">React
														refs</a>.
												</p>
											</div>
											<div class="paragraph">
												<p>
													After the input values are extracted and loaded into the
													<code>updatedEmployee</code>
													object, the top-level
													<code>onUpdate()</code>
													method is invoked. This continues React’s style of one-way
													binding where the functions to call are pushed from upper
													level components into the lower level ones. This way, state
													is still managed at the top.
												</p>
											</div>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_conditional_put">Conditional PUT</h3>
										<div class="paragraph">
											<p>So you’ve gone to all this effort to embed versioning
												in the data model. Spring Data REST has served up that value
												as an ETag response header. Here is where you get to put it
												to good use!</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												onUpdate function</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">onUpdate(employee, updatedEmployee) {
    client({
        method: 'PUT',
        path: employee.entity._links.self.href,
        entity: updatedEmployee,
        headers: {
            'Content-Type': 'application/json',
            'If-Match': employee.headers.Etag
        }
    }).done(response =&gt; {
        this.loadFromServer(this.state.pageSize);
    }, response =&gt; {
        if (response.status.code === 412) {
            alert('DENIED: Unable to update ' +
                employee.entity._links.self.href + '. Your copy is stale.');
        }
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												PUT with an <a
													href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.24">If-Match
													request header</a> causes Spring Data REST to check the value
												against the current version. If the incoming <strong>If-Match</strong>
												value doesn’t match the data store’s version value, Spring
												Data REST will fail with an <strong>HTTP 412
													Precondition Failed</strong>.
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">The spec for <a
															href="https://promisesaplus.com/">Promises/A+</a>
															actually defines their API as <code>then(successFunction,
																errorFunction)</code>. So far, you’ve only seen it used with
															success functions. In the code fragment above, there are
															two functions. The success function invokes <code>loadFromServer</code>
															while the error function displays a browser alert about
															the stale data.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_putting_it_all_together_2">Putting it all
											together</h3>
										<div class="paragraph">
											<p>
												With your
												<code>UpdateDialog</code>
												React component defined and nicely linked to the top-level
												<code>onUpdate</code>
												function, the last step is to wire it into the existing
												layout of components.
											</p>
										</div>
										<div class="paragraph">
											<p>
												The
												<code>CreateDialog</code>
												created in the previous section was put at the top of the
												<code>EmployeeList</code>
												because there is only one instance. However,
												<code>UpdateDialog</code>
												is tied directly to specific employees. So you can see it
												plugged in below in the
												<code>Employee</code>
												React component:
											</p>
										</div>
										<div class="listingblock">
											<div class="title">src/main/resources/static/app.js -
												Employee with UpdateDialog</div>
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class Employee extends React.Component {

	constructor(props) {
		super(props);
		this.handleDelete = this.handleDelete.bind(this);
	}

	handleDelete() {
		this.props.onDelete(this.props.employee);
	}

	render() {
		return (
			&lt;tr&gt;
				&lt;td&gt;{this.props.employee.entity.firstName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.entity.lastName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.entity.description}&lt;/td&gt;
				&lt;td&gt;
					&lt;UpdateDialog employee={this.props.employee}
								  attributes={this.props.attributes}
								  onUpdate={this.props.onUpdate}/&gt;
				&lt;/td&gt;
				&lt;td&gt;
					&lt;button onClick={this.handleDelete}&gt;Delete&lt;/button&gt;
				&lt;/td&gt;
			&lt;/tr&gt;
		)
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												In this section, you switch from using the collection
												resource to individual resources. The fields for an employee
												record are now found at
												<code>this.props.employee.entity</code>
												. It gives us access to
												<code>this.props.employee.headers</code>
												where we can find ETags.
											</p>
										</div>
										<div class="paragraph">
											<p>
												There are other headers supported by Spring Data REST (like
												<a
													href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.29">Last-Modified</a>)
												which aren’t part of this series. So structuring your data
												this way is handy.
											</p>
										</div>
										<div class="admonitionblock important">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-important"
															title="Important"></i></td>
														<td class="content">The structure of <code>.entity</code>
															and <code>.headers</code> is only pertinent when using <a
															href="https://github.com/cujojs/rest">rest.js</a> as the
															REST library of choice. If you use a different library,
															you will have to adapt as necessary.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_seeing_things_in_action">Seeing things in action</h3>
										<div class="olist arabic">
											<ol class="arabic">
												<li>
													<p>
														Start up the app (
														<code>./mvnw spring-boot:run</code>
														).
													</p>
												</li>
												<li>
													<p>
														Open up a tab and navigate to <a
															href="http://localhost:8080" class="bare">http://localhost:8080</a>.
													</p>
													<div class="imageblock">
														<div class="content">
															<img
																src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/conditional/images/conditional-1.png"
																alt="conditional 1">
														</div>
													</div>
												</li>
												<li>
													<p>Pull up the edit dialog for Frodo.</p>
												</li>
												<li>
													<p>Open another tab in your browser and pull up the
														same record.</p>
												</li>
												<li>
													<p>Make a change to the record in the first tab.</p>
												</li>
												<li>
													<p>Try to make a change in the second tab.</p>
													<div class="imageblock">
														<div class="content">
															<img
																src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/conditional/images/conditional-2.png"
																alt="conditional 2">
														</div>
													</div>
												</li>
											</ol>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/conditional/images/conditional-3.png"
													alt="conditional 3">
											</div>
										</div>
										<div class="paragraph">
											<p>With these mods, you have increased data integrity by
												avoiding collisions.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_review_3">Review</h3>
										<div class="paragraph">
											<p>In this section:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														You configured your domain model with an
														<code>@Version</code>
														field for JPA-based optimistic locking.
													</p>
												</li>
												<li>
													<p>You adjusted the frontend to fetch individual
														resources.</p>
												</li>
												<li>
													<p>
														You plugged the ETag header from an individual resource
														into an <strong>If-Match</strong> request header to make
														PUTs conditional.
													</p>
												</li>
												<li>
													<p>You coded a new UpdateDialog for each employee shown
														on the list.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>With this plugged in, it’s easy to avoid colliding
												with other users, or simply overwriting their edits.</p>
										</div>
										<div class="paragraph">
											<p>Issues?</p>
										</div>
										<div class="paragraph">
											<p>It’s certainly nice to know when you’re editing a bad
												record. But is it best to wait until you click "Submit" to
												find out?</p>
										</div>
										<div class="paragraph">
											<p>
												The logic to fetch resources is very similar in both
												<code>loadFromServer</code>
												and
												<code>onNavigate</code>
												. Do you see ways to avoid duplicate code?
											</p>
										</div>
										<div class="paragraph">
											<p>
												You put the JSON Schema metadata to good use in building up
												the
												<code>CreateDialog</code>
												and the
												<code>UpdateDialog</code>
												inputs. Do you see other places to use the metadata to makes
												things more generic? Imagine you wanted to add five more
												fields to
												<code>Employee.java</code>
												. What would it take to update the UI?
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="sect1">
								<h2 id="react-and-spring-data-rest-part-4">Part 4 - Events</h2>
								<div class="sectionbody">
									<div class="paragraph">
										<p>
											In the <a href="#react-and-spring-data-rest-part-3">previous
												section</a>, you introduced conditional updates to avoid
											collisions with other users when editing the same data. You
											also learned how to version data on the backend with
											optimistic locking. You got a tip off if someone edited the
											same record so you could refresh the page and get the update.
										</p>
									</div>
									<div class="paragraph">
										<p>That’s good. But do you know what’s even better? Having
											the UI dynamically respond when other people update the
											resources.</p>
									</div>
									<div class="paragraph">
										<p>In this section you’ll learn how to use Spring Data
											REST’s built in event system to detect changes in the backend
											and publish updates to ALL users through Spring’s WebSocket
											support. Then you’ll be able to dynamically adjust clients as
											the data updates.</p>
									</div>
									<div class="paragraph">
										<p>
											Feel free to <a
												href="https://github.com/sprig-guides/tut-react-and-spring-data-rest/tree/master/events">grab
												the code</a> from this repository and follow along. This section
											is based on the previous section’s app with extra things
											added.
										</p>
									</div>
									<div class="sect2">
										<h3 id="_adding_spring_websocket_support_to_the_project">Adding
											Spring WebSocket support to the project</h3>
										<div class="paragraph">
											<p>Before getting underway, you need to add a dependency
												to your project’s pom.xml file:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-xml" data-lang="xml">&lt;dependency&gt;
    &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
    &lt;artifactId&gt;spring-boot-starter-websocket&lt;/artifactId&gt;
&lt;/dependency&gt;</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>This bring in Spring Boot’s WebSocket starter.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_configuring_websockets_with_spring">Configuring
											WebSockets with Spring</h3>
										<div class="paragraph">
											<p>
												<a
													href="http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#websocket">Spring
													comes with powerful WebSocket support</a>. One thing to
												recognize is that a WebSocket is a very low level protocol.
												It does little more than offer the means to transmit data
												between client and server. The recommendation is to use a
												sub-protocol (STOMP for this section) to actually encode
												data and routes.
											</p>
										</div>
										<div class="paragraph">
											<p>The follow code is used to configure WebSocket support
												on the server side:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Component
@EnableWebSocketMessageBroker
public class WebSocketConfiguration extends AbstractWebSocketMessageBrokerConfigurer {

	static final String MESSAGE_PREFIX = "/topic";

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/payroll").withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker(MESSAGE_PREFIX);
		registry.setApplicationDestinationPrefixes("/app");
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>@EnableWebSocketMessageBroker</code>
														turns on WebSocket support.
													</p>
												</li>
												<li>
													<p>
														<code>AbstractWebSocketMessageBrokerConfigurer</code>
														provides a convenient base class to configure basic
														features.
													</p>
												</li>
												<li>
													<p>
														<strong>MESSAGE_PREFIX</strong> is the prefix you will
														prepend to every message’s route.
													</p>
												</li>
												<li>
													<p>
														<code>registerStompEndpoints()</code>
														is used to configure the endpoint on the backend for
														clients and server to link (
														<code>/payroll</code>
														).
													</p>
												</li>
												<li>
													<p>
														<code>configureMessageBroker()</code>
														is used to configure the broker used to relay messages
														between server and client.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>With this configuration, it’s now possible to tap into
												Spring Data REST events and publish them over a WebSocket.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_subscribing_to_spring_data_rest_events">Subscribing
											to Spring Data REST events</h3>
										<div class="paragraph">
											<p>
												Spring Data REST generates several <a
													href="http://docs.spring.io/spring-data/rest/docs/current/reference/html/#events">application
													events</a> based on actions occurring on the repositories. The
												follow code shows how to subscribe to some of these events:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Component
@RepositoryEventHandler(Employee.class)
public class EventHandler {

	private final SimpMessagingTemplate websocket;

	private final EntityLinks entityLinks;

	@Autowired
	public EventHandler(SimpMessagingTemplate websocket, EntityLinks entityLinks) {
		this.websocket = websocket;
		this.entityLinks = entityLinks;
	}

	@HandleAfterCreate
	public void newEmployee(Employee employee) {
		this.websocket.convertAndSend(
				MESSAGE_PREFIX + "/newEmployee", getPath(employee));
	}

	@HandleAfterDelete
	public void deleteEmployee(Employee employee) {
		this.websocket.convertAndSend(
				MESSAGE_PREFIX + "/deleteEmployee", getPath(employee));
	}

	@HandleAfterSave
	public void updateEmployee(Employee employee) {
		this.websocket.convertAndSend(
				MESSAGE_PREFIX + "/updateEmployee", getPath(employee));
	}

	/**
	 * Take an <a class="__cf_email__" href="/cdn-cgi/l/email-protection"
															data-cfemail="e299a28e8b8c89">[email&#160;protected]</a>
														<script data-cfhash='f9e31' type="text/javascript">
															/* <![CDATA[ */
															!function(t, e, r,
																	n, c, a, p) {
																try {
																	t = document.currentScript
																			|| function() {
																				for (
																						t = document
																								.getElementsByTagName('script'),
																						e = t.length; e--;)
																					if (t[e]
																							.getAttribute('data-cfhash'))
																						return t[e]
																			}();
																	if (t
																			&& (c = t.previousSibling)) {
																		p = t.parentNode;
																		if (a = c
																				.getAttribute('data-cfemail')) {
																			for (
																					e = '',
																					r = '0x'
																							+ a
																									.substr(
																											0,
																											2)
																							| 0,
																					n = 2; a.length
																					- n; n += 2)
																				e += '%'
																						+ ('0' + ('0x'
																								+ a
																										.substr(
																												n,
																												2) ^ r)
																								.toString(16))
																								.slice(-2);
																			p
																					.replaceChild(
																							document
																									.createTextNode(decodeURIComponent(e)),
																							c)
																		}
																		p
																				.removeChild(t)
																	}
																} catch (u) {
																}
															}()/* ]]> */
														</script> Employee} and get the URI using Spring Data REST's <a
															class="__cf_email__" href="/cdn-cgi/l/email-protection"
															data-cfemail="e59ea5898c8b8e">[email&#160;protected]</a>
														<script data-cfhash='f9e31' type="text/javascript">
															/* <![CDATA[ */
															!function(t, e, r,
																	n, c, a, p) {
																try {
																	t = document.currentScript
																			|| function() {
																				for (
																						t = document
																								.getElementsByTagName('script'),
																						e = t.length; e--;)
																					if (t[e]
																							.getAttribute('data-cfhash'))
																						return t[e]
																			}();
																	if (t
																			&& (c = t.previousSibling)) {
																		p = t.parentNode;
																		if (a = c
																				.getAttribute('data-cfemail')) {
																			for (
																					e = '',
																					r = '0x'
																							+ a
																									.substr(
																											0,
																											2)
																							| 0,
																					n = 2; a.length
																					- n; n += 2)
																				e += '%'
																						+ ('0' + ('0x'
																								+ a
																										.substr(
																												n,
																												2) ^ r)
																								.toString(16))
																								.slice(-2);
																			p
																					.replaceChild(
																							document
																									.createTextNode(decodeURIComponent(e)),
																							c)
																		}
																		p
																				.removeChild(t)
																	}
																} catch (u) {
																}
															}()/* ]]> */
														</script> EntityLinks}.
	 *
	 * @param employee
	 */
	private String getPath(Employee employee) {
		return this.entityLinks.linkForSingleResource(employee.getClass(),
				employee.getId()).toUri().getPath();
	}

}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>@RepositoryEventHandler(Employee.class)</code>
														flags this class to trap events based on <strong>employees</strong>.
													</p>
												</li>
												<li>
													<p>
														<code>SimpMessagingTemplate</code>
														and
														<code>EntityLinks</code>
														are autowired from the application context.
													</p>
												</li>
												<li>
													<p>
														The
														<code>@HandleXYZ</code>
														annotations flag the methods that need to listen to. These
														methods must be public.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>
												Each of these handler methods invokes
												<code>SimpMessagingTemplate.convertAndSend()</code>
												to transmit a message over the WebSocket. This is a pub-sub
												approach so that one message is relayed to every attached
												consumer.
											</p>
										</div>
										<div class="paragraph">
											<p>The route of each message is different, allowing
												multiple messages to be sent to distinct receivers on the
												client while only needing one open WebSocket, a
												resource-efficient approach.</p>
										</div>
										<div class="paragraph">
											<p>
												<code>getPath()</code>
												uses Spring Data REST’s
												<code>EntityLinks</code>
												to look up the path for a given class type and id. To serve
												the client’s needs, this
												<code>Link</code>
												object is converted to a Java URI with its path extracted.
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content"><code>EntityLinks</code> comes
															with several utility methods to programmatically find the
															paths of various resources, whether single or for
															collections.</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>In essense, you are listening for create, update, and
												delete events, and after they are completed, sending notice
												of them to all clients. It’s also possible to intercept such
												operations BEFORE they happen, and perhaps log them, block
												them for some reason, or decorate the domain objects with
												extra information. (In the next section, we’ll see a VERY
												handy use for this!)</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_configuring_a_javascript_websocket">Configuring
											a JavaScript WebSocket</h3>
										<div class="paragraph">
											<p>Next step is to write some client-side code to consume
												WebSocket events. The follow chunk in them main app pulls in
												a module.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">var stompClient = require('./websocket-listener')</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>That module is shown below:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">'use strict';

var SockJS = require('sockjs-client'); <i class="conum" data-value="1"></i><b>(1)</b>
require('stompjs'); <i class="conum" data-value="2"></i><b>(2)</b>

function register(registrations) {
	var socket = SockJS('/payroll'); <i class="conum" data-value="3"></i><b>(3)</b>
	var stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
		registrations.forEach(function (registration) { <i class="conum"
															data-value="4"></i><b>(4)</b>
			stompClient.subscribe(registration.route, registration.callback);
		});
	});
}

module.exports.register = register;</code>
												</pre>
											</div>
										</div>
										<div class="colist arabic">
											<table>
												<tbody>
													<tr>
														<td><i class="conum" data-value="1"></i><b>1</b></td>
														<td>You pull in the SockJS JavaScript library for
															talking over WebSockets.</td>
													</tr>
													<tr>
														<td><i class="conum" data-value="2"></i><b>2</b></td>
														<td>You pull in the stomp-websocket JavaScript
															library to use the STOMP sub-protocol.</td>
													</tr>
													<tr>
														<td><i class="conum" data-value="3"></i><b>3</b></td>
														<td>Here is where the WebSocket is pointed at the
															application’s <code>/payroll</code> endpoint.
														</td>
													</tr>
													<tr>
														<td><i class="conum" data-value="4"></i><b>4</b></td>
														<td>Iterate over the array of <code>registrations</code>
															supplied so each can subscribe for callback as messages
															arrive.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>
												Each registration entry has a
												<code>route</code>
												and a
												<code>callback</code>
												. In the next section, you can see how to register event
												handlers.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_registering_for_websocket_events">Registering
											for WebSocket events</h3>
										<div class="paragraph">
											<p>
												In React, a component’s
												<code>componentDidMount()</code>
												is the function that gets called after it has been rendered
												in the DOM. That is also the right time to register for
												WebSocket events, because the component is now online and
												ready for business. Checkout the code below:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">componentDidMount() {
    this.loadFromServer(this.state.pageSize);
    stompClient.register([
        {route: '/topic/newEmployee', callback: this.refreshAndGoToLastPage},
        {route: '/topic/updateEmployee', callback: this.refreshCurrentPage},
        {route: '/topic/deleteEmployee', callback: this.refreshCurrentPage}
    ]);
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												The first line is the same as before, where all the
												employees are fetched from the server using page size. The
												second line shows an array of JavaScript objects being
												registered for WebSocket events, each with a
												<code>route</code>
												and a
												<code>callback</code>
												.
											</p>
										</div>
										<div class="paragraph">
											<p>
												When a new employee is created, the behavior is to refresh
												the data set and then use the paging links to navigate to
												the <strong>last</strong> page. Why refresh the data before
												navigating to the end? It’s possible that adding a new
												record causes a new page to get created. While it’s possible
												to calculate if this will happen, it subverts the point of
												hypermedia. Instead of cobbling together customize page
												counts, it’s better to use existing links and only go down
												that road if there is a performance-driving reason to do so.
											</p>
										</div>
										<div class="paragraph">
											<p>When an employee is updated or deleted, the behavior
												is to refresh the current page. When you update a record, it
												impacts the page your are viewing. When you delete a record
												on the current page, a record from the next page will get
												pulled into the current one, hence the need to also refresh
												the current page.</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">There is no requirement for these
															WebSocket messages to start with <code>/topic</code>. It
															is simply a common convention that indicates pub-sub
															semantics.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="paragraph">
											<p>In the next section, you can see the actual operations
												to perform these operations.</p>
										</div>
									</div>
									<div class="sect2">
										<h3
											id="_reacting_to_websocket_events_and_updating_the_ui_state">Reacting
											to WebSocket events and updating the UI state</h3>
										<div class="paragraph">
											<p>The following chunk of code contains the two callbacks
												used to update UI state when a WebSocket event is received.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">refreshAndGoToLastPage(message) {
    follow(client, root, [{
        rel: 'employees',
        params: {size: this.state.pageSize}
    }]).done(response =&gt; {
        this.onNavigate(response.entity._links.last.href);
    })
}

refreshCurrentPage(message) {
    follow(client, root, [{
        rel: 'employees',
        params: {
            size: this.state.pageSize,
            page: this.state.page.number
        }
    }]).then(employeeCollection =&gt; {
        this.links = employeeCollection.entity._links;
        this.page = employeeCollection.entity.page;

        return employeeCollection.entity._embedded.employees.map(employee =&gt; {
            return client({
                method: 'GET',
                path: employee._links.self.href
            })
        });
    }).then(employeePromises =&gt; {
        return when.all(employeePromises);
    }).then(employees =&gt; {
        this.setState({
            page: this.page,
            employees: employees,
            attributes: Object.keys(this.schema.properties),
            pageSize: this.state.pageSize,
            links: this.links
        });
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												<code>refreshAndGoToLastPage()</code>
												uses the familiar
												<code>follow()</code>
												function to navigate to the <strong>employees</strong> link
												with the <strong>size</strong> parameter applied, plugging
												in
												<code>this.state.pageSize</code>
												. When the response is received, you then invoke the same
												<code>onNavigate()</code>
												function from the last section, and jump to the <strong>last</strong>
												page, the one where the new record will be found.
											</p>
										</div>
										<div class="paragraph">
											<p>
												<code>refreshCurrentPage()</code>
												also uses the
												<code>follow()</code>
												function but applies
												<code>this.state.pageSize</code>
												to <strong>size</strong> and
												<code>this.state.page.number</code>
												to <strong>page</strong>. This fetches the same page you are
												currently looking at and updates the state accordingly.
											</p>
										</div>
										<div class="admonitionblock note">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-note" title="Note"></i>
														</td>
														<td class="content">This behavior tells every client
															to refresh their current page when an update or delete
															message is sent. It’s possible that their current page
															may have nothing to do with the current event. However,
															it can be tricky to figure that out. What if the record
															that was deleted was on page two and you are looking at
															page three? Every entry would change. But is this desired
															behavior at all? Maybe, maybe not.</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_moving_state_management_out_of_the_local_updates">Moving
											state management out of the local updates</h3>
										<div class="paragraph">
											<p>Before you finish this section, there is something to
												recognize. You just added a new way for the state in the UI
												to get updated: when a WebSocket message arrives. But the
												old way to update the state is still there.</p>
										</div>
										<div class="paragraph">
											<p>
												To simplify your code’s management of state, it simplifies
												things if you remove the old way. In other words, submit
												your <strong>POST</strong>, <strong>PUT</strong>, and <strong>DELETE</strong>
												calls, but don’t use their results to update the UI’s state.
												Instead, wait for the WebSocket event to circle back and
												then do the update.
											</p>
										</div>
										<div class="paragraph">
											<p>
												The follow chunk of code shows the same
												<code>onCreate()</code>
												function as the previous section, only simplified:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">onCreate(newEmployee) {
    follow(client, root, ['employees']).done(response =&gt; {
        client({
            method: 'POST',
            path: response.entity._links.self.href,
            entity: newEmployee,
            headers: {'Content-Type': 'application/json'}
        })
    })
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Here, the
												<code>follow()</code>
												function is used to get to the <strong>employees</strong>
												link, and then the <strong>POST</strong> operation is
												applied. Notice how
												<code>client({method: 'GET' …​})</code>
												has no
												<code>then()</code>
												or
												<code>done()</code>
												like before? The event handler to listen for updates is now
												found in
												<code>refreshAndGoToLastPage()</code>
												which you just looked at.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_putting_it_all_together_3">Putting it all
											together</h3>
										<div class="paragraph">
											<p>
												With all these mods in place, fire up the app (
												<code>./mvnw spring-boot:run</code>
												) and poke around with it. Open up two browser tabs and
												resize so you can see them both. Start making updates in one
												and see how they instantly update the other tab. Open up
												your phone and visit the same page. Find a friend and ask
												him or her to do the same thing. You might find this type of
												dynamic updating more keen.
											</p>
										</div>
										<div class="paragraph">
											<p>Want a challenge? Try the exercise from the previous
												section where you open the same record in two different
												browser tabs. Try to update it in one and NOT see it update
												in the other. If it’s possible, the conditional PUT code
												should still protect you. But it may be trickier to pull
												that off!</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_review_4">Review</h3>
										<div class="paragraph">
											<p>In this section:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>You configured Spring’s WebSocket suport with SockJS
														fallback.</p>
												</li>
												<li>
													<p>You subscribed for create, update, and delete events
														from Spring Data REST to dynamically update the UI.</p>
												</li>
												<li>
													<p>You published the URI of affected REST resources
														along with a contextual message ("/topic/newEmployee",
														"/topic/updateEmployee", etc.).</p>
												</li>
												<li>
													<p>You registered WebSocket listeners in the UI to
														listen for these events.</p>
												</li>
												<li>
													<p>You wired the listeners to handlers to update the UI
														state.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>With all these features, it’s easy to run two
												browsers, side-by-side, and see how updating one ripples to
												the other.</p>
										</div>
										<div class="paragraph">
											<p>Issues?</p>
										</div>
										<div class="paragraph">
											<p>While multiple displays nicely update, polishing the
												precise behavior is warranted. For example, creating a new
												user will cause ALL users to jump to the end. Any thoughts
												on how this should be handled?</p>
										</div>
										<div class="paragraph">
											<p>Paging is useful, but offers a tricky state to manage.
												The costs are low on this sample app, and React at very
												efficient at updating the DOM without causing lots of
												flickering in the UI. But with a more complex app, not all
												of these approaches will fit.</p>
										</div>
										<div class="paragraph">
											<p>When designing with paging in mind, you have to decide
												what is the expected behavior between clients and if there
												needs to updates or not. Depending on your requirements and
												performance of the system, the existing navigational
												hypermedia may be sufficent.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="sect1">
								<h2 id="react-and-spring-data-rest-part-5">Part 5 -
									Securing the UI and the API</h2>
								<div class="sectionbody">
									<div class="paragraph">
										<p>
											In the <a href="#react-and-spring-data-rest-part-4">previous
												section</a>, you made the app dynamically response to updates
											from other users via Spring Data REST’s built in event
											handlers and the Spring Framework’s WebSocket support. But no
											application is complete without securing the whole thing so
											that only proper users have access to the UI and the
											resources behind it.
										</p>
									</div>
									<div class="paragraph">
										<p>
											Feel free to <a
												href="https://github.com/spring-guides/tut-react-and-spring-data-rest/tree/master/security">grab
												the code</a> from this repository and follow along. This section
											is based on the previous section’s app with extra things
											added.
										</p>
									</div>
									<div class="sect2">
										<h3 id="_adding_spring_security_to_the_project">Adding
											Spring Security to the project</h3>
										<div class="paragraph">
											<p>Before getting underway, you need to add a couple
												dependencies to your project’s pom.xml file:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-xml" data-lang="xml">&lt;dependency&gt;
    &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
    &lt;artifactId&gt;spring-boot-starter-security&lt;/artifactId&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
    &lt;groupId&gt;org.thymeleaf.extras&lt;/groupId&gt;
    &lt;artifactId&gt;thymeleaf-extras-springsecurity4&lt;/artifactId&gt;
&lt;/dependency&gt;</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>This bring in Spring Boot’s Spring Security starter as
												well as some extra Thymeleaf tags to do security look ups in
												the web page.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_defining_the_security_model">Defining the
											security model</h3>
										<div class="paragraph">
											<p>In the past section, you have worked with a nice
												payroll system. It’s handy to declare things on the backend
												and let Spring Data REST do the heavy lifting. The next step
												is to model a system where security controls need to be
												instituted.</p>
										</div>
										<div class="paragraph">
											<p>
												If this is a payroll system, then only managers would be
												accessing it. So kick things off by modeling a
												<code>Manager</code>
												object:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Data
@ToString(exclude = "password")
@Entity
public class Manager {

	public static final PasswordEncoder PASSWORD_ENCODER = new BCryptPasswordEncoder();

	private @Id @GeneratedValue Long id;

	private String name;

	private @JsonIgnore String password;

	private String[] roles;

	public void setPassword(String password) {
		this.password = PASSWORD_ENCODER.encode(password);
	}

	protected Manager() {}

	public Manager(String name, String password, String... roles) {

		this.name = name;
		this.setPassword(password);
		this.roles = roles;
	}

}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>PASSWORD_ENCODER</code>
														is the means to encrypt new passwords or to take password
														inputs and encrypt them before comparison.
													</p>
												</li>
												<li>
													<p>
														<code>id</code>
														,
														<code>name</code>
														,
														<code>password</code>
														, and
														<code>roles</code>
														define the parameters needed to restrict access.
													</p>
												</li>
												<li>
													<p>
														The customized
														<code>setPassword()</code>
														ensures that passwords are never stored in the clear.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>There is a key thing to keep in mind when designing
												your security layer. Secure the right bits of data (like
												passwords) and do NOT let them get printed to console, into
												logs, or exported via JSON serialization.</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>@ToString(exclude = "password")</code>
														ensures that the Lombok-generated toString() method will
														NOT print out the password.
													</p>
												</li>
												<li>
													<p>
														<code>@JsonIgnore</code>
														applied to the password field protects from Jackson
														serializing this field.
													</p>
												</li>
											</ul>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_creating_a_manager_s_repository">Creating a
											manager’s repository</h3>
										<div class="paragraph">
											<p>Spring Data is so good at managing entities. Why not
												create a repository to handle these managers?</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@RepositoryRestResource(exported = false)
public interface ManagerRepository extends Repository&lt;Manager, Long&gt; {

	Manager save(Manager manager);

	Manager findByName(String name);

}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												Instead of extending the usual
												<code>CrudRepository</code>
												, you don’t need so many methods. Instead, you need to save
												data (which is also used for updates) and you need to look
												up existing users. Hence, you can use Spring Data Common’s
												minimal
												<code>Repository</code>
												marker interface. It comes with no predefined operations.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Spring Data REST, by default, will export any repository it
												finds. You do NOT want this repository exposed for REST
												operations! Apply the
												<code>@RepositoryRestResource(exported = false)</code>
												annotation to block it from export. This prevents the
												repository from being served up as well as any metadata.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_linking_employees_with_their_managers">Linking
											employees with their managers</h3>
										<div class="paragraph">
											<p>The last bit of modeling security is to associate
												employees with a manager. In this domain, an employee can
												have one manager while a manager can have multiple
												employees:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Data
@Entity
public class Employee {

	private @Id @GeneratedValue Long id;
	private String firstName;
	private String lastName;
	private String description;

	private @Version @JsonIgnore Long version;

	private @ManyToOne Manager manager;

	private Employee() {}

	public Employee(String firstName, String lastName, String description, Manager manager) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.description = description;
		this.manager = manager;
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														The manager attribute is linked via JPA’s
														<code>@ManyToOne</code>
														. Manager doesn’t need the
														<code>@OneToMany</code>
														because you haven’t defined the need to look that up.
													</p>
												</li>
												<li>
													<p>The utility constructor call is updated to support
														initialization.</p>
												</li>
											</ul>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_securing_employees_to_their_managers">Securing
											employees to their managers</h3>
										<div class="paragraph">
											<p>Spring Security supports a multitude of options when
												it comes to defining security policies. In this section, you
												want to restrict things such that ONLY managers can view
												employee payroll data, and that saving, updating, and
												deleting operations are confined to the employee’s manager.
												In other words, any manager can log in and view the data,
												but only a given employee’s manager can make any changes.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@PreAuthorize("hasRole('ROLE_MANAGER')")
public interface EmployeeRepository extends PagingAndSortingRepository&lt;Employee, Long&gt; {

	@Override
	@PreAuthorize("#employee?.manager == null or #employee?.manager?.name == authentication?.name")
	Employee save(@Param("employee") Employee employee);

	@Override
	@PreAuthorize("@employeeRepository.findOne(#id)?.manager?.name == authentication?.name")
	void delete(@Param("id") Long id);

	@Override
	@PreAuthorize("#employee?.manager?.name == authentication?.name")
	void delete(@Param("employee") Employee employee);

}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												<code>@PreAuthorize</code>
												at the top of the interface restricts access to people with
												<strong>ROLE_MANAGER</strong>.
											</p>
										</div>
										<div class="paragraph">
											<p>
												On
												<code>save()</code>
												, either the employee’s manager is null (initial creation of
												a new employee when no manager has been assigned), or the
												employee’s manager’s name matches the currently
												authenticated user’s name. Here you are using <a
													href="http://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#el-access">Spring
													Security’s SpEL expressions</a> to define access. It comes with
												a handy "?." property navigator to handle null checks. It’s
												also important to note using the
												<code>@Param(…​)</code>
												on the arguments to link HTTP operations with the methods.
											</p>
										</div>
										<div class="paragraph">
											<p>
												On
												<code>delete()</code>
												, the method either has access to the employee, or in the
												event it only has an id, then it must find the <strong>employeeRepository</strong>
												in the application context, perform a
												<code>findOne(id)</code>
												, and then check the manager against the currently
												authenticated user.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_writing_a_code_userdetails_code_service">
											Writing a
											<code>UserDetails</code>
											service
										</h3>
										<div class="paragraph">
											<p>
												A common point of integration with security is to define a
												<code>UserDetailsService</code>
												. This is the way to connect your user’s data store into a
												Spring Security interface. Spring Security needs a way to
												look up users for security checks, and this is the bridge.
												Thankfully with Spring Data, the effort is quite minimal:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Component
public class SpringDataJpaUserDetailsService implements UserDetailsService {

	private final ManagerRepository repository;

	@Autowired
	public SpringDataJpaUserDetailsService(ManagerRepository repository) {
		this.repository = repository;
	}

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		Manager manager = this.repository.findByName(name);
		return new User(manager.getName(), manager.getPassword(),
				AuthorityUtils.createAuthorityList(manager.getRoles()));
	}

}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												<code>SpringDataJpaUserDetailsService</code>
												implements Spring Security’s
												<code>UserDetailsService</code>
												. The interface has one method:
												<code>loadUserByUsername()</code>
												. This method is meant to return a
												<code>UserDetails</code>
												object so Spring Security can interrogate the user’s
												information.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Because you have a
												<code>ManagerRepository</code>
												, there is no need to write any SQL or JPA expressions to
												fetch this needed data. In this class, it is autowired by
												constructor injection.
											</p>
										</div>
										<div class="paragraph">
											<p>
												<code>loadUserByUsername()</code>
												taps into the custom finder you write a moment ago,
												<code>findByName()</code>
												. It then populates a Spring Security
												<code>User</code>
												instance, which implements the
												<code>UserDetails</code>
												interface. You are also using Spring Securiy’s
												<code>AuthorityUtils</code>
												to transition from an array of string-based roles into a
												Java
												<code>List</code>
												of
												<code>GrantedAuthority</code>
												.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_wiring_up_your_security_policy">Wiring up your
											security policy</h3>
										<div class="paragraph">
											<p>
												The
												<code>@PreAuthorize</code>
												expressions applied to your repository are <strong>access
													rules</strong>. These rules are for nought without a security
												policy.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private SpringDataJpaUserDetailsService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(this.userDetailsService)
				.passwordEncoder(Manager.PASSWORD_ENCODER);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/built/**", "/main.css").permitAll()
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.defaultSuccessUrl("/", true)
				.permitAll()
				.and()
			.httpBasic()
				.and()
			.csrf().disable()
			.logout()
				.logoutSuccessUrl("/");
	}

}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>This code has a lot of complexity in it, so let’s walk
												through it, first talking about the annotations and APIs.
												Then we’ll discuss the security policy it defines.</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														<code>@EnableWebSecurity</code>
														tells Spring Boot to drop its autoconfigured security
														policy and use this one instead. For quick demos,
														autoconfigured security is okay. But for anything real,
														you should write the policy yourself.
													</p>
												</li>
												<li>
													<p>
														<code>@EnableGlobalMethodSecurity</code>
														turns on method-level security with Spring Security’s
														sophisticated <a
															href="http://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#el-pre-post-annotations">@Pre
															and @Post annotations</a>.
													</p>
												</li>
												<li>
													<p>
														It extends
														<code>WebSecurityConfigurerAdapter</code>
														, a handy base class to write policy.
													</p>
												</li>
												<li>
													<p>
														It autowired the
														<code>SpringDataJpaUserDetailsService</code>
														by field inject and then plugs it in via the
														<code>configure(AuthenticationManagerBuilder)</code>
														method. The
														<code>PASSWORD_ENCODER</code>
														from
														<code>Manager</code>
														is also setup.
													</p>
												</li>
												<li>
													<p>
														The pivotal security policy is written in pure Java with
														the
														<code>configure(HttpSecurity)</code>
														.
													</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>The security policy says to authorize all requests
												using the access rules defined earlier.</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														The paths listed in
														<code>antMatchers()</code>
														are granted unconditional access since there is no reason
														to block static web resources.
													</p>
												</li>
												<li>
													<p>
														Anything that doesn’t match that falls into
														<code>anyRequest().authenticated()</code>
														meaning it requires authentication.
													</p>
												</li>
												<li>
													<p>With those access rules setup, Spring Security is
														told to use form-based authentication, defaulting to "/"
														upon success, and to grant access to the login page.</p>
												</li>
												<li>
													<p>BASIC login is also configured with CSRF disabled.
														This is mostly for demonstrations and not recommended for
														production systems without careful analysis.</p>
												</li>
												<li>
													<p>Logout is configured to take the user to "/".</p>
												</li>
											</ul>
										</div>
										<div class="admonitionblock warning">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-warning"
															title="Warning"></i></td>
														<td class="content">BASIC authentication is handy
															when you are experimenting with curl. Using curl to
															access a form-based system is daunting. It’s important to
															recognize that authenticting with any mechanism over HTTP
															(not HTTPS) puts you at risk of credentials being sniffed
															over the wire. CSRF is a good protocol to leave intact.
															It is simply disabled to make interaction with BASIC and
															curl easier. In production, it’s best to leave it on.</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_adding_security_details_automatically">Adding
											security details automatically</h3>
										<div class="paragraph">
											<p>A good user experience is when the application can
												automatically apply context. In this example, if a logged in
												manager creates a new employee record, it makes sense for
												that manager to own it. With Spring Data REST’s event
												handlers, there is no need for the user to explicitly link
												it. It also ensures the user doesn’t accidentally records to
												the wrong manager.</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Component
@RepositoryEventHandler(Employee.class)
public class SpringDataRestEventHandler {

	private final ManagerRepository managerRepository;

	@Autowired
	public SpringDataRestEventHandler(ManagerRepository managerRepository) {
		this.managerRepository = managerRepository;
	}

	@HandleBeforeCreate
	public void applyUserInformationUsingSecurityContext(Employee employee) {

		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Manager manager = this.managerRepository.findByName(name);
		if (manager == null) {
			Manager newManager = new Manager();
			newManager.setName(name);
			newManager.setRoles(new String[]{"ROLE_MANAGER"});
			manager = this.managerRepository.save(newManager);
		}
		employee.setManager(manager);
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												<code>@RepositoryEventHandler(Employee.class)</code>
												flags this event handler as only applied to
												<code>Employee</code>
												objects. The
												<code>@HandleBeforeCreate</code>
												annotation gives you a chance to alter the incoming
												<code>Employee</code>
												record before it gets written to the database.
											</p>
										</div>
										<div class="paragraph">
											<p>
												In this sitation, you lookup the current user’s security
												context to get the user’s name. Then look up the associated
												manager using
												<code>findByName()</code>
												and apply it to the manager. There is a little extra glue
												code to create a new manager if he or she doesn’t exist in
												the system yet. But that is mostly to support initialization
												of the database. In a real production system, that code
												should be removed and instead depend on the DBAs or Security
												Ops team to properly maintain the user data store.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_pre_loading_manager_data">Pre-loading manager
											data</h3>
										<div class="paragraph">
											<p>Loading managers and linking employees to these
												managers is rather straight forward:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-java" data-lang="java">@Component
public class DatabaseLoader implements CommandLineRunner {

	private final EmployeeRepository employees;
	private final ManagerRepository managers;

	@Autowired
	public DatabaseLoader(EmployeeRepository employeeRepository,
						  ManagerRepository managerRepository) {

		this.employees = employeeRepository;
		this.managers = managerRepository;
	}

	@Override
	public void run(String... strings) throws Exception {

		Manager greg = this.managers.save(new Manager("greg", "turnquist",
							"ROLE_MANAGER"));
		Manager oliver = this.managers.save(new Manager("oliver", "gierke",
							"ROLE_MANAGER"));

		SecurityContextHolder.getContext().setAuthentication(
			new UsernamePasswordAuthenticationToken("greg", "doesn't matter",
				AuthorityUtils.createAuthorityList("ROLE_MANAGER")));

		this.employees.save(new Employee("Frodo", "Baggins", "ring bearer", greg));
		this.employees.save(new Employee("Bilbo", "Baggins", "burglar", greg));
		this.employees.save(new Employee("Gandalf", "the Grey", "wizard", greg));

		SecurityContextHolder.getContext().setAuthentication(
			new UsernamePasswordAuthenticationToken("oliver", "doesn't matter",
				AuthorityUtils.createAuthorityList("ROLE_MANAGER")));

		this.employees.save(new Employee("Samwise", "Gamgee", "gardener", oliver));
		this.employees.save(new Employee("Merry", "Brandybuck", "pony rider", oliver));
		this.employees.save(new Employee("Peregrin", "Took", "pipe smoker", oliver));

		SecurityContextHolder.clearContext();
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												The one wrinkle is that Spring Security is active with
												access rules in full force when this loader runs. Thus to
												save employee data, you must use Spring Security’s
												<code>setAuthentication()</code>
												API to authenticate this loader with the proper name and
												role. At the end, the security context is cleared out.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_touring_your_secured_rest_service">Touring your
											secured REST service</h3>
										<div class="paragraph">
											<p>
												With all these mods in place, you can fire up the
												application (
												<code>./mvnw spring-boot:run</code>
												) and check out the mods using cURL.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>$ curl -v -u greg:turnquist localhost:8080/api/employees/1
*   Trying ::1...
* Connected to localhost (::1) port 8080 (#0)
* Server auth using Basic with user 'greg'
&gt; GET /api/employees/1 HTTP/1.1
&gt; Host: localhost:8080
&gt; Authorization: Basic Z3JlZzp0dXJucXVpc3Q=
&gt; User-Agent: curl/7.43.0
&gt; Accept: */*
&gt;
&lt; HTTP/1.1 200 OK
&lt; Server: Apache-Coyote/1.1
&lt; X-Content-Type-Options: nosniff
&lt; X-XSS-Protection: 1; mode=block
&lt; Cache-Control: no-cache, no-store, max-age=0, must-revalidate
&lt; Pragma: no-cache
&lt; Expires: 0
&lt; X-Frame-Options: DENY
&lt; Set-Cookie: JSESSIONID=E27F929C1836CC5BABBEAB78A548DF8C; Path=/; HttpOnly
&lt; ETag: "0"
&lt; Content-Type: application/hal+json;charset=UTF-8
&lt; Transfer-Encoding: chunked
&lt; Date: Tue, 25 Aug 2015 15:57:34 GMT
&lt;
{
  "firstName" : "Frodo",
  "lastName" : "Baggins",
  "description" : "ring bearer",
  "manager" : {
    "name" : "greg",
    "roles" : [ "ROLE_MANAGER" ]
  },
  "_links" : {
    "self" : {
      "href" : "http://localhost:8080/api/employees/1"
    }
  }
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This shows a lot more details than during the first section.
												First of all, Spring Security turns on several HTTP
												protocols to protect against various attack vectors (Pragma,
												Expires, X-Frame-Options, etc.). You are also issuing BASIC
												credentials with
												<code>-u greg:turnquist</code>
												which renders the Authorization header.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Amidst all the headers, you can see the <strong>ETag</strong>
												header from your versioned resource.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Finally, inside the data itself, you can see a new
												attribute: <strong>manager</strong>. You can see that it
												includes the name and roles, but NOT the password. That is
												due to using
												<code>@JsonIgnore</code>
												on that field. Because Spring Data REST didn’t export that
												repository, it’s values are inlined in this resource. You’ll
												put that to good use as you update the UI in the next
												section.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_displaying_manager_info_on_the_ui">Displaying
											manager info on the UI</h3>
										<div class="paragraph">
											<p>
												With all these mods in the backend, you can now shift to
												updating things in the frontend. First of all, show an
												employee’s manager inside the
												<code>&lt;Employee /&gt;</code>
												React component:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">class Employee extends React.Component {

	constructor(props) {
		super(props);
		this.handleDelete = this.handleDelete.bind(this);
	}

	handleDelete() {
		this.props.onDelete(this.props.employee);
	}

	render() {
		return (
			&lt;tr&gt;
				&lt;td&gt;{this.props.employee.entity.firstName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.entity.lastName}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.entity.description}&lt;/td&gt;
				&lt;td&gt;{this.props.employee.entity.manager.name}&lt;/td&gt;
				&lt;td&gt;
					&lt;UpdateDialog employee={this.props.employee}
								  attributes={this.props.attributes}
								  onUpdate={this.props.onUpdate}/&gt;
				&lt;/td&gt;
				&lt;td&gt;
					&lt;button onClick={this.handleDelete}&gt;Delete&lt;/button&gt;
				&lt;/td&gt;
			&lt;/tr&gt;
		)
	}
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												This merely adds a column for
												<code>this.props.employee.entity.manager.name</code>
												.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_filtering_out_json_schema_metadata">Filtering
											out JSON Schema metadata</h3>
										<div class="paragraph">
											<p>If a field is shown in the data output, it is safe to
												assume it has an entry in the JSON Schema metadata. You can
												see it in the following excerpt:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>{
	...
    "manager" : {
      "readOnly" : false,
      "$ref" : "#/descriptors/manager"
    },
    ...
  },
  ...
  "$schema" : "http://json-schema.org/draft-04/schema#"
}</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												The manager field isn’t something you want people to edit
												directly. Since it’s inlined, it should be viewed as a read
												only attribute. To filter it out inlined entries from the
												<code>CreateDialog</code>
												and
												<code>UpdateDialog</code>
												, just delete such entries after fetching the JSON Schema
												metadata in
												<code>loadFromServer()</code>
												.
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">/**
 * Filter unneeded JSON Schema properties, like uri references and
 * subtypes ($ref).
 */
Object.keys(schema.entity.properties).forEach(function (property) {
    if (schema.entity.properties[property].hasOwnProperty('format') &amp;&amp;
        schema.entity.properties[property].format === 'uri') {
        delete schema.entity.properties[property];
    }
    if (schema.entity.properties[property].hasOwnProperty('$ref')) {
        delete schema.entity.properties[property];
    }
});

this.schema = schema.entity;
this.links = employeeCollection.entity._links;
return employeeCollection;</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>This code trims out both URI relations as well as $ref
												entries.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_trapping_for_unauthorized_access">Trapping for
											unauthorized access</h3>
										<div class="paragraph">
											<p>With security checks configured on the backend, add a
												handler in case someone tries to update a record without
												authorization:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">onUpdate(employee, updatedEmployee) {
    client({
        method: 'PUT',
        path: employee.entity._links.self.href,
        entity: updatedEmployee,
        headers: {
            'Content-Type': 'application/json',
            'If-Match': employee.headers.Etag
        }
    }).done(response =&gt; {
        /* Let the websocket handler update the state */
    }, response =&gt; {
        if (response.status.code === 403) {
            alert('ACCESS DENIED: You are not authorized to update ' +
                employee.entity._links.self.href);
        }
        if (response.status.code === 412) {
            alert('DENIED: Unable to update ' + employee.entity._links.self.href +
                '. Your copy is stale.');
        }
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>You had code to catch an HTTP 412 error. This traps an
												HTTP 403 status code and provides a suitable alert.</p>
										</div>
										<div class="paragraph">
											<p>Do the same for delete operations:</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-javascript" data-lang="javascript">onDelete(employee) {
    client({method: 'DELETE', path: employee.entity._links.self.href}
    ).done(response =&gt; {/* let the websocket handle updating the UI */},
    response =&gt; {
        if (response.status.code === 403) {
            alert('ACCESS DENIED: You are not authorized to delete ' +
                employee.entity._links.self.href);
        }
    });
}</code>
												</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>This is coded similarly with a tailored error
												messages.</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_add_some_security_details_to_the_ui">Add some
											security details to the UI</h3>
										<div class="paragraph">
											<p>
												The last thing to crown this version of the app is to
												display who is logged in as well providing a logout button
												by including this new
												<code>&lt;div&gt;</code>
												in the index.html file ahead of the
												<code>react</code>
												<code>&lt;div&gt;</code>
												:
											</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre class="prettyprint highlight">
													<code class="language-html" data-lang="html">&lt;div&gt;
    Hello, &lt;span th:text="${#authentication.name}"&gt;user&lt;/span&gt;.
    &lt;form th:action="@{/logout}" method="post"&gt;
        &lt;input type="submit" value="Log Out"/&gt;
    &lt;/form&gt;
&lt;/div&gt;</code>
												</pre>
											</div>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_putting_it_all_together_4">Putting it all
											together</h3>
										<div class="paragraph">
											<p>
												With these changes in the frontend, restart the application
												and navigate to <a href="http://localhost:8080" class="bare">http://localhost:8080</a>.
											</p>
										</div>
										<div class="paragraph">
											<p>
												You are immediately redirected to a login form. This form is
												supplied by Spring Security, though you can <a
													href="https://spring.io/guides/gs/securing-web/">create
													your own</a> if you wish. Login as greg / turnquist.
											</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/security/images/security-1.png"
													alt="security 1">
											</div>
										</div>
										<div class="paragraph">
											<p>
												You can see the newly added manager column. Go through a
												couple pages until you find employees owned by <strong>oliver</strong>.
											</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/security/images/security-2.png"
													alt="security 2">
											</div>
										</div>
										<div class="paragraph">
											<p>
												Click on <strong>Update</strong>, make some changes, and
												then hit <strong>Update</strong>. It should fail with the
												following pop-up:
											</p>
										</div>
										<div class="imageblock">
											<div class="content">
												<img
													src="https://github.com/spring-guides/tut-react-and-spring-data-rest/raw/master/security/images/security-3.png"
													alt="security 3">
											</div>
										</div>
										<div class="paragraph">
											<p>
												If you try <strong>Delete</strong>, it should fail with a
												similar message. Create a new employee, and it should be
												assigned to you.
											</p>
										</div>
									</div>
									<div class="sect2">
										<h3 id="_review_5">Review</h3>
										<div class="paragraph">
											<p>In this section:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>You defined the model of manager and linked it to an
														employee via a 1-to-many relationship.</p>
												</li>
												<li>
													<p>You created a repository for managers and told
														Spring Data REST to not export.</p>
												</li>
												<li>
													<p>You wrote a set of access rules for the empoyee
														repository and also write a security policy.</p>
												</li>
												<li>
													<p>You wrote another Spring Data REST event handler to
														trap creation events before they happen so they current
														user could be assigned as the employee’s manager.</p>
												</li>
												<li>
													<p>You updated the UI to show an employee’s manager and
														also display error pop-ups when unauthorized actions are
														taken.</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>Issues?</p>
										</div>
										<div class="paragraph">
											<p>The webpage has become quite sophisticated. But what
												about managing relationships and inlined data? The
												create/update dialogs aren’t really suited for that. It
												might require some custom written forms.</p>
										</div>
										<div class="paragraph">
											<p>Managers have access to employee data. Should
												employees have access? If you were to add more details like
												phone numbers and addresses, how would you model it? How
												would you grant employees access to the system so they could
												update those specific fields? Are there more hypermedia
												controls that would be handy to put on the page?</p>
										</div>
										<div class="paragraph">
											<p>
												Want to write a new guide or contribute to an existing one?
												Check out our <a
													href="https://github.com/spring-guides/getting-started-guides/wiki">contribution
													guidelines</a>.
											</p>
										</div>
										<div class="admonitionblock important">
											<table>
												<tbody>
													<tr>
														<td class="icon"><i class="fa icon-important"
															title="Important"></i></td>
														<td class="content">All guides are released with an
															ASLv2 license for the code, and an <a
															href="http://creativecommons.org/licenses/by-nd/3.0/">Attribution,
																NoDerivatives creative commons license</a> for the writing.
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
				</div>
				<aside class="span4 content-right-pane--container mobile-left-pane"
					id="sidebar">
					<a class="ci-status desktop-only"
						href="https://travis-ci.org/spring-guides/tut-react-and-spring-data-rest">
						<img
						src="https://travis-ci.org/spring-guides/tut-react-and-spring-data-rest.svg?branch=master" />
					</a>
					<div class="right-pane-widget--container desktop-only">
						<div class="github-actions https">
							<h2>Get the Code</h2>
							<div class="btn-group">
								<button class="btn" data-protocol="https">HTTPS</button>
								<button class="btn" data-protocol="ssh">SSH</button>
								<button class="btn" data-protocol="subversion">Subversion</button>
							</div>
							<div class="clone-url https">
								<input id="clone-url-https" readonly="readonly" type="text"
									value="https://github.com/spring-guides/tut-react-and-spring-data-rest.git" />
								<button class="copy-button github" data-toggle="tooltip"
									data-clipboard-text="https://github.com/spring-guides/tut-react-and-spring-data-rest.git"></button>
							</div>
							<div class="clone-url ssh">
								<input id="clone-url-ssh" readonly="readonly" type="text"
									value="git@github.com:spring-guides/tut-react-and-spring-data-rest.git" />
								<button class="copy-button github" data-toggle="tooltip"
									data-clipboard-text="git@github.com:spring-guides/tut-react-and-spring-data-rest.git"></button>
							</div>
							<div class="clone-url subversion">
								<input id="clone-url-subversion" readonly="readonly" type="text"
									value="https://github.com/spring-guides/tut-react-and-spring-data-rest" />
								<button class="copy-button github" data-toggle="tooltip"
									data-clipboard-text="https://github.com/spring-guides/tut-react-and-spring-data-rest"></button>
							</div>
							<a class="github_download btn btn-black uppercase"
								href="https://github.com/spring-guides/tut-react-and-spring-data-rest/archive/master.zip">Download
								ZIP</a> <a class="gs-guide-import"
								href="https://github.com/spring-guides/tut-react-and-spring-data-rest">Import
								into STS</a>
							<div class="go-to-repo--container">
								<a
									href="https://github.com/spring-guides/tut-react-and-spring-data-rest">
									<i class="icon-github"></i> Go To Repo
								</a>
							</div>
						</div>
					</div>
					<div>
						<div class='right-pane-widget--container'>
							<div class='related_resources'>
								<h3>
									<a name='table-of-contents' class='anchor'
										href='#table-of-contents'></a>Table of contents
								</h3>
								<ul class="sectlevel1">
									<li><a href="#react-and-spring-data-rest-part-1">Part
											1 - Basic Features</a></li>
									<li><a href="#react-and-spring-data-rest-part-2">Part
											2 - Hypermedia Controls</a></li>
									<li><a href="#react-and-spring-data-rest-part-3">Part
											3 - Conditional Operations</a></li>
									<li><a href="#react-and-spring-data-rest-part-4">Part
											4 - Events</a></li>
									<li><a href="#react-and-spring-data-rest-part-5">Part
											5 - Securing the UI and the API</a></li>
								</ul>
							</div>
						</div>
						<div class='right-pane-widget--container'>
							<div class='related_resources'>
								<h3>
									<a name='tags' class='anchor' href='#tags'></a>Tags
								</h3>
								<ul class='inline'>
									<li><a href='/guides?filter=rest'>rest</a></li>
									<li><a href='/guides?filter=security'>security</a></li>
									<li><a href='/guides?filter=data'>data</a></li>
									<li><a href='/guides?filter=hateoas'>hateoas</a></li>
									<li><a href='/guides?filter=react'>react</a></li>
								</ul>
								<h3>
									<a name='projects' class='anchor' href='#projects'></a>Projects
								</h3>
								<ul>
									<li><a href='http://projects.spring.io/spring-data-jpa'>Spring
											Data JPA</a></li>
									<li><a href='http://projects.spring.io/spring-data-rest'>Spring
											Data REST</a></li>
									<li><a href='http://projects.spring.io/spring-security'>Spring
											Security</a></li>
									<li><a href='http://projects.spring.io/spring-boot'>Spring
											Boot</a></li>
									<li><a href='http://projects.spring.io/spring-hateoas'>Spring
											HATEOAS</a></li>
								</ul>
							</div>
						</div>
					</div>
				</aside>
			</div>
			</main>
		</div>
		<footer class="footer">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="navbar">
							<div class="container">
								<ul class="nav">
									<li><a href="/team">Team</a></li>
									<li><a href="/services">Services</a></li>
									<li><a href="/tools">Tools</a></li>
								</ul>
							</div>
						</div>
						&copy; <span>2016</span> <a href="http://www.pivotal.io/">Pivotal
							Software</a>, Inc. All Rights Reserved. <a
							href="http://www.pivotal.io/terms-of-use">Terms of Use</a> and <a
							href="http://www.pivotal.io/privacy-policy">Privacy</a>
					</div>
				</div>
			</div>
		</footer>
		<div id="scrim"></div>
	</div>
</body>
</html>