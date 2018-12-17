<%-- 
    Document   : map
    Created on : Sep 30, 2018, 11:26:19 PM
    Author     : buian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="map" style="width:80%;height:400px;margin: 0 auto;"></div>
        <script>
            function initMap() {
                var hutech = {lat: 10.802194, lng: 106.714826};
                var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 16,
                center: hutech
                });
            var marker = new google.maps.Marker({
                position: hutech, //tọa độ của marker
                title: 'Hutech University', //tên của marker
                animation:google.maps.Animation.BOUNCE, //kiểu ứng: BOUNCE(dao động lên xuống)
                                                        //          DRAG(đứng yên)
                map: map
                });
            var myHutect = new google.maps.Circle({
                center: hutech,         //Xác định trung tâm vòng tròn
                radius:100,             //bán kính của đường tròn (mét)
                strokeColor:"#0000FF",  //màu cho đường viền (#FFFFFF)
                strokeOpacity:0.5,      //độ trong đường viền (0.0 - 1.0)
                strokeWeight:2,         //độ rộng của đường viền (px)
                fillColor:"#0000FF",    //màu bên trong đường viền
                fillOpacity:0.2,        //độ trong
                map: map
                });
            //UI Event: mở InfoWindow khi click vào Marker
            var infowindow = new google.maps.InfoWindow({
                content:"Hutech University! Xin chào các bạn!"
                });
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
                });
            //UI Event: Zoom map
            google.maps.event.addListener(marker,'click',function() {
                map.setZoom(9);
                map.setCenter(marker.getPosition());
                });
            //Pan back to Marker
            google.maps.event.addListener(map,'center_changed',function() {
                window.setTimeout(function() {
                    map.panTo(marker.getPosition());
                },3000); //Sau 3s sẽ quay lại
                });
            //hàm placeMarker() sẽ thay thế 1 điểm được click bằng 1 marker 
            //và infowindow có chứa thông tin về tọa độ của điểm    
            google.maps.event.addListener(map, 'click', function(event) {
                placeMarker(event.latLng);
                });
            function placeMarker(location) {
                var marker = new google.maps.Marker({
                    position: location, 
                    map: map
                    });
                var infowindow = new google.maps.InfoWindow({
                    content: 'Latitude: ' + location.lat() +
                            '<br>Longitude: ' + location.lng()
                    });
                    infowindow.open(map,marker);
                }
                //Bật tất cả các control
                /*panControl:true,
                zoomControl:true,
                mapTypeControl:true,
                scaleControl:true,
                streetViewControl:true,
                overviewMapControl:true,
                rotateControl:true,
                //Vô hiệu hóa các control mặc định
                disableDefaultUI:true*/
            }
        </script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRYsPVxtJ66JUMt47lRvht6PvL97VkrSI&callback=initMap"
        async defer></script>
}
    </body>
</html>
