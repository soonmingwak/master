package com.psw.chating.vo;

public class Boarder {
	private int boarder_id;
	private String writer;
	private String title;
	private String contents;
	private String reg_date;
	private int available;
	private int count;
	
	public int getBoarder_id() {
		return boarder_id;
	}

	public Boarder(int boarder_id, String writer, String title, String contents, String reg_date, int available,
			int count) {
		super();
		this.boarder_id = boarder_id;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.reg_date = reg_date;
		this.available = available;
		this.count = count;
	}

	public void setBoarder_id(int boarder_id) {
		this.boarder_id = boarder_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Boarder() {}

	@Override
	public String toString() {
		return "Boarder [boarder_id=" + boarder_id + ", writer=" + writer + ", title=" + title + ", contents="
				+ contents + ", reg_date=" + reg_date + ", available=" + available + ", count=" + count + "]";
	}
	
	
	
}
