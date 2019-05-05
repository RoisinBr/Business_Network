var header = document.querySelector("header");

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

var carousel = function() {
    $('.jcarousel').jcarousel({
        // Configuration goes here
    });
};

// replace the $('.jcarousel') with the query selector name