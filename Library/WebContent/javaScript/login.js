/**
 * 
 */

function log_chk()
{
	if(document.log_f.id.value == 0)
	{
		alert("아이디를 입력하세요!");
		log_f.id.focus();
		return;
	}
	
	if(document.log_f.pw.value == 0)
	{
		alert("비밀번호를 입력하세요!");
		log_f.pw.focus();
		return;
	}
	document.log_f.submit();
}