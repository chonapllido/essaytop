package stm.com.program.login.web;

import stm.com.generic.web.GenericCommand;

public class LoginCommand extends GenericCommand{

	private static final long serialVersionUID = 1L;

	private String id;
	private String user_login;
	private String user_email;
	private String virtual_money;
	private String position_id;
	private String user_price;
	
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the user_login
	 */
	public String getUser_login() {
		return user_login;
	}
	/**
	 * @param user_login the user_login to set
	 */
	public void setUser_login(String user_login) {
		this.user_login = user_login;
	}
	/**
	 * @return the user_email
	 */
	public String getUser_email() {
		return user_email;
	}
	/**
	 * @param user_email the user_email to set
	 */
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	/**
	 * @return the virtual_money
	 */
	public String getVirtual_money() {
		return virtual_money;
	}
	/**
	 * @param virtual_money the virtual_money to set
	 */
	public void setVirtual_money(String virtual_money) {
		this.virtual_money = virtual_money;
	}
	/**
	 * @return the position_id
	 */
	public String getPosition_id() {
		return position_id;
	}
	/**
	 * @param position_id the position_id to set
	 */
	public void setPosition_id(String position_id) {
		this.position_id = position_id;
	}
	
}