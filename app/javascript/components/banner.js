import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Cocktails", "Booze", "Drink", "Ethanol", "Intoxicant", "Fire Water"],
    typeSpeed: 90,
    loop: true
  });
}

export { loadDynamicBannerText };
