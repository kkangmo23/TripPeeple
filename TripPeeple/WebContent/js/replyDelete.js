/**
 * 
 */

function deleteToServer(num, root){
	// alert(num+","+root);
	var addr=root+"/12_reply/replyDelete.do";
	var sendData="num="+num;
	
	$.ajax({
		url:addr,
		type:"post",
		
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		
		dataType:"text",
		success:function(data){
			var num=parseInt(data);
			var divNum=document.getElementById(num);
			// alert(divNum);
			
			if(divNum!=null){
				$(divNum).remove();
			}else{
//				var newNumDiv=document.getElementById("newNum"+num);
//				var newReply=document.getElementById("newReply");
//				$(newReply).remove();
			}
		},
		error:function(xhr, status, error){
			
		}
	});
}



/*


function deleteProcess(reponseText){

	
	if(divNum!=null){
		// 기존 데이터
		document.body.removeChild(divNum);
	}else{
		// 새로운 데이터
		var newNumDiv=document.getElementById("newNum"+num);
		var newReply=document.getElementById("newReply");
		newReply.removeChild(newNumDiv);
	}
}*/