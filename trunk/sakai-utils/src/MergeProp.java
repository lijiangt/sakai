import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class MergeProp {
	private static void merge(String path1, String path2) {
		Properties p = getMergedProp(path1,path2);
		FileOutputStream out = null;
		try {
			out = new FileOutputStream(path1);
			p.store(out, "writed by MergeProp");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally{
			if(out != null){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
		}
		

	}

	
	private static Properties getMergedProp(String path1, String path2){
		Properties p1 = new Properties();
		Properties p2 = new Properties();
		FileInputStream fisbak = null, fis1 = null, fis2 = null;
		FileOutputStream bak = null;
		try {
			fis1 = new FileInputStream(path1);
			fis2 = new FileInputStream(path2);
			fisbak = new FileInputStream(path1);
			bak = new FileOutputStream(path1 + "-bak");
			byte[] buffer = new byte[2097152];
			while (true) {
				int ins = fisbak.read(buffer);
				if (ins != -1) {
					bak.write(buffer, 0, ins);
				}else{
					break;
				}
			}
//			fis1.reset();
			p1.load(fis1);
			p2.load(fis2);
			for (Object o2 : p2.keySet()) {
				String k2 = (String) o2;
				if (!p1.containsKey(k2)) {
					p1.setProperty(k2, p2.getProperty(k2));
				} else {
					String v1 = p1.getProperty(k2).trim();
					String v2 = p2.getProperty(k2).trim();
					if (!v1.equals(v2)) {
						p1.setProperty(k2, v2 + "   ###  " + v1);
					}
				}
			}
			return p1;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			if (fisbak != null) {
				try {
					fisbak.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
			if(bak != null){
				try {
					bak.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
			if (fis1 != null) {
				try {
					fis1.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
			if (fis2 != null) {
				try {
					fis2.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		if (args.length != 2) {
//			System.err.println("使用方法： 在命令行运行 java MergeProp 资源文件 主要参考资源文件");
//			return;
//		} else {
//			File f = new File(args[0]);
//			if (!f.exists() || f.isDirectory()) {
//				System.err.println("资源文件不存在");
//				return;
//			}
//			f = new File(args[1]);
//			if (!f.exists() || f.isDirectory()) {
//				System.err.println("主要参考资源文件不存在");
//				return;
//			}
//		}
//		merge(args[0], args[1]);
		merge("/home/lijt/workspace/sakai/sakai-utils/test/1.properties",  "/home/lijt/workspace/sakai/sakai-utils/test/2.properties");
	}

}
