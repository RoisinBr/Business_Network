var header = document.querySelector("header");
var jcarousel = $(".jcarousel").jcarousel({
    wrap: 'circular'
});
jcarousel.jcarouselAutoscroll();

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

// function myFunction() {
//     var x = document.getElementById("myTopnav");
//     if (x.className === "topnav") {
//       x.className += " responsive";
//     } else {
//       x.className = "topnav";
//     }
//   }
