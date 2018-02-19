package stm.com.program.paypal.payment.web;

import stm.com.generic.web.GenericCommand;

public class PaypalPaymentCommand extends GenericCommand {

	private static final long serialVersionUID = 1L;

	private String[] paypal_ids;
	private String paypal_id;
	private String user_email;
	private String amount;
	private String date;
	private String start_date;
	private String end_date;
	
	/**
	 * @return the paypal_ids
	 */
	public String[] getPaypal_ids() {
		return paypal_ids;
	}
	/**
	 * @param paypal_ids the paypal_ids to set
	 */
	public void setPaypal_ids(String[] paypal_ids) {
		this.paypal_ids = paypal_ids;
	}
	/**
	 * @return the paypal_id
	 */
	public String getPaypal_id() {
		return paypal_id;
	}
	/**
	 * @param paypal_id the paypal_id to set
	 */
	public void setPaypal_id(String paypal_id) {
		this.paypal_id = paypal_id;
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
	 * @return the amount
	 */
	public String getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(String amount) {
		this.amount = amount;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the start_date
	 */
	public String getStart_date() {
		return start_date;
	}
	/**
	 * @param start_date the start_date to set
	 */
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	/**
	 * @return the end_date
	 */
	public String getEnd_date() {
		return end_date;
	}
	/**
	 * @param end_date the end_date to set
	 */
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
	
}