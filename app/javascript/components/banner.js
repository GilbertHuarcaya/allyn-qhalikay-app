import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["TU SALUD Y BIENESTAR SIEMPRE ONLINE", "LA PLATAFORMA ONLINE QUE PIENSA EN TU SALUD"],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };
