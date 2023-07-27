// Entry point for the build script in your package.json
import { initModal  } from './modal/modal';

import { initTopDropNav } from './side_bar/top_drop_nav';


initModal();


initTopDropNav();
console.log('Hello World from application js')

if (sessionStorage.getItem('faded') !== null) {
  if (sessionStorage.getItem('faded') === true) {
    if (document.querySelector('.fader-ollie') !== null) {
      const faderting = document.querySelector('.fader-ollie');
      faderting.classList.remove('fader-ollie');
    }
  }
} else {
  sessionStorage.setItem('faded', false );
  if (document.querySelector('.fader-ollie') !== null) {
    const faderting = document.querySelector('.fader-ollie');
    if (sessionStorage.getItem('faded') === false) {
      setTimeout(function(){
        faderting.classList.remove('fader-ollie');
        sessionStorage.setItem('faded', true)
      }, 8000);
    }
  }
}



