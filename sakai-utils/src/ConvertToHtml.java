/**
 * 
 */

/**
 * @author lijt
 *
 */
public class ConvertToHtml {

	/**
	 * 
	 */
	public ConvertToHtml() {
	}
	private static String convert(String src){
		StringBuilder target = new StringBuilder();
		for(int i = 0;i<src.length();i++){
			target.append("&#");
			target.append(src.codePointAt(i));
			target.append(";");
		}
		return target.toString();
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		if(args.length<1){
			System.err.println("使用方法： 在命令行运行 java ConvertToHtml 预转换的字符串[,预转换的字符串2...]");
			return;
		}
		for(String s:args){
			System.out.println(s+":\n");
			System.out.println(convert(s)+"\n\n\n");
		}
		
	}

}
