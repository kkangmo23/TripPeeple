/**
 * 
 */

$(".board-reply").on('click', '.replyBtn', writeReply);
$(".board-reply").on('click', '.modifyBtn', editReply);
$(".board-reply").on('click', '.deleteBtn', deleteReply);
$(".board-reply").on('click', '.edit_ok', modifyReply);
$(".board-reply").on('click', '.edit_cancel', cancelReply);

console.log($('.replyBtn'));

function writeReply(e){
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
			var replyList = JSON.parse(decodeURIComponent(data));
			replyWrap.html(getReplyList(replyList));

			replaySection.find('.writeReply').val('');
		
			
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
}

function getReplyList(replyList){
	var length = replyList.length, result='';
	for(var i=0; i<length; i++){
		result += makeReplyDiv(replyList[i])
	}
	console.log(result);
	return result;
}

function makeReplyDiv(reply) {
	var text = '<div class="replyDiv" data-replyNum="'+reply.reply_num+'">';
	text += '<span>'+reply.member_id+'&nbsp;&nbsp;</span>';
	text += '<span class="reply_content">'+reply.r_content+'</span>';
	text += '<span>'+ '<button class="modifyBtn" style="margin-left:60px;">Modify</button><button class="deleteBtn">Delete</button></span></div>';
	return text;	
}
function editReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var prevText = replayDiv.find('.reply_content').html();
	replayDiv.find('.reply_content').after('<span class="reply_edit"><input type="text" value="'+prevText+'"/><button class="edit_ok">OK</button><button class="edit_cancel">x</button></span>');
	replayDiv.find('.reply_btns').hide();
	replayDiv.find('.reply_content').hide();
	
	var replyNum = replayDiv.data('replyNum');
	
}

function modifyReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	replaySection =target.parents('.board-reply'),  replyWrap = replaySection.find('.replyDiv-wrap');
	var replyNum = replayDiv.data('replyNum');
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var sendData="replyNumber="+replyNum;

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
function cancelReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	replayDiv.find('.reply_content').show();
	replayDiv.find('.reply_btns').show();
	replayDiv.find('.reply_edit').remove();
}
