document.addEventListener("DOMContentLoaded", function () {
    const cinemas = window.cinemasData || [];
    let routingControl = null;
    let userLocation = L.latLng(10.7769, 106.7009);
    const map = L.map('map', { fullscreenControl: true }).setView(userLocation, 12);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    const markerGroup = L.layerGroup().addTo(map);

    function showRoute(fromLatLng, toLatLng, toName) {
        // Xóa routingControl cũ nếu có
        if (routingControl) {
            map.removeControl(routingControl);
            routingControl = null;
            // Xóa bảng chỉ đường thủ công nếu còn trong DOM
            const routingContainer = document.querySelector('.leaflet-routing-container');
            if (routingContainer) {
                routingContainer.remove();
            }
        }
        markerGroup.clearLayers();

        // Marker cho vị trí người dùng
        L.marker(fromLatLng, {
            icon: L.icon({
                iconUrl: 'https://cdn-icons-png.flaticon.com/512/64/64113.png',
                iconSize: [30, 30]
            })
        }).addTo(markerGroup).bindPopup('Bạn đang ở đây');

       // Marker cho đích (rạp) với nút thoát trong popup
       const popupContent = `
       <b>${toName}</b><br>
       <button id="exit-route-btn" style="
           margin-top: 10px;
           padding: 8px 12px;
           background: #ff4d4f;
           color: white;
           border: none;
           border-radius: 4px;
           cursor: pointer;
           display: block;
           width: fit-content;
       ">❌ Thoát chỉ đường</button>
   `;
   const destinationMarker = L.marker(toLatLng, {
       icon: L.icon({
           iconUrl: 'https://cdn-icons-png.flaticon.com/512/684/684908.png',
           iconSize: [30, 30]
       })
   }).addTo(markerGroup).bindPopup(popupContent).openPopup();

   // Khởi tạo routingControl
   routingControl = L.Routing.control({
       waypoints: [fromLatLng, toLatLng],
       routeWhileDragging: false,
       addWaypoints: false,
       draggableWaypoints: false,
       lineOptions: { styles: [{ color: '#0066ff', opacity: 0.7, weight: 6 }] },
       createMarker: function () { return null; },
       show: true,
   }).addTo(map);

   map.fitBounds(L.latLngBounds([fromLatLng, toLatLng]));

   // Thêm sự kiện click cho nút thoát ngay sau khi popup mở
   setTimeout(() => {
       console.log('Trying to attach exit button event for:', toName);
       const exitBtn = document.getElementById('exit-route-btn');
       if (exitBtn) {
           console.log('Exit button found');
           exitBtn.addEventListener('click', () => {
               console.log('Exit button clicked');
               if (routingControl) {
                   map.removeControl(routingControl);
                   routingControl = null;
                   // Xóa bảng chỉ đường thủ công
                   const routingContainer = document.querySelector('.leaflet-routing-container');
                   if (routingContainer) {
                       routingContainer.remove();
                   }
               }
               showAllCinemas(cinemas);
           });
       } else {
           console.error('Exit button not found in popup');
       }
   }, 100); // Chờ 100ms để đảm bảo popup được render
}

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            (pos) => {
                userLocation = L.latLng(pos.coords.latitude, pos.coords.longitude);
                L.marker(userLocation, {
                    icon: L.icon({
                        iconUrl: 'https://cdn-icons-png.flaticon.com/512/64/64113.png',
                        iconSize: [30, 30]
                    })
                }).addTo(markerGroup).bindPopup('Bạn đang ở đây').openPopup();
                map.setView(userLocation, 13);
            },
            (err) => console.warn('Không thể lấy vị trí người dùng:', err.message)
        );
    }

    // Thêm chức năng locate cho bản đồ
    map.locate({
        setView: true,
        enableHighAccuracy: true,
    });

    map.once('locationfound', function (e) {
        userLocation = L.latLng(e.latitude, e.longitude);
        L.marker(userLocation, {
            icon: L.icon({
                iconUrl: 'https://cdn-icons-png.flaticon.com/512/64/64113.png',
                iconSize: [30, 30]
            })
        }).addTo(markerGroup).bindPopup('Bạn đang ở đây').openPopup();
        map.setView(userLocation, 13);
    });

    map.once('locationerror', function (e) {
        alert("Không thể lấy vị trí của bạn.");
    });

    function showAllCinemas(list) {
        markerGroup.clearLayers();
        if (userLocation) {
            L.marker(userLocation, {
                icon: L.icon({
                    iconUrl: 'https://cdn-icons-png.flaticon.com/512/64/64113.png',
                    iconSize: [30, 30]
                })
            }).addTo(markerGroup).bindPopup('Bạn đang ở đây');
        }
        list.forEach(c => {
            const marker = L.marker([c.latitude, c.longitude])
                .addTo(markerGroup)
                .bindPopup(`<b>${c.name}</b><br>${c.address}, ${c.district}<br>${c.phone}`);
            marker.on('click', () => {
                showRoute(userLocation, L.latLng(c.latitude, c.longitude), c.name);
            });
        });

        const descriptionContainer = document.querySelector('.description-container');
        if (descriptionContainer) {
            descriptionContainer.innerHTML = list.length > 0
                ? list.map(c => `
                    <article data-coordinates="[${c.latitude}, ${c.longitude}]" data-title="${c.name}">
                        <h3>${c.name}</h3>
                        <small>${c.address}, ${c.district}</small>
                    </article>
                `).join('')
                : `<p>Không tìm thấy rạp chiếu phim nào.</p>`;

            descriptionContainer.querySelectorAll('article').forEach(function (article) {
                article.addEventListener('click', function () {
                    const coordinates = JSON.parse(this.getAttribute('data-coordinates'));
                    const title = this.getAttribute('data-title');

                    markerGroup.clearLayers();
                    if (userLocation) {
                        L.marker(userLocation, {
                            icon: L.icon({
                                iconUrl: 'https://cdn-icons-png.flaticon.com/512/64/64113.png',
                                iconSize: [30, 30]
                            })
                        }).addTo(markerGroup).bindPopup('Bạn đang ở đây');
                    }

                    L.marker(coordinates, {
                        icon: L.icon({
                            iconUrl: 'https://cdn-icons-png.flaticon.com/512/684/684908.png',
                            iconSize: [30, 30]
                        })
                    }).addTo(markerGroup).bindPopup(title).openPopup();

                    map.setView(coordinates, 16);

                    if (routingControl) {
                        map.removeControl(routingControl);
                        routingControl = null;
                        // Xóa bảng chỉ đường thủ công
                        const routingContainer = document.querySelector('.leaflet-routing-container');
                        if (routingContainer) {
                            routingContainer.remove();
                        }
                    }
                });
            });
        }
    }

    // Quét rạp trong bán kính (ví dụ 3000m = 3km)
    function findCinemasNearby(radiusMeters = 3000) {
        if (!userLocation) {
            alert("Không thể xác định vị trí của bạn.");
            return;
        }

        const nearby = cinemas.filter(c => {
            const distance = map.distance(userLocation, L.latLng(c.latitude, c.longitude));
            console.log(`Khoảng cách từ bạn đến rạp ${c.name}: ${distance}m`);
            return distance <= radiusMeters;
        });

        console.log(`Có ${nearby.length} rạp trong bán kính ${radiusMeters / 1000}km.`);
        if (nearby.length > 0) {
            showAllCinemas(nearby);
            alert(`Tìm thấy ${nearby.length} rạp trong bán kính ${radiusMeters / 1000}km!`);
        } else {
            alert('Không có rạp nào gần bạn trong bán kính này.');
        }
    }

    // Gắn nút tìm gần nhất
    const nearbyBtn = document.createElement('button');
    nearbyBtn.innerHTML = '📍 Tìm rạp gần nhất (3km)';
    nearbyBtn.style.cssText = 'position: fixed; top: 80px; right: 10px; z-index: 9999; padding: 10px 20px; background: #52c41a; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 16px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);';
    document.body.appendChild(nearbyBtn);

    nearbyBtn.addEventListener('click', () => {
        findCinemasNearby(3000);
    });

    // Khởi tạo lần đầu
    showAllCinemas(cinemas);

    const districtSelect = document.getElementById('district-select');
    if (districtSelect) {
        districtSelect.addEventListener('change', () => {
            const selectedDistrict = districtSelect.value.trim().toLowerCase();
            const filtered = window.cinemasData.filter(c =>
                c.district && c.district.trim().toLowerCase() === selectedDistrict
            );
            showAllCinemas(filtered);
        });
    }

    new Autocomplete("search", {
        delay: 500,
        selectFirst: true,
        howManyCharacters: 2,
        onSearch: ({ currentValue }) =>
            new Promise(resolve => {
                const results = cinemas.filter(c =>
                    c.name.toLowerCase().includes(currentValue.toLowerCase()) ||
                    c.address.toLowerCase().includes(currentValue.toLowerCase()) ||
                    c.district.toLowerCase().includes(currentValue.toLowerCase())
                );
                resolve(results);
            }),
        onResults: ({ matches, template }) =>
            matches.length === 0 ? template : matches.map(c => `
                <li class="loupe" role="option">
                    <b>${c.name}</b><br>
                    ${c.address}, ${c.district}<br>
                    ${c.phone}
                </li>
            `).join(""),
        onSubmit: ({ object }) => {
            if (!object || !object.latitude || !object.longitude) {
                return alert("Không thể tìm thấy vị trí rạp.");
            }
            showRoute(userLocation, L.latLng(object.latitude, object.longitude), object.name);
        }
    });

    const searchBtn = document.getElementById('search-btn');
    const searchInput = document.getElementById('search');
    if (searchBtn && searchInput) {
        searchBtn.addEventListener('click', () => {
            const q = searchInput.value.trim().toLowerCase();
            const filtered = cinemas.filter(c =>
                c.name.toLowerCase().includes(q) ||
                c.address.toLowerCase().includes(q) ||
                c.district.toLowerCase().includes(q)
            );
            if (filtered.length === 1) {
                showRoute(userLocation, L.latLng(filtered[0].latitude, filtered[0].longitude), filtered[0].name);
            } else if (filtered.length > 1) {
                showAllCinemas(filtered);
            } else {
                alert("Không tìm thấy rạp.");
            }
        });
    }
});