function go_fbw()
{
var theForm = document.frm
theForm.action = "DBServlet?command=qna_board_write";
theForm.submit();
}

function go_fbu()
{
var theForm = document.frm
theForm.action = "DBServlet?command=qna_board_update";
theForm.submit();
}
function deleteBoard(num) {
  if (confirm("게시글을 삭제하시겠습니까?")) {
    location.href = 'DBServlet?command=qnaboard_delete&num=' + num;
  }
}

function boardCheck(){
   if(document.frm.content.value.length ==0){
      alert("내용 입력하세요.");
      return false;
   }
   if(document.frm.title.value.length ==0){
      alert("제목을 입력하세요.")
      return false;
   }
   return true;
}
function deleteBoard(num) {
  if (confirm("게시글을 삭제하시겠습니까?")) {
    location.href = 'DBServlet?command=qnaboard_delete&num=' + num;
  }
}