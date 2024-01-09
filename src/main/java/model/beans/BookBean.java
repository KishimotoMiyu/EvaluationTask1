package model.beans;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;


public class BookBean implements Serializable{
	
	private String janCode;
	private String isbnCode;
	private String bookName;
	private String bookKana;	
	private int price;
	private Date issueDate;	
	private Timestamp createDateTime;	
	private Timestamp updateDateTime;
	
	public BookBean(String janCode, String isbnCode, String bookName, String bookKana, int price, Date issueDate,
			Timestamp createDateTime, Timestamp updateDateTime) {
		super();
		this.janCode = janCode;
		this.isbnCode = isbnCode;
		this.bookName = bookName;
		this.bookKana = bookKana;
		this.price = price;
		this.issueDate = issueDate;
		this.createDateTime = createDateTime;
		this.updateDateTime = updateDateTime;
	}
	
	public BookBean(){}

	public String getJanCode() {
		return janCode;
	}

	public void setJanCode(String janCode) {
		this.janCode = janCode;
	}

	public String getIsbnCode() {
		return isbnCode;
	}

	public void setIsbnCode(String isbnCode) {
		this.isbnCode = isbnCode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookKana() {
		return bookKana;
	}

	public void setBookKana(String bookKana) {
		this.bookKana = bookKana;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public Timestamp getCreateDateTime() {
		return createDateTime;
	}

	public void setCreateDateTime(Timestamp createDateTime) {
		this.createDateTime = createDateTime;
	}

	public Timestamp getUpdateDateTime() {
		return updateDateTime;
	}

	public void setUpdateDateTime(Timestamp updateDateTime) {
		this.updateDateTime = updateDateTime;
	}
	

}