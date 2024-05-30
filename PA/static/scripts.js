document.addEventListener('DOMContentLoaded', () => {
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;

    document.querySelector('.next').addEventListener('click', () => {
        changeSlide(currentSlide + 1);
    });

    document.querySelector('.prev').addEventListener('click', () => {
        changeSlide(currentSlide - 1);
    });

    function changeSlide(index) {
        slides[currentSlide].classList.remove('active');
        currentSlide = (index + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
    }
});
