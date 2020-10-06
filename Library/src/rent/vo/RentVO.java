package rent.vo;

import java.sql.Timestamp;

public class RentVO {
	private String rentNum;
	private String bookId;
	private String userId;
	private String bookRen;
	private String userName;
	private String bookName;
	private String bookWriter;
	private String bookPub;
	private String bookGe;
	private Timestamp rentDate;
	private String rentEnd;
	
	public String getRentNum() {
		return rentNum;
	}

	public void setRentNum(String rentNum) {
		this.rentNum = rentNum;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBookRen() {
		return bookRen;
	}

	public void setBookRen(String bookRen) {
		this.bookRen = bookRen;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWrier) {
		this.bookWriter = bookWrier;
	}

	public String getBookPub() {
		return bookPub;
	}

	public void setBookPub(String bookPub) {
		this.bookPub = bookPub;
	}

	public String getBookGe() {
		return bookGe;
	}

	public void setBookGe(String bookGe) {
		this.bookGe = bookGe;
	}

	public Timestamp getRentDate() {
		return rentDate;
	}

	public void setRentDate(Timestamp rentDate) {
		this.rentDate = rentDate;
	}

	public String getRentEnd() {
		return rentEnd;
	}

	public void setRentEnd(String rentEnd) {
		this.rentEnd = rentEnd;
	}

	
	public RentVO() {
		
	}
	
	public RentVO(String bookName, String bookWriter, String bookPub, String bookGe, String userName, Timestamp rentDate)
	{
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPub = bookPub;
		this.bookGe = bookGe;
		this.userName = userName;
		this.rentDate = rentDate;
	}
}
