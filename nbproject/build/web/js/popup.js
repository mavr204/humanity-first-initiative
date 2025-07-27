const pop = document.getElementById("pop");
const emoji = document.querySelector('.emoji');
const feedbackForm = document.getElementById("feedbackForm");
const overlay = document.getElementById("overlay");
var timerId;

emoji.addEventListener('click', (e)=>{
    if(e.target.className.includes('emoji')) return;
        feedbackForm.classList.remove("d-none");
})

function handleEmojiClick(value) {
    // Set the value in the hidden input field
    document.getElementById('selectedRating').value = value;
    clearTimeout(timerId);
}

function resetAndSubmitNewsletter(form, text){
    form = document.getElementById(form);
    conText = document.getElementById(text);
    if (form.checkValidity()) {
        form.submit();
        form.reset();
        conText.classList.remove("d-none");
    } else {
        alert("Please provide an email.");
    }
}

// Show the popup automatically when the page loads
window.addEventListener("load", function() {
    pop.classList.remove("d-none");
    overlay.classList.remove("d-none");

    // Set a timer to close the popup after 5 seconds (60000 milliseconds)
    timerId = setTimeout(function() {
        pop.classList.add("d-none");
        overlay.classList.add("d-none");
    }, 10000);
});

function closeContainer() {
    pop.classList.add("d-none");
    overlay.classList.add("d-none");
}