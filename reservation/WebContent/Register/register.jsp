<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <style>
        #wrap{
            width:530px;
            margin-left:auto;
            margin-right:auto;
            text-align:center;
        }

        table{
            border:3px solid skyblue
        }

        td{
            border:1px solid skyblue
        }

        #title{
            background-color:skyblue
        }
    </style>

</head>
<body>
<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
<div id="wrap">
    <br><br>
    <b><font size="6" color="gray">회원가입</font></b>
    <br><br><br>

    <form action="registerOk.jsp" method="post">
        <table>
            <tr>
                <td id="title">아이디</td>
                <td>
                    <input type="text" name="id" maxlength="20">
                    <input type="button" value="중복확인" >
                </td>
            </tr>

            <tr>
                <td id="title">비밀번호</td>
                <td>
                    <input type="password" name="password" maxlength="15">
                </td>
            </tr>

            <tr>
                <td id="title">비밀번호 확인</td>
                <td>
                    <input type="password" name="password" maxlength="15">
                </td>
            </tr>

            <tr>
                <td id="title">이름</td>
                <td>
                    <input type="text" name="name" maxlength="40">
                </td>
            </tr>

            <tr>
                <td id="title">생일</td>
                <td>
                    <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
                    <select name="birth_mm">
                        <option value="">월</option>
                        <option value="01" >1</option>
                        <option value="02" >2</option>
                        <option value="03" >3</option>
                        <option value="04" >4</option>
                        <option value="05" >5</option>
                        <option value="06" >6</option>
                        <option value="07" >7</option>
                        <option value="08" >8</option>
                        <option value="09" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                    </select>
                    <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4" >
                </td>
            </tr>

            <tr>
                <td id="title">이메일</td>
                <td>
                    <input type="text" name="email" maxlength="30">@
                    <select name="email_2">
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>gmail.com</option>
                        <option>nate.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <input type="text" size="50" name="address"/>
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="가입"/>  
        
    </form>
    <form action = "../login/login.jsp">
    	<input type="button" value="취소">
    </form>
</div>

</body>
</html>
