import { initModal  } from '../modal/modal';

import { initTopDropNav } from '../side_bar/top_drop_nav';


initModal();


initTopDropNav();


if document.querySelector('.fader-ollie') !== null {
  const faderting = document.querySelector('.fader-ollie');
  setTimeout(faderting.classList.remove('fader-ollie'), 15000);
}
