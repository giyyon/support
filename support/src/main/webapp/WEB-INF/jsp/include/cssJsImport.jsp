<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery.mainslider.js"></script>
<script type="text/javascript" src="${contextPath}/js/support.js"></script>

<script type="text/javascript" src="${contextPath}/ckeditor/ckeditor.js"></script>

<!-- <script src="<c:url value='/js/scripts/jquery-1.10.2.min.js'/>"></script> --> 
<script src="<c:url value='/js/scripts/jquery-ui-1.10.3.custom.min.js'/>"></script>
<script src="<c:url value='/js/scripts/json2.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.form.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.format-1.3.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.validate.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.cookie.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.paging.js'/>"></script>
<script src="<c:url value='/js/scripts/BITCommon.js'/>"></script>
<script src="<c:url value='/js/scripts/Common.js'/>"></script>

<link href="<c:url value='/css/jquery.fileupload.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/jquery.fileupload-ui.css'/>" rel="stylesheet" />
<script src="<c:url value='/js/scripts/jquery.fileupload.js'/>"></script>
<script src="<c:url value='/js/scripts/tmpl.min.js'/>"></script>
<script src="<c:url value='/js/scripts/load-image.min.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.iframe-transport.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.fileupload-process.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.fileupload-validate.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.fileupload-ui.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.fileupload-jquery-ui.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.fileupload-image.js'/>"></script>
<script src="<c:url value='/js/scripts/jquery.multiDownload.js'/>"></script>

<link href="<c:url value='/css/jquery-ui-1.10.3.custom.min.css'/>" rel="stylesheet" />
<link href="${contextPath}/css/necgis.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/adm.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/support.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		var rt_path = ''  , rt_charset = 'UTF-8';
	</script>
	<script type='text/javascript' src='${contextPath}/js/common.js'></script>

    <script type="text/javascript">
	function MM_swapImgRestore() { //v3.0
		  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
		}
		function MM_preloadImages() { //v3.0
		  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		}

		function MM_findObj(n, d) { //v4.01
		  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
		  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
		  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
		  if(!x && d.getElementById) x=d.getElementById(n); return x;
		}

		function MM_swapImage() { //v3.0
		  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
		   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
		}
		function MM_jumpMenu(targ,selObj,restore){ //v3.0
		  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		  if (restore) selObj.selectedIndex=0;
		}
</script>