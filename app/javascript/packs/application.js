import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox, initShowMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr"
import { toggleDateInputs } from '../plugins/flatpickr';

initMapbox();
initShowMapbox();

toggleDateInputs();



// const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)
// console.log(unvailableDates)
