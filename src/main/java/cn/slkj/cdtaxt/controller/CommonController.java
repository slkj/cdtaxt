package cn.slkj.cdtaxt.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.cdtaxt.entity.Plupload;
import cn.slkj.slUtil.PluploadUtil;

@Controller
@RequestMapping(value = "/comm")
public class CommonController {

	/* 跳转页面 */
	@RequestMapping("/Welcome")
	public String toUserPage() {
		return "Welcome";
	}

	/* 跳转页面 */
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
	}

	// 多文件上传
	@ResponseBody
	@RequestMapping("/uploadFile")
	public String uploadFile(Plupload plupload, HttpServletRequest request, HttpServletResponse response) {
		String.format("%02d", 11);
		String baseFilePath = "D:\\weblogs\\cdtaxt";
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		String date = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		month = String.format("%02d", Integer.parseInt(month));
		String filePath =  "\\" + year + "\\" + year + month + "\\" + year + month + date+"\\";

		plupload.setRequest(request);

		// 文件存储路径
		String fileName = plupload.getName();
		String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String realName = System.currentTimeMillis() + suffix;
		try {
			PluploadUtil.upload2Local(plupload, baseFilePath+filePath, realName);
			// 判断文件是否上传成功（被分成块的文件是否全部上传完成）
			if (PluploadUtil.isUploadFinish(plupload)) {
				return filePath+realName;
			}

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "";
	}

	@RequestMapping("/filedownload")
	public ResponseEntity<byte[]> download(String fileUrl) throws IOException {
		HttpHeaders headers = new HttpHeaders();
		String baseFilePath = "D:\\weblogs\\cdtaxt";
		fileUrl= baseFilePath+fileUrl;
		File file = new File(fileUrl);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		String charset = new String(fileUrl.getBytes("utf-8"), "iso-8859-1");
		headers.setContentDispositionFormData("file", charset);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}
}
