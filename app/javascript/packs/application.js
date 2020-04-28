import { initModal  } from '../modal/modal';

import { initTopDropNav } from '../side_bar/top_drop_nav';


initModal();


initTopDropNav();

window.onload = (event) => {
  if (document.querySelector('.home-category-image-banner')) {
  var banner = document.querySelector('.home-category-image-banner');
    banner.classList.add('fader-ollie');
    const removeT = () => {
      banner.classList.remove('fader-ollie');
    }
    setTimeout(removeT, 6000);
  }
};
