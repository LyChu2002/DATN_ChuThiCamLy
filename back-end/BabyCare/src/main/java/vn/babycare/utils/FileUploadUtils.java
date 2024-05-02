package vn.babycare.utils;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadUtils {
	public boolean isUploadFile(MultipartFile file) {
		if(file == null || file.getOriginalFilename().isEmpty()) {
			return false;
		}
		return true;
	}
	
	public boolean isUploadFiles(MultipartFile[] files) {
		if(files == null || files.length == 0) {
			return false;
		}
		return true;
	}
}
