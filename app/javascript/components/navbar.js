const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  navbar.classList.remove('white-only-home');
  navbar.classList.add('.fixed-only-home');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 70 ) {
        navbar.classList.add('white-only-home');
      } else {
        navbar.classList.remove('white-only-home');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
