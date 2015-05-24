package com.ckk.tripPeeple.file;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController {

	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public @ResponseBody FileMeta upload(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{

		FileMeta fileMeta = null;

		String path = "C:/TripPeeple_repo/content_file/";

		MultipartFile mpf = request.getFile("files");

		System.out.println(mpf.getOriginalFilename() + " uploaded! ");

		fileMeta = new FileMeta();
		fileMeta.setFileName(mpf.getOriginalFilename());
		fileMeta.setFileSize(String.valueOf(mpf.getSize()));
		fileMeta.setFileType(mpf.getContentType());
		fileMeta.setFilePath(path);
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		File file = new File(path + mpf.getOriginalFilename());
		byte[] by = mpf.getBytes();
		fos = new FileOutputStream(file);
		bos = new BufferedOutputStream(fos);
		bos.write(by);
		bos.flush();
		
		bos.close();
		fos.close();

		// result will be like this
		// [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
		return fileMeta;
	}
}