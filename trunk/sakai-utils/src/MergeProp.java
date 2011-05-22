import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class MergeProp {
	private static void merge(String path1, String path2, boolean backup,
			boolean refFirst, boolean comment) {
		if (backup) {
			backup(path1);
		}
		Properties p = getMergedProp(path1, path2, refFirst, comment);
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
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
		}

	}

	private static void backup(String path1) {
		FileInputStream fisbak = null;
		FileOutputStream bak = null;
		try {
			fisbak = new FileInputStream(path1);
			bak = new FileOutputStream(path1 + "-bak");
			byte[] buffer = new byte[2097152];
			while (true) {
				int ins = fisbak.read(buffer);
				if (ins != -1) {
					bak.write(buffer, 0, ins);
				} else {
					break;
				}
			}
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
			if (bak != null) {
				try {
					bak.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
		}
	}

	private static Properties getMergedProp(String path1, String path2,
			boolean refFirst, boolean comment) {
		Properties p1 = new Properties();
		Properties p2 = new Properties();
		FileInputStream fis1 = null, fis2 = null;
		try {
			fis1 = new FileInputStream(path1);
			fis2 = new FileInputStream(path2);
			p1.load(fis1);
			p2.load(fis2);
			if (refFirst) {
				for (Object o1 : p1.keySet()) {
					String k1 = (String) o1;
					if (!p2.containsKey(k1)) {
						p2.setProperty(k1, p1.getProperty(k1));
					} else {
						String v1 = p1.getProperty(k1).trim();
						String v2 = p2.getProperty(k1).trim();
						if (!v1.equals(v2)) {
							if (comment) {
								p2.setProperty(k1, v1 + "   ###  " + v2);
							} else {
								p2.setProperty(k1, v1);
							}
						}
					}
				}
				return p2;
			} else {
				for (Object o2 : p2.keySet()) {
					String k2 = (String) o2;
					if (!p1.containsKey(k2)) {
						p1.setProperty(k2, p2.getProperty(k2));
					} else {
						String v1 = p1.getProperty(k2).trim();
						String v2 = p2.getProperty(k2).trim();
						if (!v1.equals(v2)) {
							if (comment) {
								p1.setProperty(k2, v2 + "   ###  " + v1);
							} else {
								p1.setProperty(k2, v2);
							}
						}
					}
				}
				return p1;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
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

	private static void usage() {
		System.err.println("使用方法： 在命令行运行 java MergeProp [-fbc] 资源文件1 资源文件2");
		System.err.println("合并之后的内容将写入 资源文件1 中。");
		System.err.println("-f 使用第一个资源文件作为主要参考；");
		System.err.println("-b 备份第一个资源文件，将产生一个xxx.properties-bak文件；");
		System.err
				.println("-c 将被覆盖的值作为注释写入资源文件中，会在行尾追加\"\\#\\#\\#原内容\",此内容不能被java正确处理，需手工替换将其处理成注释。");
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		boolean backup = false;
		boolean refFirst = false;
		boolean comment = false;
		String path1 = null, path2 = null;
		if (args.length == 2) {
			if (args[0].trim().startsWith("-")) {
				usage();
				return;
			} else {
				path1 = args[0].trim();
				path2 = args[1].trim();
			}
		} else if (args.length == 3) {
			if (!args[0].trim().startsWith("-")) {
				usage();
				return;
			} else {
				path1 = args[1].trim();
				path2 = args[2].trim();
				String flag = args[0].trim();
				if (flag.toLowerCase().indexOf('b') != -1) {
					backup = true;
				}
				if (flag.toLowerCase().indexOf('f') != -1) {
					refFirst = true;
				}
				if (flag.toLowerCase().indexOf('c') != -1) {
					comment = true;
				}
			}
		} else {
			usage();
			return;
		}
		File f = new File(path1);
		if (!f.exists() || f.isDirectory()) {
			System.err.println("资源文件1不存在");
			return;
		}
		f = new File(path2);
		if (!f.exists() || f.isDirectory()) {
			System.err.println("资源文件2不存在");
			return;
		}
		merge(path1, path2, backup, refFirst, comment);
		// for test
		// merge("/home/lijt/workspace/sakai/sakai-utils/test/1.properties",
		// "/home/lijt/workspace/sakai/sakai-utils/test/2.properties");
	}

}
