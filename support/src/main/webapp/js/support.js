	   var nowZoom = 100;
		function zoomIn() {
			nowZoom = nowZoom - 5;
			if(nowZoom <= 70) nowZoom = 70;
			zooms();
		}


		function zoomOut() {
				nowZoom = nowZoom + 5;
				if(nowZoom >= 500) nowZoom = 500;
				zooms();
		}
		
		function zoomReset(){
			nowZoom = 100; 
			zooms();
		}
		
		function zooms(){
			document.body.style.zoom = nowZoom + '%';
		
			if(nowZoom==70){
				alert ("30%축소 되었습니다. 더 이상 축소할 수 없습니다.");
			}
			
			if(nowZoom==500){
				alert ("500%확대 되었습니다. 더 이상 확대할 수 없습니다.");
			}
		}
		
		
		function sleep(num){	//[1/1000초]
			 var now = new Date();
			   var stop = now.getTime() + num;
			   while(true){
				 now = new Date();
				 if(now.getTime() > stop)return;
			   }
			}
		

		/* 파일 불러올때 텍스트아레아 높이 가져오기 
		   아래 window처럼 해야 하는데 예제는 숨겨져 있으니 안됨 
		   버튼에 클릭 이벤트에 추가했다는거만 틀립니다.*/
		window.onload = function(){
		    save_textarea_height = document.getElementById('notice').scrollHeight;
		}
		/* 텍스트상자 클릭시 빈칸으로 초기화 */
		function resize(tarea_obj) {
			if(tarea_obj.scrollHeight > tarea_obj.clientHeight){
        tarea_obj.style.height = (1+tarea_obj.scrollHeight)+"px";
			}
			else if((event.keyCode==8 || event.keyCode==46) && tarea_obj.scrollHeight > save_textarea_height){
				/* 백스페이드 키와 delete키 삭제시 아레아 창 줄어들기 */
				tarea_obj.style.height = "1px";
					tarea_obj.style.height = (1+tarea_obj.scrollHeight)+"px";
					/* 만약 삭제할때 높이가 save_textarea_height 보다 작다면
					   기본 설정 높이로 초기화 */
					if(tarea_obj.scrollHeight < save_textarea_height){
					  tarea_obj.style.height = save_textarea_height+"px";	
					}
			}
			/* else는 쓰기 애매함 */
			
			/* 참조(http://stackoverflow.com/questions/995168/textarea-to-resize-based-on-content-length)
					function resize(obj) {
					  obj.style.height = "1px";
					  obj.style.height = (20+obj.scrollHeight)+"px";
					}
					el . style . height =  
					( el . scrollHeight > el . clientHeight )  ?  ( el . scrollHeight )+ "px"  :  "60px" ;
      */
			}

		