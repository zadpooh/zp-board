var Common = {};
var queryStringArr=[];

Common.setQueryString = function(){ // 쿼리스트링 배열안에 저장
	var URI = location.href.split("?");
	if(URI.length > 1){
		var URI = URI[1].split("&");
		for(i in URI)
			if(URI[i])
				queryStringArr[queryStringArr.length] = { key: URI[i].split("=")[0], value: URI[i].split("=")[1].split("#")[0] };
	}
};

Common.getQueryString = function(getKey){
	var getValue = null;
	if(queryStringArr.length > 0){
		for(i in queryStringArr)
			if(queryStringArr[i].key == getKey)
				getValue = queryStringArr[i].value;
	}
	return getValue;
};

/**
 * 팝업 띄우는 메서드. <br />Chrome에서는 스크롤바 제어를 해당 페이지에서 스타일을 줘야 가능(overflow: hidden)<br />
 * @param {String} [url=""] URL
 * @param {String} popupName popup 이름
 * @param {int} [width="400"] 가로 사이즈
 * @param {int} [height="400"] 세로 사이즈
 * @param {int or String} [scrollbars="0"] 스크롤 여부 (예: yes, 1 아니오: n, no, 0)
 * @param {int} [xPosition="c"] 가로 위치 (가운데: c)
 * @param {int} [yPosition="c"] 세로 위치 (가운데: c)
 * @requires popupName
 * @description <pre class="code">
popup('../../src/sample/popup.html', 'popup1')<br />
=> <input type="button" class="btn" value="실행" onclick="popup('../../src/sample/popup.html', 'popup1');return false;" /><br />
popup('../../src/sample/popup.html', 'popup2', 200, 300, 'no')<br />
=> <input type="button" class="btn" value="실행" onclick="popup('../../src/sample/popup.html', 'popup2', 200, 300, 'no');return false;" /><br />
popup('../../src/sample/popup.html', 'popup3', 200, 300, 'no', 100, 100)<br />
=> <input type="button" class="btn" value="실행" onclick="popup('../../src/sample/popup.html', 'popup3', 200, 300, 'no', 100, 100);return false;" />
</pre>
 */
Common.popup = function(url, popupName, width, height, scrollbars, xPosition, yPosition) {
	var xP = 0, yP = 0, xC = 0, yC = 0, scr = 0, zero = 0, one = 1;
	var target = url == null || url == '' ? '' : url;
	var w = width == null || width == '' ? 400 : width;
	var h = height == null || height == '' ? 400 : height;

	if (parseInt(navigator.appVersion) >= 4) {
		xC = (screen.width - w) / 2;
		yC = (screen.height - h) / 2;
	}

	xP = xPosition == null || xPosition == 'c' ? xC : xPosition;
	yP = yPosition == null || yPosition == 'c' ? yC : yPosition;
	scr = scrollbars == null || scrollbars == 'n' ? 0 : scrollbars;

    var parameters = 'location=' + zero +
                     ',menubar=' + zero +
                     ',height=' + h +
                     ',width=' + w +
                     ',toolbar=' + zero +
                     ',scrollbars=' + scr +
                     ',status=' + zero +
                     ',resizable=' + one +
                     ',left=' + xP +
                     ',screenX=' + xP +
                     ',top=' + yP +
                     ',screenY=' + yP;

	newWin = window.open(target, popupName, parameters);
	
	if (newWin) {
		newWin.focus();
	}
	
	//return newWin;
};

$(function(){
	Common.setQueryString();	
});

Common.layoutPopup = function(doc, width, height){
	width = width == null || width == "" ? '' : 'style="width:'+width+'"'; 
	height = height == null || height == "" ? "700px" : height;
	$("body").on("click", doc ,function(){
		
		var title = $(this).attr("title");
		var layoutPopupHtml = "";
		var target = $(this).data("target");
		//var pageNum = $(this).data("src").indexOf("?") > -1 ? "&pageNum="+$(".paginate_button.active > a").text() : "?pageNum="+$(".paginate_button.active > a").text();
		
		layoutPopupHtml += '<div class="modal-dialog modal-lg" '+width+' >';
		layoutPopupHtml += '<div class="modal-content col-xl-12">';
		layoutPopupHtml += '<div class="modal-header">';
		layoutPopupHtml += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
		layoutPopupHtml += '<h4 class="modal-title" id="myModalLabel">'+title+'</h4>';
		layoutPopupHtml += '</div>';
		layoutPopupHtml += '<iframe src="'+$(this).data("src")+'" width="100%" height="'+height+'" frameborder="0" allowtransparency="true"></iframe>';
		layoutPopupHtml += '</div>';
		layoutPopupHtml += '</div>';
		$(target).html(layoutPopupHtml);
	});
	
};

Common.modalReload = function(doc, pageFlag){
	$(doc).on('hidden.bs.modal', function () {
		
		var reloadUrl = location.href.split("?");
		
		var locationHref = reloadUrl[0];
		
		 
		if( reloadUrl.length > 1 ){
			 var reloadUrl = reloadUrl[1].split("&");
			 for(i in reloadUrl) {
				if(reloadUrl[i] && reloadUrl[i].split("=")[0] != "pageNum" ) {
					if( i == 0 ){
						locationHref += "?"+reloadUrl[i].split("=")[0]+"="+reloadUrl[i].split("=")[1].split("#")[0];
					}else {
						locationHref += "&"+reloadUrl[i].split("=")[0]+"="+reloadUrl[i].split("=")[1].split("#")[0];
					}
				}
			 }
		}
		
		if( pageFlag != "N" ){
			if( locationHref.indexOf("?") > -1 ){
				locationHref = locationHref+"&pageNum="+$(".pagination li.active").text();
			} else {
				locationHref = locationHref+"?pageNum="+$(".pagination li.active").text();
			}
			
		}
		
		location.href = locationHref; 
	});
}

window.closeModal = function(doc){
    $(doc).modal('hide');
};
