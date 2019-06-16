document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const locationForm = document.getElementById("add-favorite");
  locationForm.addEventListener("submit", event => {
    event.preventDefault();
    const locationInput = document.getElementById("favorite-input");
    const locationVal = locationInput.value;
  });



  // adding new photos

  // --- your code here!



});
