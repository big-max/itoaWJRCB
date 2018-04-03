package com.ibm.automation.core.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.POIXMLException;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel 导入功能
 * 
 * @author lyq 20150312
 * @version 1.0
 */
public class ExcelUtils {

	public List<Object[]> importExcel(String filePath,InputStream stream) throws Exception {
		List<Object[]> list = new ArrayList<Object[]>();
		String fileType = filePath.substring(filePath.lastIndexOf(".") + 1);
		try {
			if ("xls".equalsIgnoreCase(fileType)) {
				list = importExcel03(filePath,stream);
			} else {
				list = importExcel07(filePath,stream);
			}
		} catch (OfficeXmlFileException e) {// 通过手动修改文件名 引起的异常 比如 3.xlsx 重命名
											// 3.xls 其实际文件类型为xlsx
			list = importExcel07(filePath,stream);
		} catch (POIXMLException e) {// 通过手动修改文件名 引起的异常 比如 3.xls 重命名 3.xlsx
										// 其实际文件类型为xls
			list = importExcel03(filePath,stream);
		}
		return list;
	}

	public List<Object[]> importExcel03(String filePath,InputStream stream) throws IOException {
		//FileInputStream in = new FileInputStream(filePath);
		InputStream in = stream;
		List<Object[]> list = new ArrayList<Object[]>();
		HSSFWorkbook wb = new HSSFWorkbook(in);
		HSSFSheet sheet = wb.getSheetAt(0);
		int rows = sheet.getPhysicalNumberOfRows();
		HSSFRow row = sheet.getRow(0);
		int cells = row.getLastCellNum();
		Object[] csr = null;
		for (int i = 1; i < rows; i++) {
			row = sheet.getRow(i);
			csr = new String[cells];
			for (int j = 0; j < cells; j++) {
				HSSFCell cell = row.getCell(j);
				Object obj = null;
				if (cell != null) {
					obj = getValue(cell);
				}
				csr[j] = obj;
			}
			list.add(csr);
		}
		if (in != null)
			in.close();
		return list;
	}

	public List<Object[]> importExcel07(String filePath,InputStream stream) throws IOException {
		List<Object[]> list = new ArrayList<Object[]>();
		InputStream in = stream;
		XSSFWorkbook wb = new XSSFWorkbook(in);
		XSSFSheet sheet = wb.getSheetAt(0);
		//int rows = sheet.getPhysicalNumberOfRows();获取的非空行的数量，需要的时候所有的数量
		int rows = sheet.getLastRowNum();
		XSSFRow row = sheet.getRow(0);
		int cells = row.getLastCellNum();
		Object[] csr = null;
		for (int i = 1; i <= rows; i++) {
			row = sheet.getRow(i);
			csr = new String[cells];
			if (row != null) {
				for (int j = 0; j < cells; j++) {
					XSSFCell cell = row.getCell(j);
					Object obj = null;
					if (cell != null) {
						obj = getValue(cell);
					}
					csr[j] = obj;
				}
				list.add(csr);
			} 

		}
		if (in != null)
			in.close();
		return list;
	}

	@SuppressWarnings("static-access")
	public String getValue(Cell cell) {
		int type = cell.getCellType();
		String s = "";
		if (type == cell.CELL_TYPE_NUMERIC) {
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				s = sdf.format(cell.getDateCellValue());
			} else {
				BigDecimal db = new BigDecimal(cell.getNumericCellValue());
				s = String.valueOf(db);
			}
		} else if (type == cell.CELL_TYPE_STRING) {
			s = cell.getStringCellValue();
		} else if (type == cell.CELL_TYPE_BOOLEAN) {
			s = cell.getBooleanCellValue() + "";
		} else if (type == cell.CELL_TYPE_FORMULA) {
			s = cell.getCellFormula();
		} else if (type == cell.CELL_TYPE_BLANK) {
			s = " ";
		} else if (type == cell.CELL_TYPE_ERROR) {
			s = " ";
		} else {

		}
		return s.trim();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*ExcelUtils ex = new ExcelUtils();
		try {
			List<Object[]> list = ex.importExcel("D:\\machines.xlsx");
			for (Object[] ss : list) {
				for (Object s : ss) {
					System.out.print(s + "\t");
				}
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}

}
