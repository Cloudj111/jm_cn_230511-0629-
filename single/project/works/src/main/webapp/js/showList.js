
function eventRegQuitBtn(){
	let btn = document.querySelector("#QuitToCafe");
	btn.addEventListener('click',quitToCafe_member);
}
function eventRegPageLimit(){
	let selectPos= document.getElementById("limitPostPrint").value;
	console.log("표시 수 변경:"+selectPos.value);
	callPagePos();
	changePageLimit(selectPos);
}
function eventRegTableMenuBtn(){
				let btns = document.querySelectorAll(".tableMenuBtn");
				for(let i=0; i<btns.length; i++){
					btns[i].addEventListener("click",function(){
						let kind = btns[i].getAttributeNode("value").value;
						moveKindTable(kind);
					})
				}
			}
			/*$(".tableMenuBtn").on("load", eventRegTableMenuBtn);*/

window.onload = eventRegPageLimit;

