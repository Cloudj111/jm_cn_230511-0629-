/*function joinSubmit(event){
    let getSub = document.getElementById("joinSub");
    getSub.addEventListener(`click`,welcome);
}
function welcome(){
    alert("카페 가입을 환영합니다!");
    location.assign("cafe_pro_logIn.html");
}
function logInSub(event){
    let getSub = document.getElementById("logIn");
    getSub.addEventListener(`click`, goToLogIn);
}
function goToLogIn(){
    location.assign("cafe_pro_logIn.html")
}*/
function pwChk(){
	let pw1 = document.forms["joinForm"]["pw"].value;
	let pw2 = document.forms["joinForm"]["pw2"].value;
	
	if(pw1!=pw2){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	else
		return true;
}
// function findId(){
//     let getSub = document.getElementById("joinSub");
//     getSub.addEventListener(`click` ,
//     //  event => 
//     // alert("아이디 찾기 화면으로 넘어갑니다.")
//     // location.assign("cafe_findId.html")
//     );
// }
// function findPW(){
//     let getSub = document.getElementById("joinSub");
//     getSub.addEventListener(`click`,
//     //  event =>
//     // alert("비밀번호 찾기 화면으로 넘어갑니다.")
//     // location.assign("cafe_findPW.html")    
//     );
// }