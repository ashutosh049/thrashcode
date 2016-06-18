package daoImpl;

import java.util.List;

import daos.DonorDao;
import models.Donor;
import util.CommonUtil;

import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
//import java.util.Date;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class DonorDaoImpl implements DonorDao {

	private static final Logger logger = LoggerFactory.getLogger(DonorDaoImpl.class);

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}


	@Override
	public int createDonor(Donor donor) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		java.util.Date d1 = null;
		java.util.Date d2 = null;
		try {
			d1 = (java.util.Date) sdf.parse("2016-01-16 00:00:00");
			d2 = (java.util.Date) sdf.parse("2016-01-17 00:00:00");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		donor.setDnr_id("DNR_003");

		String donorId = commonUtil.generateDonorId(donor.getDnr_name());
		String donorPassword = commonUtil.generateDonorPassword(donor.getDnr_name(), 22, 8);
		String query1 = "insert into poscode.details_donor values('" + donorId + "','" + donor.getDnr_name() + "','"
				+ donor.getDnr_bgroup() + "','" + donor.getDnr_address_l1() + "','" + donor.getDnr_address_l2() + "','"
				+ donor.getDnr_city() + "','" + donor.getDnr_phone_home() + "','" + donor.getDnr_phone_work() + "','"
				+ donor.getDnr_phone_mobile() + "','" + donor.getDnr_email() + "','" + donor.getDnr_age() + "','"
				+ donor.getDnr_sex() + "','" + donor.getDnr_state() + "','" + new java.sql.Date(d1.getTime()) + "','"
				+ new java.sql.Date(d2.getTime()) + "')";

		String query2 = "INSERT INTO poscode.credentials values('" + donorId + "','" + donorPassword + "')";

		int q1 = commonUtil.getJdbcTemplate().update(query1);
		int q2 = commonUtil.getJdbcTemplate().update(query2);

		if (q1 > 0 && q2 > 0) {
			return 1;
		}
		return 0;
	}

	@Override
	public boolean updateDonor(Donor donor) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteDonor(Donor donor) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteDonor(String argDonorId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Donor getDonor(String argDonorId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Donor> getAllDonor() {
		// TODO Auto-generated method stub
		return null;
	}

}
