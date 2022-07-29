package com.pcinside.dto;

public class PCDto {
	private int pcNum;
	private String mining;
	private String smoking;
	private int opinion1;
	private int opinion2;
	private int opinion3;
	private String image;
	private int price;
	private String cpuMaker;
	private String cpuType;
	private String cpuGen;
	private String cpuName;
	private String motherBoardMaker;
	private String motherBoardName;
	private String graphicChipset;
	private String graphicName;
	private String ramMaker;
	private String ramGen;
	private String ramVol;
	private String ssdMaker;
	private String ssdVol;
	private String hddMaker;
	private String hddVol;
	private String powerMaker;
	private String powerCap;
	private String sellTime;
	private int baseBranch;
	
	public PCDto(int pcNum, String mining, String smoking, int opinion1, int opinion2, int opinion3, String image,
			int price, String cpuMaker, String cpuType, String cpuGen, String cpuName, String motherBoardMaker,
			String motherBoardName, String graphicChipset, String graphicName, String ramMaker, String ramGen,
			String ramVol, String ssdMaker, String ssdVol, String hddMaker, String hddVol, String powerMaker,
			String powerCap, String sellTime, int baseBranch) {
		this.pcNum = pcNum;
		this.mining = mining;
		this.smoking = smoking;
		this.opinion1 = opinion1;
		this.opinion2 = opinion2;
		this.opinion3 = opinion3;
		this.image = image;
		this.price = price;
		this.cpuMaker = cpuMaker;
		this.cpuType = cpuType;
		this.cpuGen = cpuGen;
		this.cpuName = cpuName;
		this.motherBoardMaker = motherBoardMaker;
		this.motherBoardName = motherBoardName;
		this.graphicChipset = graphicChipset;
		this.graphicName = graphicName;
		this.ramMaker = ramMaker;
		this.ramGen = ramGen;
		this.ramVol = ramVol;
		this.ssdMaker = ssdMaker;
		this.ssdVol = ssdVol;
		this.hddMaker = hddMaker;
		this.hddVol = hddVol;
		this.powerMaker = powerMaker;
		this.powerCap = powerCap;
		this.sellTime = sellTime;
		this.baseBranch = baseBranch;
	}
	
	public PCDto(int pcNum, String image, int price, String cpuMaker, String cpuType, String cpuGen, String cpuName,
			String graphicChipset, String graphicName) {
		this.pcNum = pcNum;
		this.image = image;
		this.price = price;
		this.cpuMaker = cpuMaker;
		this.cpuType = cpuType;
		this.cpuGen = cpuGen;
		this.cpuName = cpuName;
		this.graphicChipset = graphicChipset;
		this.graphicName = graphicName;
	}

	public PCDto(int price, String cpuMaker, String cpuType, String cpuName, String graphicChipset, String graphicName,
			String sellTime) {
		this.price = price;
		this.cpuMaker = cpuMaker;
		this.cpuType = cpuType;
		this.cpuName = cpuName;
		this.graphicChipset = graphicChipset;
		this.graphicName = graphicName;
		this.sellTime = sellTime;
	}

	public PCDto(String mining, String smoking, int opinion1, int opinion2, int opinion3, int price, String cpuMaker,
			String cpuType, String cpuGen, String cpuName, String motherBoardMaker, String motherBoardName,
			String graphicChipset, String graphicName, String ramMaker, String ramGen, String ramVol, String ssdMaker,
			String ssdVol, String hddMaker, String hddVol, String powerMaker, String powerCap, int baseBranch) {
		this.mining = mining;
		this.smoking = smoking;
		this.opinion1 = opinion1;
		this.opinion2 = opinion2;
		this.opinion3 = opinion3;
		this.price = price;
		this.cpuMaker = cpuMaker;
		this.cpuType = cpuType;
		this.cpuGen = cpuGen;
		this.cpuName = cpuName;
		this.motherBoardMaker = motherBoardMaker;
		this.motherBoardName = motherBoardName;
		this.graphicChipset = graphicChipset;
		this.graphicName = graphicName;
		this.ramMaker = ramMaker;
		this.ramGen = ramGen;
		this.ramVol = ramVol;
		this.ssdMaker = ssdMaker;
		this.ssdVol = ssdVol;
		this.hddMaker = hddMaker;
		this.hddVol = hddVol;
		this.powerMaker = powerMaker;
		this.powerCap = powerCap;
		this.baseBranch = baseBranch;
	}

