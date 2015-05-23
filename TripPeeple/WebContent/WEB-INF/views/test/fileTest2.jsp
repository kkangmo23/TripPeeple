<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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



<script>
$(function () {
    'use strict';
    var url = "upload.do";
    var uploadButton = $('<button/>').addClass('btn btn-primary').prop('disabled', true).text('Processing...').on('click', function () {
    	var $this = $(this);
        var data = $this.data();
        $this.off('click').text('Abort').on('click', function () {
        	$this.remove();
            data.abort();
        });
        data.submit().always(function () {
        	$this.remove();
        });
    });
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: false,
        previewMaxWidth : 50,
        previewMaxHeight : 50,
        
    }).on('fileuploadadd', function (e, data) {
    	$("#files").empty();
    	data.context = $('<div/>').appendTo('#files');
        $.each(data.files, function (index, file) {
            var node = $('<p/>').append($('<span/>').text(file.name));
            if (!index) {
                node.append('<br>').append(uploadButton.clone(true).data(data));
            }
            node.appendTo(data.context);
        });
        
    }).on('fileuploadprocessalways', function (e, data) {
    	var index = data.index,
        file = data.files[index],
        node = $(data.context.children()[index]);
	    if (file.preview) {
	    	node.prepend('<br>').prepend(file.preview);
	    	$("#files").find("video").css("width", "300px");
	    }
	    if (file.error) {
	        node.append('<br>').append($('<span class="text-danger"/>').text(file.error));
	    }
	    if (index + 1 === data.files.length) {
	        data.context.find('button').text('Upload').prop('disabled', !!data.files.error);
	    }
        
    }).on('fileuploadprogressall', function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .progress-bar').css(
            'width',
            progress + '%'
        );
    }).on('fileuploaddone', function (e, data) {
    	$("#upLoadDone").html("Upload Done!");
    	$("#fileName").text(data.result.fileName);
    	$("#fileSize").text(data.result.fileSize);
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index]).append('<br>').append(error);
        });
    }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
});
</script>




</head>
<body>

<!-- The fileinput-button span is used to style the file input field as button -->
    <span class="btn btn-success fileinput-button">
        <i class="glyphicon glyphicon-plus"></i>
        <span>Add files...</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="fileupload" type="file" name="files">
    </span>
    <br>
    <br>
    <!-- The global progress bar -->
    <div id="progress" class="progress">
        <div class="progress-bar progress-bar-striped"></div>
    </div>
    <!-- The container for the uploaded files -->
    <div id="files" class="files">
    
    </div>
    
    <div id="upLoadDone"></div>
	<div id="fileName"></div>
	<div id="fileSize"></div>
    
    
</body>
</html>