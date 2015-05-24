/**
 * 
 */

$('.replyBtn').on('click', writeToServer);

console.log($('.replyBtn'));

function writeToServer(e){
	var target = $(e.target), replaySection =target.parents('.board-reply'); 
	boardNum = replaySection.data('num'),
	text = replaySection.find('.writeReply').val();
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var sendData="boardNumber="+boardNum+"&r_content="+text;

	console.log(sendData);
	$.ajax({
		url:"replyWrite.do",
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			var replyList = JSON.parse(data);
			console.log(data);
			console.log(JSON.parse(data));
			replyWrap.html(getReplyList(replyList));

			replaySection.find('.writeReply').val('');
		
			
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
	
	function getReplyList(replyList){
		var length = replyList.length, result='';
		for(var i=0; i<length; i++){
			result += makeReplyDiv(replyList[i])
		}
		console.log(result);
		return result;
	}
	
	function makeReplyDiv(reply) {
		var text = '<div class="replyDiv" data-replyId="'+reply.reply_num+'">';
		text += '<span>'+reply.member_num+'</span>';
		text += '<span>'+reply.r_content+'</span>';
		text += '<span>'+ '<button style="margin-left:60px;">Modify</button><button>Delete</button></span></div>';
		return text;	
	}
}
