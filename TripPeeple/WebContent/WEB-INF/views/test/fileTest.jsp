<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>jQuery File Upload Example</title> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="./js/jquery.ui.widget.js"></script>

<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload.css">

<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>

<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="js/jquery.fileupload-validate.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


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
 
<!--     <span class="btn btn-success fileinput-button"> -->
<!--         <i class="glyphicon glyphicon-plus"></i> -->
<!--         <span>Add files...</span>         -->
<!--         <input id="fileupload" type="file" name="files"> -->
<!--     </span> -->
    
    <input id="fileupload" type="file" name="files">
    
    <button id="up_btn" class="btn btn-default" >Upload</button>
 
		<div class="progress">
			<div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
		</div>		
		
		<div id="file_preview"></div>
		
		<div id="upLoadDone"></div>
		<div id="fileName"></div>
		<div id="fileSize"></div>
		<div id="fileType"></div>

 
</body> 
</html>