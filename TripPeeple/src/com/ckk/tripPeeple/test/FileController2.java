//package com.ckk.tripPeeple.test;
//
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.util.Iterator;
//import java.util.LinkedList;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
// 
//@Controller
//public class FileController2 { 
//   
//    FileMeta file = null;
//    /***************************************************
//     * URL: /rest/controller/upload  
//     * upload(): receives files
//     * @param request : MultipartHttpServletRequest auto passed
//     * @param response : HttpServletResponse auto passed
//     * @return LinkedList<FileMeta> as json format
//     ****************************************************/
//    @RequestMapping(value="/upload2.do", method = RequestMethod.POST)
//    public @ResponseBody FileMeta upload(MultipartHttpServletRequest request, HttpServletResponse response) {
// 
//    	String path = "C:/TripPeeple_repo/video/";
//    	
//        //1. build an iterator
//         Iterator<String> itr =  request.getFileNames();
//         MultipartFile mpf = null;
// 
//         //2. get each file
//         while(itr.hasNext()){
// 
//             //2.1 get next MultipartFile
//             mpf = request.getFile(itr.next()); 
//             System.out.println(mpf.getOriginalFilename() +" uploaded! ");
// 
//             //2.3 create new fileMeta
//             file = new FileMeta();
//             file.setFileName(mpf.getOriginalFilename());
//             file.setFileSize(mpf.getSize()/1024+" Kb");
//             file.setFileType(mpf.getContentType());
// 
//             try {
//                file.setBytes(mpf.getBytes());
// 
//                 // copy file to local disk (make sure the path "e.g. D:/temp/files" exists)            
//                 FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(path+mpf.getOriginalFilename()));
// 
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//         }
//        // result will be like this
//        // [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
//        return file;
//    }
//    /***************************************************
//     * URL: /rest/controller/get/{value}
//     * get(): get file as an attachment
//     * @param response : passed by the server
//     * @param value : value from the URL
//     * @return void
//     ****************************************************/
////    @RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
////     public void get(HttpServletResponse response,@PathVariable String value){
////         FileMeta getFile = files.get(Integer.parseInt(value));
////         try {      
////                response.setContentType(getFile.getFileType());
////                response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getFileName()+"\"");
////                FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
////         }catch (IOException e) {
////                // TODO Auto-generated catch block
////                e.printStackTrace();
////         }
////     }
//}