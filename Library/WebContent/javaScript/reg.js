/**
 * 
 */

function reg_Chk()
{
	if(document.reg_f.id.value == 0)
		{
			alert("아이디를 입력하세요!");
			reg_f.id.focus();
			return;
		}
	
	if(document.reg_f.id.length < 6)
	{
		alert("아이디는 최소 6자리 입니다.");
		reg_f.id.focus();
		return;
	}
	
	if(document.reg_f.pw.value == 0)
	{
		alert("비밀번호를 입력하세요!");
		reg_f.pw.focus();
		return;
	}
	
	if(document.reg_f.pw.length < 8 )
	{
		alert("비밀번호는 최소 8자리 입니다.");
		reg_f.pw.focus();
		return;
	}
	
	if(document.reg_f.pw.value != document.reg_f.pw_check.value)
	{
		alert("입력한 비밀번호가 다릅니다!");
		reg_f.pw.focus();
		return;
	}
	
	if(document.reg_f.name.value == 0)
	{
		alert("이름을 입력하세요!");
		reg_f.name.focus();
		return;
	}
	
	if(document.reg_f.email.value == 0)
	{
		alert("이메일을 입력하세요!");
		reg_f.email.focus();
		return;
	}
	
	document.reg_f.submit();
}