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


    const mapMarkers = [] // <-- added this
    markers.forEach((marker) => {


      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '40px';
      element.style.height = '40px';

      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this

      const newMarker = new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // <-- add this
      .addTo(map);
      mapMarkers.push(newMarker)
    });

    fitMapToMarkers(map, markers);
    openInfoWindow(mapMarkers);
  }
};

const openInfoWindow = (markers) => {
  // Select all cards
  const cards = document.querySelectorAll('.card-flat');
  cards.forEach((card, index) => {
    // Put a microphone on each card listening for a mouseenter event
    card.addEventListener('mouseenter', () => {
      // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
      markers[index].togglePopup();
    });
    // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
    card.addEventListener('mouseleave', () => {
      markers[index].togglePopup();
    });
  });
}

const toggleCardHighlighting = (event) => {
  // We select the card corresponding to the marker's id
  const card = document.querySelector(`[data-flat-id="${event.currentTarget.dataset.markerId}"]`);
  // Then we toggle the class "highlight" to the card
  card.classList.toggle('highlight');
}

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


