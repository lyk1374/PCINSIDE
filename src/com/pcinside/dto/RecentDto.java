package com.pcinside.dto;

public class RecentDto {
	
	private String CPU_MAKER;
	private	String CPU_TYPE;
	private String CPU_NAME;
	private String GRAPHIC_NAME;
	private int PRICE;
	private String SELL_TIME;
	
		public RecentDto(){
		}
		
	public RecentDto(String cPU_MAKER, String cPU_TYPE, String cPU_NAME, String gRAPHIC_NAME, int pRICE,
			String sELL_TIME) {
		CPU_MAKER = cPU_MAKER;
		CPU_TYPE = cPU_TYPE;
		CPU_NAME = cPU_NAME;
		GRAPHIC_NAME = gRAPHIC_NAME;
		PRICE = pRICE;
		SELL_TIME = sELL_TIME;
	}
	public String getCPU_MAKER() {
		return CPU_MAKER;
	}
	public void setCPU_MAKER(String cPU_MAKER) {
		CPU_MAKER = cPU_MAKER;
	}
	public String getCPU_TYPE() {
		return CPU_TYPE;
	}
	public void setCPU_TYPE(String cPU_TYPE) {
		CPU_TYPE = cPU_TYPE;
	}
	public String getCPU_NAME() {
		return CPU_NAME;
	}
	public void setCPU_NAME(String cPU_NAME) {
		CPU_NAME = cPU_NAME;
	}
	public String getGRAPHIC_NAME() {
		return GRAPHIC_NAME;
	}
	public void setGRAPHIC_NAME(String gRAPHIC_NAME) {
		GRAPHIC_NAME = gRAPHIC_NAME;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getSELL_TIME() {
		return SELL_TIME;
	}
	public void setSELL_TIME(String sELL_TIME) {
		SELL_TIME = sELL_TIME;
	}
	
}
