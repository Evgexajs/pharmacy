ymaps.ready(init);
// function init() {
//     // Создание карты.
//     var myMap = new ymaps.Map("map", {
//         center: [57.152985, 65.542274], // Координаты Тюмени.
//         zoom: 10 // Уровень масштабирования.
//     });

//     // // Получение координат по адресу.
//     // ymaps.geocode("Тюмень, Сосьвинская 45 кв 5", {
//     //     results: 1
//     // }).then(function (res) {
//     //     var firstGeoObject = res.geoObjects.get(0);
//     //     myMap.setCenter(firstGeoObject.geometry.getCoordinates(), 16);
//     // });
// }
function init() {
    var map = new ymaps.Map('map', {
        center: [57.152985, 65.542274],
        zoom: 13,
        controls: ['zoomControl']
    });

    var placemark = new ymaps.Placemark([57.152985, 65.542274], {
        balloonContent: 'Выберите местоположение'
    }, {
        draggable: true,
        preset: 'islands#redDotIcon'
    });

    placemark.events.add('dragend', function (e) {
        var coords = placemark.geometry.getCoordinates();
        console.log(coords);
    });

    map.geoObjects.add(placemark);
}