// Mobile nav toggle
const toggle = document.getElementById('navToggle');
const links = document.getElementById('navLinks');
toggle?.addEventListener('click', () => links.classList.toggle('open'));
document.querySelectorAll('.nav-link').forEach(l =>
  l.addEventListener('click', () => links.classList.remove('open'))
);

// Active nav on scroll
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.nav-link');
window.addEventListener('scroll', () => {
  const y = window.scrollY + 120;
  sections.forEach(sec => {
    if (y >= sec.offsetTop && y < sec.offsetTop + sec.offsetHeight) {
      navLinks.forEach(n => n.classList.remove('active'));
      const active = document.querySelector(`.nav-link[href="#${sec.id}"]`);
      active?.classList.add('active');
    }
  });
});

// Portfolio filter
const tabs = document.querySelectorAll('.filter-tab');
const cards = document.querySelectorAll('.portfolio-card');
tabs.forEach(tab => {
  tab.addEventListener('click', () => {
    tabs.forEach(t => t.classList.remove('active'));
    tab.classList.add('active');
    const f = tab.dataset.filter;
    cards.forEach(c => {
      c.classList.toggle('hidden', !(f === 'all' || c.dataset.cat === f));
    });
  });
});

// Reveal on scroll
const io = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.style.opacity = 1;
      e.target.style.transform = 'translateY(0)';
    }
  });
}, { threshold: 0.12 });
document.querySelectorAll('.service-item,.feature-card,.portfolio-card,.adv-card,.product-card').forEach(el => {
  el.style.opacity = 0;
  el.style.transform = 'translateY(24px)';
  el.style.transition = 'opacity .6s ease, transform .6s ease';
  io.observe(el);
});
