import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox, initShowMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr"
import { toggleDateInputs } from '../plugins/flatpickr';
import { priceUpdate } from '../plugins/priceupdate';
import { tabActivate } from '../plugins/tab';

initMapbox();

toggleDateInputs();

if (document.querySelector(".page")) {
  priceUpdate();
  initShowMapbox();
}

// if (document.querySelector(".inactive-button")) {
//   tabActivate();
// }




// const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)
// console.log(unvailableDates)


