import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.querySelector('.searchmap');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '40px';
      element.style.height = '40px';


      new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
    });

    fitMapToMarkers(map, markers);
  }
};

const initShowMapbox = () => {
  const showmapElement = document.querySelector('.showmap');
  const marker = JSON.parse(showmapElement.dataset.markers);

  if (showmapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = showmapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [ marker.lng, marker.lat ],
      zoom: 15
    });


      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '40px';
      element.style.height = '40px';


      new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);


  }
};



export { initMapbox, initShowMapbox };


