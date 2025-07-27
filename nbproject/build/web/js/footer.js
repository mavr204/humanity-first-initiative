function checkWindowWidth() {
    const viewportWidth = window.innerWidth;
    const nsltr = document.getElementById("nsltr");
    const ftDiv = document.getElementById("footer-div");

    if (viewportWidth >= 1000) {
        ftDiv.classList.remove("mb-3");
        nsltr.classList.remove("d-none");
    }
    else if (viewportWidth <= 600) { 
        nsltr.classList.add("d-none");
        ftDiv.classList.remove("mb-3");
    } else {
        nsltr.classList.remove("d-none");
        ftDiv.classList.add("mb-3");
    }
}
window.addEventListener("load", checkWindowWidth);
window.addEventListener("resize", checkWindowWidth);