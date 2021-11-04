package com.video.model;

public class Video {
	private String movieName;
	private String actors;
	private String language;
	private String directorName;
	private String producerName;
	private int vcdCost;
	private int dvdCost;
	private int rentMoney;
    private int copiesAvailable;
    
	public int getAvailabelCopies() {
		return copiesAvailable;
	}

	public void setAvailabelCopies(int availabelCopies) {
		this.copiesAvailable = availabelCopies;
	}

	public String getName() {
		return movieName;
	}

	public void setName(String name) {
		this.movieName = name;
	}

	public String getStaring() {
		return actors;
	}

	public void setStaring(String staring) {
		this.actors = staring;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getDirector() {
		return directorName;
	}

	public void setDirector(String director) {
		this.directorName = director;
	}

	public String getProducer() {
		return producerName;
	}

	public void setProducer(String producer) {
		this.producerName = producer;
	}

	public int getVcd() {
		return vcdCost;
	}

	public void setVcd(int vcd) {
		this.vcdCost = vcd;
	}

	public int getDvd() {
		return dvdCost;
	}

	public void setDvd(int dvd) {
		this.dvdCost = dvd;
	}

	public int getRent() {
		return rentMoney;
	}

	public void setRent(int rent) {
		this.rentMoney = rent;
	}
}
