const tabActivate = () => {

  const bookingsButton = document.querySelector(".bookings-button-tab");
  const flatsButton = document.querySelector(".flats-button-tab");
  const bookingsTab = document.querySelector(".bookings-tab");
  const flatsTab = document.querySelector(".flats-tab");


  bookingsButton.addEventListener('click', (event) => {
    console.log('hello');

    if (bookingsButton.classList.contains('inactive-button')) {
      bookingsButton.classList.remove("inactive-button");
      bookingsButton.classList.add("active-button");
      bookingsTab.classList.remove("inactive");
      bookingsTab.classList.add("active");
      flatsButton.classList.remove("active-button");
      flatsButton.classList.add("inactive-button");
      flatsTab.classList.remove("active");
      flatsTab.classList.add("inactive");
    };
  });

  flatsButton.addEventListener('click', (event) => {
    console.log(bookingsButton);

    if (flatsButton.classList.contains('inactive-button')) {
      flatsButton.classList.remove("inactive-button");
      flatsButton.classList.add("active-button");
      flatsTab.classList.remove("inactive");
      flatsTab.classList.add("active");
      bookingsButton.classList.remove("active-button");
      bookingsButton.classList.add("inactive-button");
      bookingsTab.classList.remove("active");
      bookingsTab.classList.add("inactive");
    };
  });

}

export { tabActivate }
