<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="./js/jquery.ui.widget.js"></script>
<script src="js/jquery.fileupload.js"></script>

<script type="text/javascript">
	$(function () {
		
	    $('#fileupload').fileupload({
	    	url: "upload.do",
	        dataType: 'json',
	        autoUpload: false,
	        maxNumberOfFiles: 1,
	        singleFileUploads: true,
	        limitMultiFileUploads: 1,
	        
	        add: function (e, data) {
	        	$("#file_preview").html(data.files[0].name);
	            $("#up_btn").on('click', function () {
	                data.submit();
	            });
	        },
	        done: function(e, data) {
	        	$("#upLoadDone").html("Upload Done!");
	        	$("#fileName").text(data.result.fileName);
	        	$("#fileSize").text(data.result.fileSize);
	        	$("#fileType").text(data.result.fileType);
	        },
	 
	        progressall: function (e, data) {
	            var progress = parseInt(data.loaded / data.total * 100, 10);
	            $('.progress-bar').css(
	                'width',
	                progress + '%'
	            );
	        }
	 
	    });
	    
	});

</script>


</head>
<body>

<input id="fileupload" type="file" name="file">

</body>
</html>