package web.plan.all;

public class PlanModel {

private int idx;
private String user_name;
private String subject;
private String content;
private String reg_datetime;
private String content2;
private String content3;
private String content4;
private String content5;

private Integer read_count;
private Integer planlike;
private String maplat;
private String maplng;

public int getIdx() {
    return idx;
}
public void setIdx(int idx) {
    this.idx = idx;
}
public String getUser_name() {
    return user_name;
}
public void setUser_name(String user_name) {
    this.user_name = user_name;
}
public String getSubject() {
    return subject;
}
public void setSubject(String subject) {
    this.subject = subject;
}
public String getContent() {
    return content;
}
public void setContent(String content) {
    this.content = content;
}

public String getContent2() {
	return content2;
}
public void setContent2(String content2) {
	this.content2 = content2;
}
public String getReg_datetime() {
	return reg_datetime;
}
public void setReg_datetime(String reg_datetime) {
	this.reg_datetime = reg_datetime;
}
public Integer getRead_count() {
	return read_count;
}
public void setRead_count(Integer read_count) {
	this.read_count = read_count;
}
public Integer getPlanlike() {
	return planlike;
}
public void setPlanlike(Integer planlike) {
	this.planlike = planlike;
}
public String getMaplat() {
	return maplat;
}
public void setMaplat(String maplat) {
	this.maplat = maplat;
}
public String getMaplng() {
	return maplng;
}
public void setMaplng(String maplng) {
	this.maplng = maplng;
}
public String getContent3() {
	return content3;
}
public void setContent3(String content3) {
	this.content3 = content3;
}
public String getContent4() {
	return content4;
}
public void setContent4(String content4) {
	this.content4 = content4;
}
public String getContent5() {
	return content5;
}
public void setContent5(String content5) {
	this.content5 = content5;
}

}