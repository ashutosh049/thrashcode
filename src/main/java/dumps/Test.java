package dumps;

public class Test {
public static void main(String[] args) {
	String artcle_brf_desc = "JavaIO is an API that comes with ioJavawhich is targeted at reading and writing data (input and output). "
			+ "Most applications need to process some input and produce some output based on that input. "
			+ "For instance, read data from a file or over network, and write to a file or write a response "
			+ "back over the network.The Java IO API is located in the Java IO package (java.io). If you look at the Java IO "
			+ "classes in the java.io package the vast amount of choices can be rather confusing. What is the purpose of all these classes? "
			+ "Which one should you choose for a given task? How do you create your own classes to plugin? etc. The purpose of this tutorial "
			+ "is to try to give you an overview of how all these classes are grouped, and the purpose behind them, so you don't have to wonder "
			+ "whether you chose the right class, or whether a class already exists for your purpose";

	String findWithTag = "Java";
	
	if(findWithTag!=""){
		int index = artcle_brf_desc.indexOf(findWithTag);
		while(index>=0){
			int len = findWithTag.length();
			String before = artcle_brf_desc.substring(0,index);
			String highlighted = "|"+findWithTag+"|";
			String after = artcle_brf_desc.substring(index+len);
			artcle_brf_desc = before+highlighted+after;
			index = artcle_brf_desc.indexOf(findWithTag,index+len);
		}
	}
	
	System.out.println(artcle_brf_desc);

}
}
