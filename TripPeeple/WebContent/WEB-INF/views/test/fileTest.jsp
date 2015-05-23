<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>jQuery File Upload Example</title> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="./js/jquery-ui.js"></script>
<script src="./js/jquery.fileupload.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 

<script type="text/javascript">
	$(function () {
		
	    $('#fileupload').fileupload({
	    	url: "upload.do",
	        dataType: 'json',
// 	        autoUpload: false,	        
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
	        },
	 
	    });
	    
	});

</script>

</head>
 
<body>
<div style="width:500px;padding:20px">
 
    <input id="fileupload" type="file" name="files[]"  multiple>
 
		<div class="progress">
			<div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
		</div>
		
		<div id="files" class="files"></div>
		
		<div id="upLoadDone"></div>
		<div id="fileName"></div>
		<div id="fileSize"></div>
		<div id="fileType"></div>

 
</div>
</body> 
</html>