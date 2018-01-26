package cn.slkj.cdtaxt.entity;

public class Vehicle {
	private String id;
	private String pkey;//档案号
	/* ---落籍信息 */
	private String carPlateNo;// 车牌号
	private String carPlateCol;// 车牌颜色
	private String carPlateColText;// 车牌颜色名称
	private String carType2;// 车辆类型
	private int ifDangerVehicle;// 是否危险品车
	private String transportNo;// 道路运输证号
	private String carAddProvince;// 所属地区省
	private String carAddCity;// 所属地区市
	private String carAddCounty; // 所属地区县

	/* ---车辆基本信息 */
	private String hgzDataSource;// 汽车制造厂
	private String vin2;// 车辆识别代码/车架号
	private String engineNo;// 发动机号
	private String carBrand;// 车辆品牌
	private String carBrandText;// 车辆品牌
	private int quality;// 总质量(kg)
	private int approvedQua;// 核定载质量(kg)
	private int axleCount;// 轴数
	private int tyreCount;// 轮胎数
	private String tyreSpecificate;// 轮胎规格
	private int dragQua;// 准牵引总质量(kg)
	private int outLen;// 外廓尺寸(mm)长
	private int outwide;// 外廓尺寸(mm)宽
	private int outhigh;// 外廓尺寸(mm)高
	private int inlen;// 货箱内部尺寸(mm)长
	private int inwide;// 货箱内部尺寸(mm)宽
	private int inhigh;// 货箱内部尺寸(mm)高
	private String vehicleModel;// 车辆型号
	private String carColor;// 车身颜色
	private String carProductEndDateString;// 车辆出厂日期
	/* ---客户信息 */
	private int customerType;// 客户类型
	private String customerName;// 客户名称
	private String linkman;// 联系人
	private String linkmanTel;// 联系人电话
	private String carOwner;// 车主
	private String carOwnerTel;// 车主电话
	private String driver1;// 驾驶员1
	private String driver1Tel;// 驾驶员1电话
	private String driver2;// 驾驶员2
	private String driver2Tel;// 驾驶员2电话
	/* ---终端信息 */
	private String simNo;// SIM卡卡号
	private String terminalId;// 终端ID
	private String terminalType;// 终端型号
	private String terminalGYS;// 终端供应商
	/*---入网信息*/
	private String inNetDateString;// 入网日期
	private String memo;// 备注
	
	
	private String carOwnerPhoto;//车主照片路径
	private String carPhoto;//车辆照片路径
	private String certificatePhoto;//车辆登记证照片路径
	private String certificatePhoto2;//车辆登记证照片2路径
	private String driverPhoto;//车辆合格证/行驶证照片路径
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPkey() {
		return pkey;
	}
	public void setPkey(String pkey) {
		this.pkey = pkey;
	}
	public String getCarPlateNo() {
		return carPlateNo;
	}
	public void setCarPlateNo(String carPlateNo) {
		this.carPlateNo = carPlateNo;
	}
	public String getCarPlateCol() {
		return carPlateCol;
	}
	public void setCarPlateCol(String carPlateCol) {
		this.carPlateCol = carPlateCol;
	}
	public String getCarType2() {
		return carType2;
	}
	public void setCarType2(String carType2) {
		this.carType2 = carType2;
	}
	public int getIfDangerVehicle() {
		return ifDangerVehicle;
	}
	public void setIfDangerVehicle(int ifDangerVehicle) {
		this.ifDangerVehicle = ifDangerVehicle;
	}
	public String getTransportNo() {
		return transportNo;
	}
	public void setTransportNo(String transportNo) {
		this.transportNo = transportNo;
	}
	public String getCarAddProvince() {
		return carAddProvince;
	}
	public void setCarAddProvince(String carAddProvince) {
		this.carAddProvince = carAddProvince;
	}
	public String getCarAddCity() {
		return carAddCity;
	}
	public void setCarAddCity(String carAddCity) {
		this.carAddCity = carAddCity;
	}
	public String getCarAddCounty() {
		return carAddCounty;
	}
	public void setCarAddCounty(String carAddCounty) {
		this.carAddCounty = carAddCounty;
	}
	public String getHgzDataSource() {
		return hgzDataSource;
	}
	public void setHgzDataSource(String hgzDataSource) {
		this.hgzDataSource = hgzDataSource;
	}
	public String getVin2() {
		return vin2;
	}
	public void setVin2(String vin2) {
		this.vin2 = vin2;
	}
	public String getEngineNo() {
		return engineNo;
	}
	public void setEngineNo(String engineNo) {
		this.engineNo = engineNo;
	}
	public String getCarBrand() {
		return carBrand;
	}
	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}
	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
	public int getApprovedQua() {
		return approvedQua;
	}
	public void setApprovedQua(int approvedQua) {
		this.approvedQua = approvedQua;
	}
	public int getAxleCount() {
		return axleCount;
	}
	public void setAxleCount(int axleCount) {
		this.axleCount = axleCount;
	}
	public int getTyreCount() {
		return tyreCount;
	}
	public void setTyreCount(int tyreCount) {
		this.tyreCount = tyreCount;
	}
	public String getTyreSpecificate() {
		return tyreSpecificate;
	}
	public void setTyreSpecificate(String tyreSpecificate) {
		this.tyreSpecificate = tyreSpecificate;
	}
	public int getDragQua() {
		return dragQua;
	}
	public void setDragQua(int dragQua) {
		this.dragQua = dragQua;
	}
	public int getOutLen() {
		return outLen;
	}
	public void setOutLen(int outLen) {
		this.outLen = outLen;
	}
	public int getOutwide() {
		return outwide;
	}
	public void setOutwide(int outwide) {
		this.outwide = outwide;
	}
	public int getOuthigh() {
		return outhigh;
	}
	public void setOuthigh(int outhigh) {
		this.outhigh = outhigh;
	}
	public int getInlen() {
		return inlen;
	}
	public void setInlen(int inlen) {
		this.inlen = inlen;
	}
	public int getInwide() {
		return inwide;
	}
	public void setInwide(int inwide) {
		this.inwide = inwide;
	}
	public int getInhigh() {
		return inhigh;
	}
	public void setInhigh(int inhigh) {
		this.inhigh = inhigh;
	}
	
	public String getVehicleModel() {
		return vehicleModel;
	}
	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}
	public String getCarColor() {
		return carColor;
	}
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	public String getCarProductEndDateString() {
		return carProductEndDateString;
	}
	public void setCarProductEndDateString(String carProductEndDateString) {
		this.carProductEndDateString = carProductEndDateString;
	}
	public int getCustomerType() {
		return customerType;
	}
	public void setCustomerType(int customerType) {
		this.customerType = customerType;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getLinkmanTel() {
		return linkmanTel;
	}
	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}
	public String getCarOwner() {
		return carOwner;
	}
	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
	}
	public String getCarOwnerTel() {
		return carOwnerTel;
	}
	public void setCarOwnerTel(String carOwnerTel) {
		this.carOwnerTel = carOwnerTel;
	}
	public String getDriver1() {
		return driver1;
	}
	public void setDriver1(String driver1) {
		this.driver1 = driver1;
	}
	public String getDriver1Tel() {
		return driver1Tel;
	}
	public void setDriver1Tel(String driver1Tel) {
		this.driver1Tel = driver1Tel;
	}
	public String getDriver2() {
		return driver2;
	}
	public void setDriver2(String driver2) {
		this.driver2 = driver2;
	}
	public String getDriver2Tel() {
		return driver2Tel;
	}
	public void setDriver2Tel(String driver2Tel) {
		this.driver2Tel = driver2Tel;
	}
	public String getSimNo() {
		return simNo;
	}
	public void setSimNo(String simNo) {
		this.simNo = simNo;
	}
	public String getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}
	public String getTerminalType() {
		return terminalType;
	}
	public void setTerminalType(String terminalType) {
		this.terminalType = terminalType;
	}
	public String getTerminalGYS() {
		return terminalGYS;
	}
	public void setTerminalGYS(String terminalGYS) {
		this.terminalGYS = terminalGYS;
	}
	public String getInNetDateString() {
		return inNetDateString;
	}
	public void setInNetDateString(String inNetDateString) {
		this.inNetDateString = inNetDateString;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getCarOwnerPhoto() {
		return carOwnerPhoto;
	}
	public void setCarOwnerPhoto(String carOwnerPhoto) {
		this.carOwnerPhoto = carOwnerPhoto;
	}
	public String getCarPhoto() {
		return carPhoto;
	}
	public void setCarPhoto(String carPhoto) {
		this.carPhoto = carPhoto;
	}
	public String getCertificatePhoto() {
		return certificatePhoto;
	}
	public void setCertificatePhoto(String certificatePhoto) {
		this.certificatePhoto = certificatePhoto;
	}
	public String getCertificatePhoto2() {
		return certificatePhoto2;
	}
	public void setCertificatePhoto2(String certificatePhoto2) {
		this.certificatePhoto2 = certificatePhoto2;
	}
	public String getDriverPhoto() {
		return driverPhoto;
	}
	public void setDriverPhoto(String driverPhoto) {
		this.driverPhoto = driverPhoto;
	}
	public String getCarBrandText() {
		return carBrandText;
	}
	public void setCarBrandText(String carBrandText) {
		this.carBrandText = carBrandText;
	}
	public String getCarPlateColText() {
		return carPlateColText;
	}
	public void setCarPlateColText(String carPlateColText) {
		this.carPlateColText = carPlateColText;
	}
	@Override
	public String toString() {
		return "Vehicle [id=" + id + ", pkey=" + pkey + ", carPlateNo=" + carPlateNo + ", carPlateCol=" + carPlateCol + ", carType2=" + carType2 + ", ifDangerVehicle="
				+ ifDangerVehicle + ", transportNo=" + transportNo + ", carAddProvince=" + carAddProvince + ", carAddCity=" + carAddCity + ", carAddCounty=" + carAddCounty
				+ ", hgzDataSource=" + hgzDataSource + ", vin2=" + vin2 + ", engineNo=" + engineNo + ", carBrand=" + carBrand + ", quality=" + quality + ", approvedQua="
				+ approvedQua + ", axleCount=" + axleCount + ", tyreCount=" + tyreCount + ", tyreSpecificate=" + tyreSpecificate + ", dragQua=" + dragQua + ", outLen=" + outLen
				+ ", outwide=" + outwide + ", outhigh=" + outhigh + ", inlen=" + inlen + ", inwide=" + inwide + ", inhigh=" + inhigh + ", vehicleModel=" + vehicleModel
				+ ", carColor=" + carColor + ", carProductEndDateString=" + carProductEndDateString + ", customerType=" + customerType + ", customerName=" + customerName
				+ ", linkman=" + linkman + ", linkmanTel=" + linkmanTel + ", carOwner=" + carOwner + ", carOwnerTel=" + carOwnerTel + ", driver1=" + driver1 + ", driver1Tel="
				+ driver1Tel + ", driver2=" + driver2 + ", driver2Tel=" + driver2Tel + ", simNo=" + simNo + ", terminalId=" + terminalId + ", terminalType=" + terminalType
				+ ", terminalGYS=" + terminalGYS + ", inNetDateString=" + inNetDateString + ", memo=" + memo + "]";
	}
 

}
