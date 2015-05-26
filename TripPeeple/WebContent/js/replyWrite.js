/**
 * 
 */

$(".board-reply").on('click', 'button[name="replyBtn"]', writeReply);
$(".board-reply").on('click', '.modifyBtn', clickModifyBtn);
$(".board-reply").on('keydown', 'input[name="writeReply"]', triggerWriteReply);
$(".board-reply").on('click', '.deleteBtn', deleteReply);
$(".board-reply").on('click', '.edit_ok', modifyReply);
$(".board-reply").on('click', '.edit_cancel', cancelReply);
$(".board-reply").on('keydown', '.edit_text', triggerEditReply);

function triggerWriteReply(e){
	if(e.which===13){
		writeReply(e);
	}
}
function triggerEditReply(e){
	if(e.which===13){
		modifyReply(e);
	}
}

function writeReply(e){
	var target = $(e.target)
	var replaySection =target.parents('.board-reply'); 
	boardNum = replaySection.data('num'),
	text = replaySection.find('input[name="writeReply"]').val();
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var sendData="boardNumber="+boardNum+"&r_content="+text;
	$.ajax({
		url:"replyWrite.do",
		type:"post",
		data:sendData,
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		dataType:"text",
		success:function(data){
			var replyList = JSON.parse(decodeURIComponent(data));
			replyWrap.html(getReplyList(replyList));

			replaySection.find('input[name="writeReply"]').val('');
		
			
		},
		error:function(xhr, status, error){
			alert(xhr+","+status+","+error);
		}
	});
}

function getReplyList(replyList){
	var length = replyList.length;
	var result='';
	for(var i=0; i<length; i++){
		result += makeReplyDiv(replyList[i])
	}
	return result;
}

function makeReplyDiv(reply) {
	var d = new Date(reply.modify_time);
	var time = d.toLocaleString();
	var year = time.substring(0, 4);
	
	var month = time.substring(6, 7);
	if(month<10){
		month="0"+month;
	}
	
	var day = time.substring(9, 11);
	var hour = time.substring(16, 17);
	if(hour<10){
		hour="0"+hour;
	}
	
	var minute = time.substring(18, 20);
	var second = time.substring(21, 23);	

	console.log(time);
	
	var text = '<div class="replyDiv" data-replynum="' + reply.reply_num + '">';
	text += '<span>' + reply.member_id + '&nbsp;&nbsp;&nbsp;</span>';
	text += '<span class="reply_content">' + reply.r_content + '&nbsp;</span>';
	text += '<span class="reply_date"><small>'+year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second + '</small></span>';
	if (parseInt(window.config.memberNum, 10) === reply.member_num) {
		text += '<span class="reply_btns">'
				+ '<button class="modifyBtn" style="margin-left:60px;">Modify</button><button class="deleteBtn">Delete</button></span></div>';
	}
	return text;	
}
function clickModifyBtn(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var prevText = replayDiv.find('.reply_content').html();
	replayDiv.find('.reply_content').after('<span class="reply_edit"><input class="edit_text" type="text" value="'+prevText+'"/><button class="edit_ok">OK</button><button class="edit_cancel">x</button></span>');
	replayDiv.find('.reply_btns').hide();
	replayDiv.find('.reply_content').hide();
}

function modifyReply(e){
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
function cancelReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	replayDiv.find('.reply_content').show();
	replayDiv.find('.reply_btns').show();
	replayDiv.find('.reply_edit').remove();
}
function deleteReply(e){
	var target = $(e.target), replayDiv =target.parents('.replyDiv'); 
	var replaySection =target.parents('.board-reply');
	var replyWrap = replaySection.find('.replyDiv-wrap');
	var replyNum = replayDiv.data('replynum');
	var boardNum = replaySection.data('num');
	var sendData="replyNumber="+replyNum+"&boardNumber="+boardNum;
	$.ajax({
		url:"deleteReply.do",
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
