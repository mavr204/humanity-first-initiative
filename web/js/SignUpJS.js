let email = document.getElementById("email");
let password = document.getElementById("password");
let confirmPassword = document.getElementById("confirm-password");

function onChange() {
  if (confirmPassword.value === password.value) {
    confirmPassword.setCustomValidity("");
  } else {
    confirmPassword.setCustomValidity("Passwords do not match!");
  }
}

  password.addEventListener("change", onChange);
  confirmPassword.addEventListener("change", onChange);