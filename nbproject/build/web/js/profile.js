// Add the countries to the Nationality and Country
function addCountries(){
    const countries = [
        "Afghanistan",
        "Albania",
        "Algeria",
        "Andorra",
        "Angola",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin",
        "Bhutan",
        "Bolivia",
        "Bosnia and Herzegovina",
        "Botswana",
        "Brazil",
        "Brunei",
        "Bulgaria",
        "Burkina Faso",
        "Burundi",
        "Cabo Verde",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Central African Republic",
        "Chad",
        "Chile",
        "China",
        "Colombia",
        "Comoros",
        "Congo",
        "Costa Rica",
        "Croatia",
        "Cuba",
        "Cyprus",
        "Czech Republic",
        "Democratic Republic of the Congo",
        "Denmark",
        "Djibouti",
        "Dominica",
        "Dominican Republic",
        "East Timor",
        "Ecuador",
        "Egypt",
        "El Salvador",
        "Equatorial Guinea",
        "Eritrea",
        "Estonia",
        "Eswatini",
        "Ethiopia",
        "Fiji",
        "Finland",
        "France",
        "Gabon",
        "Gambia",
        "Georgia",
        "Germany",
        "Ghana",
        "Greece",
        "Grenada",
        "Guatemala",
        "Guinea",
        "Guinea-Bissau",
        "Guyana",
        "Haiti",
        "Honduras",
        "Hungary",
        "Iceland",
        "Indonesia",
        "Iran",
        "Iraq",
        "Ireland",
        "Israel",
        "Italy",
        "Ivory Coast",
        "Jamaica",
        "Japan",
        "Jordan",
        "Kazakhstan",
        "Kenya",
        "Kiribati",
        "Kosovo",
        "Kuwait",
        "Kyrgyzstan",
        "Laos",
        "Latvia",
        "Lebanon",
        "Lesotho",
        "Liberia",
        "Libya",
        "Liechtenstein",
        "Lithuania",
        "Luxembourg",
        "Madagascar",
        "Malawi",
        "Malaysia",
        "Maldives",
        "Mali",
        "Malta",
        "Marshall Islands",
        "Mauritania",
        "Mauritius",
        "Mexico",
        "Micronesia",
        "Moldova",
        "Monaco",
        "Mongolia",
        "Montenegro",
        "Morocco",
        "Mozambique",
        "Myanmar",
        "Namibia",
        "Nauru",
        "Nepal",
        "Netherlands",
        "New Zealand",
        "Nicaragua",
        "Niger",
        "Nigeria",
        "North Korea",
        "North Macedonia",
        "Norway",
        "Oman",
        "Pakistan",
        "Palau",
        "Panama",
        "Papua New Guinea",
        "Paraguay",
        "Peru",
        "Philippines",
        "Poland",
        "Portugal",
        "Qatar",
        "Romania",
        "Russia",
        "Rwanda",
        "Saint Kitts and Nevis",
        "Saint Lucia",
        "Saint Vincent and the Grenadines",
        "Samoa",
        "San Marino",
        "Sao Tome and Principe",
        "Saudi Arabia",
        "Senegal",
        "Serbia",
        "Seychelles",
        "Sierra Leone",
        "Singapore",
        "Slovakia",
        "Slovenia",
        "Solomon Islands",
        "Somalia",
        "South Africa",
        "South Korea",
        "South Sudan",
        "Spain",
        "Sri Lanka",
        "Sudan",
        "Suriname",
        "Sweden",
        "Switzerland",
        "Syria",
        "Taiwan",
        "Tajikistan",
        "Tanzania",
        "Thailand",
        "Togo",
        "Tonga",
        "Trinidad and Tobago",
        "Tunisia",
        "Turkey",
        "Turkmenistan",
        "Tuvalu",
        "Uganda",
        "Ukraine",
        "United Arab Emirates",
        "United Kingdom",
        "United States",
        "Uruguay",
        "Uzbekistan",
        "Vanuatu",
        "Vatican City",
        "Venezuela",
        "Vietnam",
        "Yemen",
        "Zambia"
    ];
    const countrySelect = [document.getElementById("nationality"), document.getElementById("country")];
    for (let i = 0; i < countries.length; i++) {
        const option = document.createElement("option");
        option.value = countries[i]; 
        option.text = countries[i];
        countrySelect[0].appendChild(option); /* Append to nationality */
        countrySelect[1].appendChild(option.cloneNode(true)); /* Append to Country */
    }
}

