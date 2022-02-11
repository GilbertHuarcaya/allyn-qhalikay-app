import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["TU HISTORIA CLÍNICA FÁCILMENTE ACCESIBLE","ACCESO A TUS REULTADOS MÉDICOS DESDE CUALQUIER LUGAR Y DISPOSITIVO", "LA PLATAFORMA ONLINE QUE PIENSA EN TU SALUD"],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };
