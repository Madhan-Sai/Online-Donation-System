function validatePass() {
		pass=document.getElementById("passwd").value;
		if(pass.length<8 || pass.length>15)
			document.getElementById("msgp").innerHTML="* Password should be between 8 to 15 characters";
		else
			document.getElementById("msgp").innerHTML="";
	}
	function validateMail() {
		mail=document.getElementById("mail").value;
		if(!(mail.includes("@") && mail.includes(".")))
			document.getElementById("msgm").innerHTML="* Invalid Mail address";
		else
			document.getElementById("msgm").innerHTML="";
	}
	function validateNum() {
		num=document.getElementById("phone").value;
		if(num.length!=10)
			document.getElementById("msgn").innerHTML="* Invalid Phone number (Must contain 10 digits)";
		else
			document.getElementById("msgn").innerHTML="";
	}
