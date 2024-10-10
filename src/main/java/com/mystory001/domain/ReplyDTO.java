package com.mystory001.domain;

import java.sql.Timestamp;

public class ReplyDTO {
	
	private String id; //댓글 작성자(FK - Member)
	private String replyContent; //댓글 내용
	private boolean replyHidden; //비밀글 여부(true → 비밀글, false → 일반글(default))
	private Timestamp replyWriteTime; //댓글 작성 시간
	private int re_ref; //댓글 그룹
	private int re_lev; //들여쓰기
	private int re_seq; //댓글 순서
	private int num; //댓글 번호(PK)
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public boolean isReplyHidden() {
		return replyHidden;
	}
	public void setReplyHidden(boolean replyHidden) {
		this.replyHidden = replyHidden;
	}
	public Timestamp getReplyWriteTime() {
		return replyWriteTime;
	}
	public void setReplyWriteTime(Timestamp replyWriteTime) {
		this.replyWriteTime = replyWriteTime;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

}