	public int getPcNum() {
		return pcNum;
	}

	public void setPcNum(int pcNum) {
		this.pcNum = pcNum;
	}

	public String getMining() {
		return mining;
	}

	public void setMining(String mining) {
		this.mining = mining;
	}

	public String getSmoking() {
		return smoking;
	}

	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}

	public int getOpinion1() {
		return opinion1;
	}

	public void setOpinion1(int opinion1) {
		this.opinion1 = opinion1;
	}

	public int getOpinion2() {
		return opinion2;
	}

	public void setOpinion2(int opinion2) {
		this.opinion2 = opinion2;
	}

	public int getOpinion3() {
		return opinion3;
	}

	public void setOpinion3(int opinion3) {
		this.opinion3 = opinion3;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCpuMaker() {
		return cpuMaker;
	}

	public void setCpuMaker(String cpuMaker) {
		this.cpuMaker = cpuMaker;
	}

	public String getCpuType() {
		return cpuType;
	}

	public void setCpuType(String cpuType) {
		this.cpuType = cpuType;
	}

	public String getCpuGen() {
		return cpuGen;
	}

	public void setCpuGen(String cpuGen) {
		this.cpuGen = cpuGen;
	}

	public String getCpuName() {
		return cpuName;
	}

	public void setCpuName(String cpuName) {
		this.cpuName = cpuName;
	}

	public String getMotherBoardMaker() {
		return motherBoardMaker;
	}

	public void setMotherBoardMaker(String motherBoardMaker) {
		this.motherBoardMaker = motherBoardMaker;
	}

	public String getMotherBoardName() {
		return motherBoardName;
	}

	public void setMotherBoardName(String motherBoardName) {
		this.motherBoardName = motherBoardName;
	}

	public String getGraphicChipset() {
		return graphicChipset;
	}

	public void setGraphicChipset(String graphicChipset) {
		this.graphicChipset = graphicChipset;
	}

	public String getGraphicName() {
		return graphicName;
	}

	public void setGraphicName(String graphicName) {
		this.graphicName = graphicName;
	}

	public String getRamMaker() {
		return ramMaker;
	}

	public void setRamMaker(String ramMaker) {
		this.ramMaker = ramMaker;
	}

	public String getRamGen() {
		return ramGen;
	}

	public void setRamGen(String ramGen) {
		this.ramGen = ramGen;
	}

	public String getRamVol() {
		return ramVol;
	}

	public void setRamVol(String ramVol) {
		this.ramVol = ramVol;
	}

	public String getSsdMaker() {
		return ssdMaker;
	}

	public void setSsdMaker(String ssdMaker) {
		this.ssdMaker = ssdMaker;
	}

	public String getSsdVol() {
		return ssdVol;
	}

	public void setSsdVol(String ssdVol) {
		this.ssdVol = ssdVol;
	}

	public String getHddMaker() {
		return hddMaker;
	}

	public void setHddMaker(String hddMaker) {
		this.hddMaker = hddMaker;
	}

	public String getHddVol() {
		return hddVol;
	}

	public void setHddVol(String hddVol) {
		this.hddVol = hddVol;
	}

	public String getPowerMaker() {
		return powerMaker;
	}

	public void setPowerMaker(String powerMaker) {
		this.powerMaker = powerMaker;
	}

	public String getPowerCap() {
		return powerCap;
	}

	public void setPowerCap(String powerCap) {
		this.powerCap = powerCap;
	}

	public String getSellTime() {
		return sellTime;
	}

	public void setSellTime(String sellTime) {
		this.sellTime = sellTime;
	}

	public int getBaseBranch() {
		return baseBranch;
	}

	public void setBaseBranch(int baseBranch) {
		this.baseBranch = baseBranch;
	}
	
	
}
