import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"


// flatpickr(".datepicker", {})

const toggleDateInputs = function() {
  const arrivalInput = document.getElementById('booking_arrival');
  const departureInput = document.getElementById('booking_departure');

  if (arrivalInput && departureInput) {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

    flatpickr(arrivalInput, {
    enableTime: false,
    minDate: 'today',
    dateFormat: 'Y-m-d',
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
        dateFormat: 'Y-m-d',
        disable: unvailableDates
      });
  }
};

export { toggleDateInputs }


