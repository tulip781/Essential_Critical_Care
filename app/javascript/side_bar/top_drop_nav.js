const initTopDropNav = () => {
  console.log('Hello World from top_drop_nav.js')
  const button2 = document.querySelector('.side-bar-trigger')
  const myFunction = () => {
    const x = document.getElementById("myLinks");
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
  button2.addEventListener("click", myFunction)
}

export { initTopDropNav };
