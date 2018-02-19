package stm.com.program.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stm.com.generic.service.GenericService;
import stm.com.program.user.web.UserCommand;

public interface UserService extends GenericService<UserCommand> {
	
	public int checkEmailDuplicate(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public UserCommand getLogin(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public UserCommand getUserVm(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	public UserCommand getPassword(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public int getRegisterByMonth(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public UserCommand getUserWithVm(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public UserCommand getListAll(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;

	public int addVirtualMoney(UserCommand cmd, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
}
