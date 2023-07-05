// Задаем начальную и конечную точки маршрута
const start ='65.56839108467103,57.15294448974763'; // координаты Тюмени
const end = [65.59971928596498, 57.16577964503057]; // координаты Екатеринбурга
const API_KEY = '5b3ce3597851110001cf6248d21810ee5ec647d693a38ab49c1e8c9b';// ключ доступа

// Отправляем запрос на API для получения времени маршрута
fetch(`https://api.openrouteservice.org/v2/directions/driving-car?api_key=${API_KEY}&start=${start}&end=${end}`)
  .then(response => response.json())
  .then(data => {
    const duration = data.features[0].properties.segments[0].duration;
    console.log(`Время в пути: ${duration} секунд`);
  })
  .catch(error => {
    console.error('Ошибка при запросе:', error);
  });