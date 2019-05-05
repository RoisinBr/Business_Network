var header = document.querySelector("header");
var carousel = document.querySelector(".jcarousel")

window.onscroll = function () {
    stickyHeader()
};

var sticky = header.offsetTop;

var stickyHeader = function () {
    if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
    } else {
        header.classList.remove("sticky")
    }
}

var runCarousel = function() {
    carousel.jcarousel({
        list: '.jcarousel-list'
    });
};

runCarousel();