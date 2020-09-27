/**
 * 
 */

function book_chk(){
	if(book_ins_f.book_id.value == 0)
	{
		alert("일련번호를 입력하세요.");
		book_ins_f.book_id.focus();
		return;
	}
	
	if(book_ins_f.book_name.value == 0)
	{
		alert("책 이름을 입력하세요.");
		book_ins_f.book_name.focus();
		return;
	}
	
	if(book_ins_f.book_writer.value == 0)
	{
		alert("작가를 입력하세요.");
		book_ins_f.book_writer.focus();
		return;
	}
	
	if(book_ins_f.book_pub.value == 0)
	{
		alert("출판사를 입력하세요.");
		book_ins_f.book_pub.focus();
		return;
	}
	document.ins_f.submit();
}