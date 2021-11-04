package com.video.model;

public class Lend {
	private int uniqueKey;
	private String username;
	private String moviename;
	private String type;
	private String cdtype;
	private String noofdays;
	private String no;
	private int cost;
    private String cardHolderName;
    private String cardNumber;
    private int copies;
	public int getCopies() {
		return copies;
	}

	public void setCopies(int copies) {
		this.copies = copies;
	}

	public String getCardHolderName() {
		return cardHolderName;
	}

	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCdtype() {
		return cdtype;
	}

	public void setCdtype(String cdtype) {
		this.cdtype = cdtype;
	}

	public String getNoofdays() {
		return noofdays;
	}

	public void setNoofdays(String noofdays) {
		this.noofdays = noofdays;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getUniqueKey() {
		return uniqueKey;
	}

	public void setUniqueKey(int l) {
		this.uniqueKey = l;
	}
}
