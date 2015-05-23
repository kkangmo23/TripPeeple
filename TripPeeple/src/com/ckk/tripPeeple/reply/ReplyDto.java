package com.ckk.tripPeeple.reply;

import java.util.Date;

public class ReplyDto {
	private int reply_num;
	private int board_num;
	private int replyer_num;
	private String r_content;
	private Date create_time;
	private Date modify_time;
	
	public int getReplyer_num() {
		return replyer_num;
	}
	public void setReplyer_num(int replyer_num) {
		this.replyer_num = replyer_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getModify_time() {
		return modify_time;
	}
	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}
}
