/**
 * 
 */

function boardLike(board_num, likes){
	var sendData="board_num="+board_num+"&likes="+likes;
	$.ajax({
		url:"like.do",
		type:"post",
		
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		
		dataType:"text",
		success:function(data){
			console.log(data);
			$(".boardLike").html(data);
		},
		error:function(xhr, status, error){
			// XMLHttpRequest, status 4/200, error message
			var arr=new Array();
			arr.push("xhr:"+xhr);
			arr.push("status:"+status);
			arr.push("error:"+error);
			alert(arr);
		}
	});
}

function getLikeList(board_num){
	
	
}

function getReplyList(replyList){
	var length = replyList.length;
	var result='';
	for(var i=0; i<length; i++){
		result += makeReplyDiv(replyList[i])
	}
	return result;
}

function modifyLike(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var boardNum = replaySection.data('num');
	var replyNum = replayDiv.data('replynum');
	var editText = replayDiv.find('.reply_edit input').val();
	var sendData="replyNumber="+replyNum+"&r_content="+editText+"&boardNumber="+boardNum;
	$.ajax({
		url:"modifyReply.do",
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			var replyList = JSON.parse(decodeURIComponent(data));
			replyWrap.html(getReplyList(replyList));
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
}