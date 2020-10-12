package book.vo;

import java.sql.Timestamp;

public class BookVO {
	private String bookId;
	private String bookName;
	private String bookWriter;
	private String bookPub;
	private String bookGe;
	private Timestamp rentDate;
	private Timestamp endDate;
	
	public Timestamp getRentDate() {
		return rentDate;
	}
	public void setRentDate(Timestamp rentDate) {
		this.rentDate = rentDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	
	public BookVO()
	{
		
	}
	
	public BookVO(String bookName, String bookWriter, String bookPub, String bookGe)
	{	
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPub = bookPub;
		this.bookGe = bookGe;
	}
	public BookVO(String bookId, String bookName, String bookWriter, String bookPub, String bookGe) {
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPub = bookPub;
		this.bookGe = bookGe;
	}
	public BookVO(String bookName, String bookWriter, String bookPub) {
		super();
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPub = bookPub;
	}
	public BookVO(Timestamp rentDate, Timestamp endDate) {
		super();
		this.rentDate = rentDate;
		this.endDate = endDate;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
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
}
