const initFader = () => {
  window.onload = (event) => {
    if (document.querySelector('.home-category-image-banner')) {
      var banner = document.querySelector('.home-category-image-banner');
      if (sessionStorage.visited === false) {
        banner.classList.add('fader-ollie');
        const removeT = () => {
          banner.classList.remove('fader-ollie');
          localStorage.setItem('visited', true);
        }
        setTimeout(removeT, 6000);
      }
    }
  };
};

export { initFader };

