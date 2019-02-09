const priceUpdate = () => {

  const arrival = document.querySelector("#booking_arrival");
  const departure = document.querySelector("#booking_departure");

  departure.addEventListener('change', (event) => {
    const departureInput = departure.value;
    const arrivalInput = arrival.value;
    const arrivalDate = new Date(arrival.value);
    const departureDate = new Date(departure.value);
    const timeDiff = Math.abs(departureDate.getTime() - arrivalDate.getTime());
    const diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

    const tempInfo = document.querySelector(".temp_information");
    const priceNight = tempInfo.dataset.temp;

    const sumPrice = (priceNight * diffDays) || 0;

    const priceResults = document.querySelector(".total-price");
    priceResults.innerText = `${sumPrice} €`;
  })

}

export { priceUpdate };
