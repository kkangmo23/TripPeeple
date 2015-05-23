/**
 * 
 */
var root=null;
function upSelectToServer(num, requestRoot){
	// alert(num+","+root);
	root=requestRoot;
	var url=root+"/12_reply/replySelect.do";
	var params="num="+num;
	
	sendRequest("GET", url, upSelectFromServer, params);
}

function upSelectFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		// alert(xhr.responseText);
		selectProcess(xhr.responseText);
	}
}

function selectProcess(responseText){
	var result=responseText.split(",");
	var num=result[0].trim();
	var reply=result[1].trim();
	
	var div=document.createElement("div");
	div.id="upNum"+num;
	
	var inputText=document.createElement("input");
	inputText.type="text";
	inputText.value=reply;
	
	var inputBtn=document.createElement("input");
	inputBtn.type="button";
	inputBtn.value="Modify";
	inputBtn.onclick=function (){
		updateToServer(num, inputText.value);
	}
	// 일반 함수명으로는 파라미터를 넘길 수 없으므로
	
	div.appendChild(inputText);
	div.appendChild(inputBtn);
	
	var numDiv=document.getElementById(num);
	// alert(num+","+reply+","+numDiv);
	
	if(numDiv!=null){
		numDiv.appendChild(div);
	}else{
		var newNum=document.getElementById("newNum"+num);
		newNum.appendChild(div);
	}
}

function updateToServer(num, value){
	// alert(num+","+value);
	var url=root+"/12_reply/replyUpdate.do";
	var params="num="+num+"&lineReply="+value;
	
	sendRequest("GET", url, updateFromServer, params);
}

function updateFromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		// alert(xhr.responseText);
		updateProcess(xhr.responseText);
	}
}

function updateProcess(responseText){
	// alert(responseText);
	var result=responseText.split(",");
	var num=result[0].trim();
	var reply=result[1].trim();
	// alert(num+","+reply);
	
	var numDiv=document.getElementById(num);
	// alert(num+","+reply+","+numDiv);
	var updateDiv=document.getElementById("upNum"+num);
	
	if(numDiv!=null){
		var span=numDiv.getElementsByTagName("span");
		span[1].innerHTML=reply;
		numDiv.removeChild(updateDiv);
	}else{
		var newNum=document.getElementById("newNum"+num);
		var span=newNum.getElementsByTagName("span");
		span[1].innerHTML=reply;
		newNum.removeChild(updateDiv);
	}
}