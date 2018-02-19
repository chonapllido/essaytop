package stm.com.program.user.service.impl;

import java.util.List;

import stm.com.generic.service.impl.GenericDao;
import stm.com.program.user.web.UserCommand;

public interface UserDao extends GenericDao<UserCommand> {
	
	public int checkEmailDuplicate(UserCommand cmd);
	
	public UserCommand getLogin(UserCommand cmd);
	
	public UserCommand getUserVm(UserCommand cmd);
	
	public UserCommand getPassword(UserCommand cmd);
	
	public int getRegisterByMonth(UserCommand cmd);
	
	public int getUserWithVmCount(UserCommand cmd);
	
	public List<UserCommand> getUserWithVm(UserCommand cmd);
	
	public int getListAllCount(UserCommand cmd);
	
	public List<UserCommand> getListAll(UserCommand cmd);
	
	public int addVirtualMoney(UserCommand cmd);
}
