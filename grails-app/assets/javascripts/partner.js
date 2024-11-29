'use strict';
// ovdje imam samo da mi loaduje sekciju po sekciju i tako ih prikazuje
const allSections = document.querySelectorAll('.section');
const revealSectionEntries = function (entries, observer) {
    //using destructuring
    const [entry] = entries;

    if (!entry.isIntersecting) return;
    entry.target.classList.remove('section--hidden');
    observer.unobserve(entry.target);
};
const sectionObserver = new IntersectionObserver(revealSectionEntries, {
    root: null,
    threshold: 0.15,
});
allSections.forEach(function (section) {
    sectionObserver.observe(section);
    section.classList.add('section--hidden');
});
