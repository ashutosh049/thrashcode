package daos;

import java.util.List;

import models.Donor;

public interface DonorDao {
	public int createDonor(Donor donor);
	public boolean updateDonor(Donor donor);
	public boolean deleteDonor(Donor donor);
	public boolean deleteDonor(String argDonorId);
	public Donor getDonor(String argDonorId);
	public List<Donor> getAllDonor();
}
