function initCinemaMap(lat, lon, name) {
    // Khởi tạo bản đồ
    var map = L.map('cinema-map').setView([lat, lon], 16);

    // Lớp bản đồ đường phố
    var streetLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    });

    

    // Thêm lớp đường phố mặc định
    streetLayer.addTo(map);

    // Thêm marker
    L.marker([lat, lon])
        .addTo(map)
        .bindPopup('<b>' + name + '</b>')
        .openPopup();

    // Thêm nút fullscreen
    map.addControl(new L.Control.Fullscreen());

    
}