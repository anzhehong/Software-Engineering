package com.camplus.Tests.UnitTest.AutoTest;

import com.camplus.Util.JavaMD5Util;
import com.camplus.Util.Validator;
import com.camplus.service.UserService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created by fowafolo
 * Date: 16/3/27
 * Time: 15:15
 */
public class XLSUtil {

    private static ArrayList<XLSModel> globalList;
    static String excelFilePathPhone = "validatePhone.xlsx";
    static String outFilePathPhone = "validatePhone_out.xlsx";

    static String excelFilePathId = "validateIdentityCard.xlsx";
    static String outFilePathId = "validateIdentityCard_out.xlsx";

    static String excelFilePathChinese = "validateChinese.xlsx";
    static String outFilePathChinese = "validateChinese_out.xlsx";

    static String excelFilePathMD5 = "MD5.xlsx";
    static String outFilePathMD5 = "MD5_out.xlsx";

    private UserService userService;

    public static void main(String[] args) throws IOException {
        XLSUtil xlsUtil = new XLSUtil();

        /**
         * 判断电话方法测试
         */
        globalList = xlsUtil.readData(excelFilePathPhone);
        xlsUtil.writeData(outFilePathPhone, 0);

        /**
         * 判断汉字方法测试
         */
        globalList = xlsUtil.readData(excelFilePathChinese);
        xlsUtil.writeData(outFilePathChinese, 1);

        /**
         * 判断身份证测试
         */
        globalList = xlsUtil.readData(excelFilePathId);
        xlsUtil.writeData(outFilePathId, 2);

        /**
         * MD5加密结果测试
         */
        globalList = xlsUtil.readData(excelFilePathMD5);
        xlsUtil.writeData(outFilePathMD5, 3);
    }

    /**
     * reads value of a cell
     * @param cell
     * @return
     */
    private Object getCellValue(Cell cell) {
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                return cell.getStringCellValue();

            case Cell.CELL_TYPE_BOOLEAN:
                return cell.getBooleanCellValue();

            case Cell.CELL_TYPE_NUMERIC:
                return cell.getNumericCellValue();
        }
        return null;
    }

    /**
     * reads an Excel file and returns a list of XLSModels
     * @param excelFilePath
     * @return
     * @throws IOException
     */
    public ArrayList<XLSModel> readData(String excelFilePath) throws IOException {
        ArrayList<XLSModel> xlsModelArrayList = new ArrayList<XLSModel>();
        FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> iterator = firstSheet.iterator();

        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            Iterator<Cell> cellIterator = nextRow.cellIterator();
            XLSModel thisModel = new XLSModel();

            while (cellIterator.hasNext()) {
                Cell nextCell = cellIterator.next();
                nextCell.setCellType(1);
                int columnIndex = nextCell.getColumnIndex();

                switch (columnIndex) {
                    case 0:
                        thisModel.setOriginStr(getCellValue(nextCell).toString());
                        break;
                    case 1:
                        thisModel.setExpected( getCellValue(nextCell).toString());
                        break;
                }
            }
            xlsModelArrayList.add(thisModel);
        }
        workbook.cloneSheet(0);
        inputStream.close();
        System.out.println("origni");
        System.out.println(xlsModelArrayList.size());
        return xlsModelArrayList;
    }

    /**
     * Write result to origin .xlsx
     */
    public boolean writeData(String excelFilePath, int type) throws IOException {
        System.out.println(globalList.size());

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet();

        /**
         * 第一行不取
         */
        for (int i = 1; i < globalList.size(); i++)
        {

            String origin = globalList.get(i).getOriginStr();
            String expectedData = globalList.get(i).getExpected();

            //TODO: 判断
            if (type == 0) {
                if (Validator.isMobile(origin)) {
                    globalList.get(i).setResult("yes");
                }else {
                    globalList.get(i).setResult("no");
                }
            }else if (type == 1) {
                if (Validator.isChinese(origin)) {
                    globalList.get(i).setResult("yes");
                }else {
                    globalList.get(i).setResult("no");
                }
            }else if (type == 2) {
                if (Validator.isIDCard(origin)) {
                    globalList.get(i).setResult("yes");
                }else {
                    globalList.get(i).setResult("no");
                }
            }else if (type == 3) {
                String result = JavaMD5Util.MD5(origin);
                globalList.get(i).setResult(result);
            }


            if (globalList.get(i).getResult().equals(expectedData))
            {
                globalList.get(i).setAccurate("Right");
            }else {
                globalList.get(i).setAccurate("Wrong");
            }
        }

        globalList.get(0).setOriginStr("Origin");
        globalList.get(0).setExpected("Expected");
        globalList.get(0).setResult("Result");
        globalList.get(0).setAccurate("Accurate");

        int rowNum = 0;
        for (XLSModel model : globalList)
        {
            Row row = sheet.createRow(rowNum++);
            String []array = {model.getOriginStr(),model.getExpected(),model.getResult(),model.getAccurate()};
            int cellNum = 0;
            for (String thisOne: array)
            {
                Cell cell = row.createCell(cellNum++);
                cell.setCellValue(thisOne);
            }
        }

        try {
            FileOutputStream out = new FileOutputStream(excelFilePath);
            workbook.write(out);
            out.close();
            System.out.println("Excel written successfully..");

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }
}
