/**
 * 
 */
 
 function loginCheck() {
   if (document.frm.userid.value.length == 0) {
      alert("아이디를 써주세요");
      frm.userid.focus();
      return false;
   }
   if (document.frm.pw.value == "") {
      alert("암호는 반드시 입력해야 합니다.");
      frm.pw.focus();
      return false;
   }
   return true;
}

function open_win(url) {
   window.open(url, "width=900, height=300");
}

function userCheck(){
	if (document.frm.userid.value == "") {
      alert('아이디를 입력하여 주십시오.');
      document.formm.userid.focus();
      return;
   }
   if (document.frm.name.value.length == 0) {
      alert("이름을 써주세요.");
      frm.name.focus();
      return false;
   }
}



function idCheck() {
   if (document.frm.userid.value == "") {
      alert('아이디를 입력하여 주십시오.');
      document.formm.userid.focus();
      return;
   }
   var url = "idCheck.do?userid=" + document.frm.userid.value;
   window.open(url, "_blank_1",
               "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}


function idok(userid) {
   opener.frm.userid.value = document.frm.userid.value;
   opener.frm.reid.value = document.frm.userid.value;
   self.close();
}

function passCheck(){
   if(document.frm.pass.value.length == 0){
      alert("비밀번호를 입력하세요.");
      return false;
   }
   return true;
}

function open_win(url,name){
   window.open(url,name,"width=500, height=230");
}


function joinCheck() {
   if (document.frm.name.value.length == 0) {
      alert("이름을 써주세요.");
      frm.name.focus();
      return false;
   }
   if (document.frm.userid.value.length == 0) {
      alert("아이디를 써주세요");
      frm.userid.focus();
      return false;
   }
   if (document.frm.userid.value.length < 4) {
      alert("아이디는 4글자이상이어야 합니다.");
      frm.userid.focus();
      return false;
   }
   if (document.frm.pw.value == "") {
      alert("암호는 반드시 입력해야 합니다.");
      frm.pw.focus();
      return false;
   }
   if (document.frm.pw.value != document.frm.pw_check.value) {
      alert("암호가 일치하지 않습니다.");
      frm.pw.focus();
      return false;
   }
   if (document.frm.reid.value.length == 0) {
      alert("중복 체크를 하지 않았습니다.");
      frm.userid.focus();
      return false;
   }
   return true;
}