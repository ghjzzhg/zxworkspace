<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>���ݾ�γ�Ȳ�ѯ��ַ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="http://api.map.baidu.com/api?ak=kRHuqFbkaoDcf5CsmOY0fwlpOZZgMxkt&v=2"></script>
<!--     http://api.map.baidu.com/geocoder/v2/?address=�����к������ϵ�ʮ��10��&output=json&ak=���ak&callback=showLocation -->
</head>
<body style="background:#CBE1FF">
    <div style="width:730px;">   
        Ҫ��ѯ�ĵ�ַ��<input id="text_" type="text" value="�Ϻ���������" style="margin-right:10px;"/>
        ��ѯ���(��γ��)��<input id="result_" type="text" />
        <input type="button" value="��ѯ" onclick="searchByStationName();"/>
        <div id="container" 
            style="position: absolute;
                margin-top:10px; 
                width: 1305px; 
                height: 550px; 
                top: 50; 
                border: 1px solid gray;
                overflow:hidden;">
        </div>
    </div>
</body>
<script type="text/javascript">
		options = {
		    "status": 0, 
		    "result": {
		        "location": {
		            "lng": 116.30775539540981, 
		            "lat": 40.05685561073758
		        }, 
		        "precise": 1, 
		        "confidence": 80, 
		        "level": "�������"
		    }
		};
	

    var map = new BMap.Map("container");
    map.centerAndZoom(new BMap.Point(121.4, 31.2), 12);
    map.enableScrollWheelZoom();    //���ù��ַŴ���С��Ĭ�Ͻ���
    map.enableContinuousZoom();    //���õ�ͼ������ק��Ĭ�Ͻ���

    map.addControl(new BMap.NavigationControl());  //���Ĭ������ƽ�ƿؼ�
    map.addControl(new BMap.OverviewMapControl()); //���Ĭ�����Ե�ͼ�ؼ�
    map.addControl(new BMap.OverviewMapControl({ isOpen: true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT }));   //���½ǣ���

    var localSearch = new BMap.LocalSearch(map);
    localSearch.enableAutoViewport(); //�����Զ����ڴ����С
function searchByStationName() {
    map.clearOverlays();//���ԭ���ı�ע
    var keyword = document.getElementById("text_").value;
    localSearch.setSearchCompleteCallback(function (searchResult) {
        var poi = searchResult.getPoi(0);
        document.getElementById("result_").value = poi.point.lng + "," + poi.point.lat;
        map.centerAndZoom(poi.point, 13);
        var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // ������ע��ΪҪ��ѯ�ĵط���Ӧ�ľ�γ��
        map.addOverlay(marker);
        var content = document.getElementById("text_").value + "<br/><br/>���ȣ�" + poi.point.lng + "<br/>γ�ȣ�" + poi.point.lat;
        var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
        marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
        // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //�����Ķ���
    });
    localSearch.search(keyword);
} 
</script>
</html>