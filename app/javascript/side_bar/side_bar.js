

const initSideBar = () => {
  const bar = document.querySelector('.side-bar-wrapper');
  const button = document.querySelector('.side-bar-trigger');




  button.addEventListener("click", (event) => {
    bar.classList.toggle('reveal');
  })

}

export { initSideBar };
