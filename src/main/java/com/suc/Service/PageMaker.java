package com.suc.Service;

import com.suc.Service.Criteria;

public class PageMaker {


	private int totalCount; //전체 게시글수
	private int starPage; //시작페이지 번호
	private int endPage; // 끝페이지 번호
	private boolean prev; //이전페이지
	private boolean next; //다음페이지
	private int displayPageNum=10; //보여질 페이지 수 1~10 11~20
	public void setTotalCount(int totalCount) {
		this.totalCount =totalCount;

		calcData();
	}
	private void calcData() {
		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum)* displayPageNum);

		starPage = (endPage - displayPageNum)+1;

		int tempEndPage = (int)(Math.ceil((totalCount) / (double)criteria.getPerPageNum()));

		if(endPage>tempEndPage) {
			endPage=tempEndPage;
		}
		this.prev = starPage > 1 ? true : false;
		this.next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
	
	}
	public int getStarPage() {
		return starPage;
	}
	public void setStarPage(int starPage) {
		this.starPage = starPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public Criteria getCriteria() {
		return criteria;
	}


	private Criteria criteria;
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
}
