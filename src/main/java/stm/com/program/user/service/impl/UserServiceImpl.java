package stm.com.program.user.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import stm.com.generic.service.impl.GenericServiceImpl;
import stm.com.program.user.service.UserService;
import stm.com.program.user.web.UserCommand;

@Service("userService")
public class UserServiceImpl extends GenericServiceImpl<UserDao, UserCommand> implements UserService {

	public int checkEmailDuplicate(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {

		UserDao dao = getDao();
		return dao.checkEmailDuplicate(cmd);

	}
	
	public UserCommand getLogin(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {

		UserDao dao = getDao();
		return dao.getLogin(cmd);

	}
	public UserCommand getUserVm(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception {

		UserDao dao = getDao();
		return dao.getUserVm(cmd);

	}
	
	public UserCommand getPassword(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		UserDao dao = getDao();
		return dao.getPassword(cmd);
	}
	
	public int getRegisterByMonth(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		UserDao dao = getDao();
		return dao.getRegisterByMonth(cmd);
	}
	
	public UserCommand getUserWithVm(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		UserDao dao = getDao();
		cmd.setList(dao.getUserWithVm(cmd));
		
		if ("Y".equals(StringUtils.defaultIfEmpty(cmd.getPage_use_at(), "N")) && "Y".equals(StringUtils.defaultIfEmpty(cmd.getPage_count_use_at(), "N"))) {
			cmd.setTotal_record_count(dao.getUserWithVmCount(cmd));
		} else {
			cmd.setTotal_record_count(dao.getUserWithVm(cmd).size());
		}
		
		return cmd;
	}
	
	public UserCommand getListAll(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		UserDao dao = getDao();
		cmd.setList(dao.getListAll(cmd));
		
		if ("Y".equals(StringUtils.defaultIfEmpty(cmd.getPage_use_at(), "N")) && "Y".equals(StringUtils.defaultIfEmpty(cmd.getPage_count_use_at(), "N"))) {
			cmd.setTotal_record_count(dao.getListAllCount(cmd));
		} else {
			cmd.setTotal_record_count(dao.getListAll(cmd).size());
		}
		return cmd;
	}
	
	public int addVirtualMoney(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		UserDao dao = getDao();
		return dao.addVirtualMoney(cmd);
	}
	
}
