package web.member.all;

public class MemberModel {
	String mem_id;
	String mem_pw;
	String mem_nickname;
	String mem_email;
	String mem_mobile;
	int mem_type;
	
	public MemberModel() {
		super();
	}
	
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_mobile() {
		return mem_mobile;
	}

	public void setMem_mobile(String mem_mobile) {
		this.mem_mobile = mem_mobile;
	}

	public int getMem_type() {
		return mem_type;
	}

	public void setMem_type(int mem_type) {
		this.mem_type = mem_type;
	}

}
