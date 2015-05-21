/**
 * 
 */

var root=null;
function writeToServer(requestRoot,boardNumber){
	// alert(root+","+boardNumber);
	root=requestRoot;
	
	var writeReply=document.getElementById("writeReply").value;
	var url=root+"/12_reply/replyWrite.do";
	var params="boardNumber="+boardNumber+"&lineReply="+writeReply;
	sendRequest("POST", url, writeFromServer, params);
}

function writeFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		// alert(xhr.responseText);
		writeReplyProcess(xhr.responseText);
	}
}

function writeReplyProcess(responseText){
	var result=responseText.split(",");
	var num=result[0].trim();
	var reply=result[1].trim();
	// alert(num+","+reply);
	
	document.getElementById("writeReply").value="";
	
	var newReply=document.getElementById("newReply");
	var div=document.createElement("div");
	div.className="replyDiv";
	div.id="newNum"+num;
	
	var spanNum=document.createElement("span");
	spanNum.className="cssBunho";
	spanNum.innerHTML=num;
	
	var spanReply=document.createElement("span");
	spanReply.className="cssReply";
	spanReply.innerHTML=reply;
	
	var spanUpDel=document.createElement("span");
	spanUpDel.className="cssUpDel";
	
	var aUpdate=document.createElement("a");
	aUpdate.href="javascript:upSelectToServer("+num+",\'"+root+"\')";
	aUpdate.innerHTML="Modify&nbsp;&nbsp;";
	
	var aDelete=document.createElement("a");
	aDelete.href="javascript:deleteToServer("+num+",\'"+root+"\')";
	aDelete.innerHTML="Delete";
	
	spanUpDel.appendChild(aUpdate);
	spanUpDel.appendChild(aDelete);
	
	div.appendChild(spanNum);
	div.appendChild(spanReply);
	div.appendChild(spanUpDel);
	// newReply.appendChild(div);
	newReply.insertBefore(div, newReply.firstChild);
	
}