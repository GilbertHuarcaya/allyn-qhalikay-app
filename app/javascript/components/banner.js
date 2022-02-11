import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["TU HISTORIA CLÍNICA SIEMPRE ACCESIBLE",
    "TUS RESULTADOS MÉDICOS DESDE CUALQUIER DISPOSITIVO",
     "LA PLATAFORMA ONLINE QUE PIENSA EN TU SALUD"],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };
