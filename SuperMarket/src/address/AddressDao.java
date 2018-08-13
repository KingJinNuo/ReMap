package address;

import java.util.List;

public interface AddressDao {
 public List<Address> selectByUserId(String id);
 public int AddNewAddress(Address a);
 public Address selectById(int id);
 public int deleteAddress(int id);
 }
