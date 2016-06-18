package models;

import java.util.Date;

public class Donor implements Comparable<Donor> {

	private String dnr_id;
	private String dnr_passowrd;
	private String confirm_passowrd;
	private String dnr_name;
	private String dnr_bgroup;
	private String dnr_address_l1;
	private String dnr_address_l2;
	private String dnr_city;
	private long dnr_phone_home;
	private long dnr_phone_work;
	private long dnr_phone_mobile;
	private String dnr_email;
	private int dnr_age;
	private Character dnr_sex;
	private String dnr_state;
	private Date dnr_registration_date;
	private Date dnr_birthdate;

	public Donor() {
		// TODO Auto-generated constructor stub
	}

	public Donor(String dnr_id, String dnr_passowrd) {
		super();
		this.dnr_id = dnr_id;
		this.dnr_passowrd = dnr_passowrd;
	}

	public Donor(String dnr_id, String dnr_passowrd, String confirm_passowrd) {
		super();
		this.dnr_id = dnr_id;
		this.dnr_passowrd = dnr_passowrd;
		this.confirm_passowrd = confirm_passowrd;
	}

	public Donor(String dnr_id, String dnr_name, String dnr_bgroup, String dnr_address_l1, String dnr_address_l2,
			String dnr_city, long dnr_phone_home, long dnr_phone_work, long dnr_phone_mobile, String dnr_email,
			int dnr_age, Character dnr_sex, String dnr_state, Date dnr_registration_date, Date dnr_birthdate) {
		super();
		this.dnr_id = dnr_id;
		this.dnr_name = dnr_name;
		this.dnr_bgroup = dnr_bgroup;
		this.dnr_address_l1 = dnr_address_l1;
		this.dnr_address_l2 = dnr_address_l2;
		this.dnr_city = dnr_city;
		this.dnr_phone_home = dnr_phone_home;
		this.dnr_phone_work = dnr_phone_work;
		this.dnr_phone_mobile = dnr_phone_mobile;
		this.dnr_email = dnr_email;
		this.dnr_age = dnr_age;
		this.dnr_sex = dnr_sex;
		this.dnr_state = dnr_state;
		this.dnr_registration_date = dnr_registration_date;
		this.dnr_birthdate = dnr_birthdate;
	}

	public String getDnr_id() {
		return dnr_id;
	}

	public void setDnr_id(String dnr_id) {
		this.dnr_id = dnr_id;
	}

	public String getDnr_name() {
		return dnr_name;
	}

	public void setDnr_name(String dnr_name) {
		this.dnr_name = dnr_name;
	}

	public String getDnr_bgroup() {
		return dnr_bgroup;
	}

	public void setDnr_bgroup(String dnr_bgroup) {
		this.dnr_bgroup = dnr_bgroup;
	}

	public String getDnr_address_l1() {
		return dnr_address_l1;
	}

	public void setDnr_address_l1(String dnr_address_l1) {
		this.dnr_address_l1 = dnr_address_l1;
	}

	public String getDnr_address_l2() {
		return dnr_address_l2;
	}

	public void setDnr_address_l2(String dnr_address_l2) {
		this.dnr_address_l2 = dnr_address_l2;
	}

	public String getDnr_city() {
		return dnr_city;
	}

	public void setDnr_city(String dnr_city) {
		this.dnr_city = dnr_city;
	}

	public long getDnr_phone_home() {
		return dnr_phone_home;
	}

	public void setDnr_phone_home(long dnr_phone_home) {
		this.dnr_phone_home = dnr_phone_home;
	}

	public long getDnr_phone_work() {
		return dnr_phone_work;
	}

	public void setDnr_phone_work(long dnr_phone_work) {
		this.dnr_phone_work = dnr_phone_work;
	}

	public long getDnr_phone_mobile() {
		return dnr_phone_mobile;
	}

	public void setDnr_phone_mobile(long dnr_phone_mobile) {
		this.dnr_phone_mobile = dnr_phone_mobile;
	}

	public String getDnr_email() {
		return dnr_email;
	}

	public void setDnr_email(String dnr_email) {
		this.dnr_email = dnr_email;
	}

	public int getDnr_age() {
		return dnr_age;
	}

	public void setDnr_age(int dnr_age) {
		this.dnr_age = dnr_age;
	}

	public Character getDnr_sex() {
		return dnr_sex;
	}

	public void setDnr_sex(Character dnr_sex) {
		this.dnr_sex = dnr_sex;
	}

	public String getDnr_state() {
		return dnr_state;
	}

	public void setDnr_state(String dnr_state) {
		this.dnr_state = dnr_state;
	}

	public Date getDnr_registration_date() {
		return dnr_registration_date;
	}

	public void setDnr_registration_date(Date dnr_registration_date) {
		this.dnr_registration_date = dnr_registration_date;
	}

	public Date getDnr_birthdate() {
		return dnr_birthdate;
	}

	public void setDnr_birthdate(Date dnr_birthdate) {
		this.dnr_birthdate = dnr_birthdate;
	}

	@Override
	public int compareTo(Donor o) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("\nDonor [dnr_id=");
		builder.append(dnr_id);
		builder.append(",\n dnr_name=");
		builder.append(dnr_name);
		builder.append(",\n dnr_bgroup=");
		builder.append(dnr_bgroup);
		builder.append(",\n dnr_address_l1=");
		builder.append(dnr_address_l1);
		builder.append(",\n dnr_address_l2=");
		builder.append(dnr_address_l2);
		builder.append(",\n dnr_city=");
		builder.append(dnr_city);
		builder.append(",\n dnr_phone_home=");
		builder.append(dnr_phone_home);
		builder.append(",\n dnr_phone_work=");
		builder.append(dnr_phone_work);
		builder.append(",\n dnr_phone_mobile=");
		builder.append(dnr_phone_mobile);
		builder.append(",\n dnr_email=");
		builder.append(dnr_email);
		builder.append(",\n dnr_age=");
		builder.append(dnr_age);
		builder.append(",\n dnr_sex=");
		builder.append(dnr_sex);
		builder.append(",\n dnr_state=");
		builder.append(dnr_state);
		builder.append(",\n dnr_registration_date=");
		builder.append(dnr_registration_date);
		builder.append(",\n dnr_birthdate=");
		builder.append(dnr_birthdate);
		builder.append("]");
		return builder.toString();
	}
	
	
}