// Function to check viewport width and hide sidebar if too small
function checkViewportWidth() {
    const viewportWidth = window.innerWidth;
    const sidebar = document.getElementById("side-bar");
    const ham = document.getElementById("ham-button");
    const sidebarLg = document.getElementById("side-bar-lg");

    if (viewportWidth > 734){
      document.getElementById("sb-icon-1").addEventListener("mouseenter",sidebarSwitchLg);
      document.getElementById("sb-icon-2").addEventListener("mouseenter",sidebarSwitchLg);
      document.getElementById("sb-icon-3").addEventListener("mouseenter",sidebarSwitchLg);
    } else{
      document.getElementById("sb-icon-1").removeEventListener("mouseenter",sidebarSwitchLg);
      document.getElementById("sb-icon-2").removeEventListener("mouseenter",sidebarSwitchLg);
      document.getElementById("sb-icon-3").removeEventListener("mouseenter",sidebarSwitchLg);
    }

    if (viewportWidth <= 600) { 
        sidebarLg.classList.add("d-none");
        sidebar.classList.add("d-none");
        ham.classList.remove("invisible");
    } else {
        if(sidebar.classList.contains("d-none") && !sidebarLg.classList.contains("d-none")){
        sidebar.classList.remove("d-none");
        } else {
            sidebarLg.classList.add("d-none");
        }

        sidebar.classList.remove("d-none");
        ham.classList.add("invisible");
    }
}

function sidebarSwitchLg(){
        document.getElementById("side-bar").classList.add("d-none");
        document.getElementById("side-bar-lg").classList.remove("d-none");
        
}
function sidebarSwitchSm(){
    document.getElementById("side-bar").classList.remove("d-none");
    document.getElementById("side-bar-lg").classList.add("d-none");
}    
// Check viewport width on page load and resize
window.addEventListener("load", checkViewportWidth);
window.addEventListener("resize", checkViewportWidth);
document.getElementById("side-bar-lg").addEventListener("mouseleave",sidebarSwitchSm);

// Adds password visibility toggle mechanism
const passwordInput = document.getElementById("password");
const confirmPasswordInput = document.getElementById("conPwd");
const showPasswordCheckbox = document.getElementById("passVis");

showPasswordCheckbox.addEventListener("change", function() {
    passwordInput.type = this.checked ? "text" : "password";
    confirmPasswordInput.type = this.checked ? "text" : "password";
});

//enables a warning to fill up all the mandtory fields
function enableMandatoryWarning(){
  const fillWarning = document.getElementById("fillWarning");
  fillWarning.classList.remove("d-none");
}

//Makes sure the password matches
function onChange() {
    if (confirmPassword.value === password.value) {
      confirmPassword.setCustomValidity("");
      console.log(true);
    } else {
      confirmPassword.setCustomValidity("Passwords do not match!");
    }
  }
  
  var password = document.getElementById("password");
  var confirmPassword = document.getElementById("conPwd");

  password.addEventListener("change", onChange);
  confirmPassword.addEventListener("change", onChange);
  addCountries();

  //Selects the option provide by the database for both natinality and countries
  function selectOption(selectElement, countryName){
      console.log(selectElement);
      console.log("target: " + countryName);
      var option;
    for (let i = 0; i < selectElement.options.length; i++) {
      if (countryName === selectElement.options[i].value){
          option = selectElement.options[i];
          console.log(option);
        option.selected = true;
        break;
      }
    }
  }