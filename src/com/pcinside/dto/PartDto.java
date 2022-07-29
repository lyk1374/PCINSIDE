package com.pcinside.dto;

public class PartDto {
	private int idx;
	private String partName;
	private String price;
	private String image;
	
	public PartDto(String partName, String price, String image) {
		this.partName = partName;
		this.price = price;
		this.image = image;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
