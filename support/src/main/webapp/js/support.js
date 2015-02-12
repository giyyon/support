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