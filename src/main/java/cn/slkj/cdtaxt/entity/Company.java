package cn.slkj.cdtaxt.entity;

/**
 * 
 * @ClassName: Company
 * @Description:
 * @author maxuhui
 *
 */
public class Company {
	private String id;
	private String compCode;// 公 司 编号
	private String compName;// 公 司 名 称
	private String linkman;//联系人
	private String mobile;// 手机号码
	private String email;// email
	private String qq;// QQ
	
	private int level;// 公司级别
	private String bCompany;// 上级公司
	
	private String corporate;// 企 业 法 人
	private String contactMenber;// 联系人
	private String contactWay;// 联系方式
	private String organizationCode;// 企业组织机构代码
	private String businessLicense;// 营业执照号
	private String registeredCapital;// 企业注册资金
	private String compAddress;// 公司地址
	private String introduction;// 简介（公司营业范围）
	private String xkz;// 许可证号
	private String remarks;// 备注
	private Double sfbz;// 收费标准
	
	private int status;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompCode() {
		return compCode;
	}
	public void setCompCode(String compCode) {
		this.compCode = compCode;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getbCompany() {
		return bCompany;
	}
	public void setbCompany(String bCompany) {
		this.bCompany = bCompany;
	}
	public String getCorporate() {
		return corporate;
	}
	public void setCorporate(String corporate) {
		this.corporate = corporate;
	}
	public String getContactMenber() {
		return contactMenber;
	}
	public void setContactMenber(String contactMenber) {
		this.contactMenber = contactMenber;
	}
	public String getContactWay() {
		return contactWay;
	}
	public void setContactWay(String contactWay) {
		this.contactWay = contactWay;
	}
	public String getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}
	public String getBusinessLicense() {
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getRegisteredCapital() {
		return registeredCapital;
	}
	public void setRegisteredCapital(String registeredCapital) {
		this.registeredCapital = registeredCapital;
	}
	public String getCompAddress() {
		return compAddress;
	}
	public void setCompAddress(String compAddress) {
		this.compAddress = compAddress;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getXkz() {
		return xkz;
	}
	public void setXkz(String xkz) {
		this.xkz = xkz;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Double getSfbz() {
		return sfbz;
	}
	public void setSfbz(Double sfbz) {
		this.sfbz = sfbz;
	}
	@Override
	public String toString() {
		return "Company [id=" + id + ", compCode=" + compCode + ", compName=" + compName + ", linkman=" + linkman + ", mobile=" + mobile + "]";
	}

}
