/**
 * 
 */

function deleteToServer(num, root){
	alert(num+","+root);
	var url=root+"/12_reply/replyDelete.do";
	var params="num="+num;
	sendRequest("GET", url, deleteFromServer, params);
	
}

function deleteFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		// alert(xhr.responseText);
		deleteProcess(xhr.responseText);
	}
}

function deleteProcess(reponseText){
	var num=parseInt(reponseText);
	var divNum=document.getElementById(num);
	// alert(divNum);
	
	if(divNum!=null){
		// 기존 데이터
		document.body.removeChild(divNum);
	}else{
		// 새로운 데이터
		var newNumDiv=document.getElementById("newNum"+num);
		var newReply=document.getElementById("newReply");
		newReply.removeChild(newNumDiv);
	}
}