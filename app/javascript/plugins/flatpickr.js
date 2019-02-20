import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"


flatpickr(".datepicker", {
  dateFormat: 'Y-m-d',
  altInput: true,
  altFormat: 'd/m/Y',
});



const toggleDateInputs = function() {
  const arrivalInput = document.getElementById('booking_arrival');
  const departureInput = document.getElementById('booking_departure');

  if (arrivalInput && departureInput) {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

    flatpickr(arrivalInput, {
    enableTime: false,
    minDate: 'today',
    dateFormat: 'd/m/Y',
    disable: unvailableDates,
    onChange: function(selectedDates, selectedDate) {
      if (selectedDate === '') {
        departureInput.disabled = true;
      }
      let minDate = selectedDates[0];
      minDate.setDate(minDate.getDate() + 1);
      departureCalendar.set('minDate', minDate);
      departureInput.disabled = false;
    }
  });
    const departureCalendar =
      flatpickr(departureInput, {
        enableTime: false,
        dateFormat: 'd/m/Y',
        disable: unvailableDates
      });
  }
};

export { toggleDateInputs }


