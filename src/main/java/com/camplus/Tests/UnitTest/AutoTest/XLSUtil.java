//package com.camplus.Tests.UnitTest.AutoTest;
//
//import com.camplus.entity.JavaMD5Util;
//import com.camplus.entity.User;
//import com.camplus.service.UserService;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//
//import java.io.*;
//import java.util.ArrayList;
//import java.util.Iterator;
//
///**
// * Created by fowafolo
// * Date: 16/3/27
// * Time: 15:15
// */
//public class XLSUtil {
//
//    private static ArrayList<XLSModel> listBooks;
//    static String excelFilePath = "registerReturn.xlsx";
//    static String outFilePath = "out_registerReturn.xlsx";
//
//    private UserService userService;
//
//    public static void main(String[] args) throws IOException {
//        XLSUtil xlsUtil = new XLSUtil();
//        listBooks = xlsUtil.readData(excelFilePath);
//        xlsUtil.writeData(outFilePath);
//    }
//
//    /**
//     * reads value of a cell
//     * @param cell
//     * @return
//     */
//    private Object getCellValue(Cell cell) {
//        switch (cell.getCellType()) {
//            case Cell.CELL_TYPE_STRING:
//                return cell.getStringCellValue();
//
//            case Cell.CELL_TYPE_BOOLEAN:
//                return cell.getBooleanCellValue();
//
//            case Cell.CELL_TYPE_NUMERIC:
//                return cell.getNumericCellValue();
//        }
//        return null;
//    }
//
//    /**
//     * reads an Excel file and returns a list of XLSModels
//     * @param excelFilePath
//     * @return
//     * @throws IOException
//     */
//    public ArrayList<XLSModel> readData(String excelFilePath) throws IOException {
//        ArrayList<XLSModel> listBooks = new ArrayList<XLSModel>();
//        FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
//
//        Workbook workbook = new XSSFWorkbook(inputStream);
//        Sheet firstSheet = workbook.getSheetAt(0);
//        Iterator<Row> iterator = firstSheet.iterator();
//
//        while (iterator.hasNext()) {
//            Row nextRow = iterator.next();
//            Iterator<Cell> cellIterator = nextRow.cellIterator();
//            XLSModel thisModel = new XLSModel();
//
//            while (cellIterator.hasNext()) {
//                Cell nextCell = cellIterator.next();
//                nextCell.setCellType(1);
//                int columnIndex = nextCell.getColumnIndex();
//
//                switch (columnIndex) {
//                    case 0:
//                        thisModel.setUserId(getCellValue(nextCell).toString());
//                        break;
//                    case 1:
//                        thisModel.setUserPassword(getCellValue(nextCell).toString());
//                        break;
//                    case 2:
//                        thisModel.setUserPasswordAgain(getCellValue(nextCell).toString());
//                        break;
//                    case 3:
//                        thisModel.setUserName(getCellValue(nextCell).toString());
//                        break;
//                    case 4:
//                        thisModel.setExpected( getCellValue(nextCell).toString());
//                        break;
//                }
//            }
//            listBooks.add(thisModel);
//        }
//        workbook.cloneSheet(0);
//        inputStream.close();
//        return listBooks;
//    }
//
//    /**
//     * Write result to origin .xlsx
//     */
//    public boolean writeData(String excelFilePath) throws IOException {
//        System.out.println(listBooks.size());
//
//        Workbook workbook = new XSSFWorkbook();
//        Sheet sheet = workbook.createSheet();
//
//        /**
//         * 第一行不取
//         */
//        for (int i = 1; i < listBooks.size(); i++)
//        {
//            String yearStr = listBooks.get(i).getYear();
//            String monthStr = listBooks.get(i).getMonth();
//            String dayStr = listBooks.get(i).getDay();
//
//            String userId = listBooks.get(i).getUserId();
//            String userName = listBooks.get(i).getUserName();
//            String userPassword = listBooks.get(i).getUserPassword();
//            String expectedData = listBooks.get(i).getExpected();
//
//
//
//            User user = new User();
//            user.setUserName(userName);
//            user.setUserPassword(JavaMD5Util.MD5(userPassword));
//            user.setUserId(userId);
//            user.setUserExperience(0);
//            user.setUserLevel(1);
//            userService.userRegister(user);
//
//
//
//
//            if(result.equals("false"))
//            {
//                listBooks.get(i).setResult("Error");
//            }else {
//                listBooks.get(i).setResult(result);
//            }
//            if (listBooks.get(i).getResult().equals(expectedData))
//            {
//                listBooks.get(i).setAccurate("Right");
//            }else {
//                listBooks.get(i).setAccurate("Wrong");
//            }
//        }
//
//        listBooks.get(0).setYear("Year");
//        listBooks.get(0).setMonth("Month");
//        listBooks.get(0).setDay("Day");
//        listBooks.get(0).setExpected("Expected");
//        listBooks.get(0).setResult("Result");
//        listBooks.get(0).setAccurate("Accurate");
//
//        int rowNum = 0;
//        for (XLSModel model : listBooks)
//        {
//            Row row = sheet.createRow(rowNum++);
//            String []array = {model.getYear(),model.getMonth(),model.getDay(),model.getExpected(),model.getResult(),model.getAccurate()};
//            int cellNum = 0;
//            for (String thisOne: array)
//            {
//                Cell cell = row.createCell(cellNum++);
//                cell.setCellValue(thisOne);
//            }
//        }
//
//        try {
//            FileOutputStream out = new FileOutputStream(excelFilePath);
//            workbook.write(out);
//            out.close();
//            System.out.println("Excel written successfully..");
//
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        return true;
//    }
//}
