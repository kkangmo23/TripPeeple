/**
 * 
 */
function writeToServer(boardNumber){
	alert(boardNumber);
	
	var writeReply=$("#writeReply").val();
	var sendData="boardNumber="+boardNumber+"&r_content="+writeReply;
	
	$.ajax({
		url:"replyWrite.do",
		type:"post",
		
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		
		dataType:"text",
		success:function(data){
			var result=data.split(",");
			var num=result[0].trim();
			var reply=result[1].trim();
			alert(num+","+reply);
			$("#writeReply").val("");
			
//			$("#listAllDiv > div:eq(0)").prepend("<span class='cssBunho'></span>");
//			$("#listAllDiv > div:eq(0)").prepend("<span class='cssReply'></span>");
//			$("#listAllDiv > div:eq(0)").prepend("<span class='cssUpDel'></span>");
//			$("span:eq(2)").prepend("<a></a>");
//			$("span:eq(2)").prepend("<a></a>");
			
			$("#listAllDiv > div:eq(0)").css("display", "block");
			$("#listAllDiv > div:eq(0)").attr("id", num);
			
			$("#listAllDiv span:eq(0)").text(num);
			$("#listAllDiv span:eq(1)").text(reply);
			
			$("#listAllDiv a:eq(0)").text("Modify");
			$("#listAllDiv a:eq(0)").attr("href", "javascript:upSelectToServer("+num+",\'"+root+"\')");
			
			$("#listAllDiv a:eq(1)").text("Delete");
			$("#listAllDiv a:eq(1)").attr("href", "javascript:deleteToServer("+num+",\'"+root+"\')");
			
//			$("#listAllDiv > div:eq(0)").clone().attr("class", "clone");
//			$(".clone").text(num);
//			$("#listAllDiv").prepend(".clone");
			


			
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
}
