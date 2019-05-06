var header = document.querySelector("header");
var jcarousel = $(".jcarousel").jcarousel({
    wrap: 'circular'
});
jcarousel.jcarouselAutoscroll();

var loginButton = document.querySelector(".login-button")
var navLoginLink = document.querySelector(".nav-login")

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

// var handleLoginClick = function (event) {
//     navLoginLink.classList.add("hidden")
// }

// loginButton.addEventListener('click', handleLoginClick)