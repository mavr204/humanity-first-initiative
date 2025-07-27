<%-- 
    Document   : Profile
    Created on : Nov 5, 2023, 2:02:49 PM
    Author     : gamer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>NGO</title>
      <!-- Bootsrap import CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
      crossorigin="anonymous">
      <!-- Bootstrap Javascript -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js"></script>
      <!-- Style sheet -->
      <link rel="stylesheet" href="style.css">
      <!-- Javascript Import-->
      <!--FAVICON -->
      <link rel="icon" href="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg">
  </head>

  <body>
      <!-- header -->
      <header class="title-bar d-flex justify-content-center align-items-center">
        <!-- Logo -->
        <div style="padding-left: 1.5vw;">
          <a href=""><img title="Home" src="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg" 
          alt="Logo" class="title-logo rounded-circle"></a>
        </div>
        <!-- Title-bar -->
        <div class="container-fluid d-flex justify-content-between align-items-center">              
          <!-- Hidden menu -->
          <div class="dropdown" id="ham-button">
            <a href="#" class="d-flex align-items-center justify-content-center text-decoration-none" id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="Images/ham.png" alt="" class="rounded-circle ham-icon">
            </a>
            <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
              <li>
                <a class="dropdown-item" href="#">Home</a>
              </li>
              <li><a class="dropdown-item activa" href="#">Dashboard</a></li>
              <li><a class="dropdown-item" href="#">Donations</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Profile</a></li>
              <li><a class="dropdown-item" href="#">Sign out</a></li>
            </ul>
          </div>
          <!-- Title  -->
          <div>
              <h1><a class="title-link" href="#"> HUMANITY FIRST INITIATIVE </a></h1>
          </div>
          <!-- title button -->
          <span><button type="button" id="sign-out" class="btn btn-outline-light title-btn">Sign Out</button></span>
        </div>
      </header>
      <!-- main -->
      <main class="d-flex">
          <!-- Side-bar small -->
          <div class="d-flex flex-column flex-shrink-0 bg-col side-bar" id="side-bar">
              <ul class="nav nav-pills nav-flush flex-column mb-auto">
                <li id="sb-icon-1">
                  <a href="index.html" class="nav-link py-3 border-bottom side-bar-sm-links" title="Home" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
                    <img src="Images/Home-icon-2.png" alt="Home" title="Home" class="side-bar-sm-icons">
                  </a>
                </li>
                <li id="sb-icon-2">
                  <a href="#" class="nav-link py-3 border-bottom side-bar-sm-links" title="Dashboard" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Dashboard">
                    <img src="Images/dashboard-icon-2.png" alt="" title="" class="side-bar-sm-icons">
                  </a>
                </li>
                <li id="sb-icon-3">
                  <a href="#" class="nav-link py-3 border-bottom side-bar-sm-links" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                    <img src="Images/donate-Icon-2.png" alt="" title="" class="side-bar-sm-icons">
                  </a>
                </li>
              </ul>
              <!-- Dropdown box -->
              <div class="dropdown border-top-m">
                <a href="#" class="d-flex align-items-center justify-content-center text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="Images/place-holder-1.jpg" alt="" class="rounded-circle drop-icon">
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
                  <li><a class="dropdown-item" href="#">Profile</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
              </div>
          </div>
          <!-- Side-bar large -->
          <div class="d-flex flex-column flex-shrink-0 p-3 text-white d-none" id="side-bar-lg" style="width: 22vw; background-color: #2A484E; color: #DDEFE3; max-height: fit-content;">
              <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                  <a href="#" class="nav-link sb-link">
                    <img src="Images/Home-icon-2.png" alt="Home" title="Home" class="side-bar-lg-icons">
                    Home
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link sb-link" aria-current="page">
                    <img src="Images/dashboard-icon-2.png" alt="Dashboard" title="Dashboard" class="side-bar-lg-icons">
                    Dashboard
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link sb-link">
                    <img src="Images/donate-Icon-2.png" alt="Donations" title="Donations" class="side-bar-lg-icons">
                    Donations
                  </a>
                </li>
                <li><hr></li>
                <li>
                  <a href="#" class="nav-link sb-link activa" aria-current="page">
                    <img src="Images/place-holder-1.jpg" alt="Profile" title="Profile" class="side-bar-lg-icons" style="border-radius: 1vw;">
                    Profile
                  </a>
                </li>
                <li>
                  <a href="#" class="nav-link sb-link">
                    <img src="Images/sign-out-icon.png" alt="sign out" title="sign out" class="side-bar-lg-icons">
                    sign out
                  </a>
                </li>
              </ul>
            </div>
          <!-- Contents -->
          <div class="content-wrapper">
              <!-- Profile -->
              <div class="col-lg d-flex align-items-center">
                      <img src="Images/profile.png" alt="Dashboard" class="indicator-img" title="Dashboard">
                      <h3 class="indicator-text">Profile</h3>
              </div>
              <!-- card form -->
              <div class="d-flex row justify-content-center">
                  <div class="col-lg d-flex justify-content-center">
                      <div class="card" style="width: 60em;">
                          <img src="Images/place-holder-1.jpg" class="prof-img-top rounded-circle d-block mx-auto mt-5" alt="Profile Picture">
                          <div class="card-bod flex-column">
                            <div id="cardTitleHeading">
                              <h5 class="card-title" style="font-size: 4vw; text-align: center;">Anish Naskar</h5>
                              <h4 class="card-sub-title mb-3 pb-3" style="text-align: center;">@mavr204</h4>
                            </div>
                            
                            <!-- Form -->
                            <form action="Edit-profile.jsp" method="post" enctype="multipart/form-data">
                              <!-- Profiel Picture Change -->
                              <div class="row justify-content-evenly d-none" id="changeImage">
                                <div class="custom-btn">
                                  <label class="form-label m-1" for="profileImage">Choose file</label>
                                  <input type="file" class="form-control d-none" id="profileImage">
                              </div>
                              </div>
                              <div class="row justify-content-evenly d-none" id="nameField"> <!-- Name -->
                                  <div class="col-lg"> <!-- First name -->
                                  <label for="fname" class="form-label">First Name*</label>
                                  <input type="text" class="form-control disabled-form disabled-form" name="fname" id="fname" aria-label="First Name" required>
                                </div>
                                <div class="col-lg"> <!-- Last name -->
                                  <label for="lname" class="form-label">Last Name*</label>
                                  <input type="text" class="form-control disabled-form disabled-form" name="lname" id="lname" aria-label="Last Name" required>
                                </div>
                              </div >
                              <div class="row justify-content-evenly"> <!-- Row Birthdate & Nationality -->
                                <div class="col-lg"> <!-- Birth Date -->
                                  <label for="bday" class="form-label">Birth date*</label>
                                  <input type="date" class="form-control disabled-form" name="bday" id="bday" aria-label="Birth Date" required>
                                </div>
                                <div class="col-lg d-none" id="showNationality"> <!-- Nationality -->
                                  <label for="nationality" class="form-label">Nationality*</label>
                                  <select name="nationality" id="nationality" class="form-select" aria-label="Nationality">
                                    <option value="India" selected>India</option>
                                  </select>
                                </div>
                                <div class="col-lg" id="hideNationality"> <!-- Hidden Nationality -->
                                  <label for="hiddenNationality" class="form-label">Nationality*</label>
                                  <input type="text" id="hiddenNationality" class="form-control disabled-form">
                                </div>
                              </div>
                              <div class="row justify-content-evenly"> <!-- Address & Pin -->
                                <div class="col-lg"> <!-- Address -->
                                  <label for="address" class="form-label">Address </label> 
                                  <input type="text" class="form-control disabled-form" name="address" id="address" aria-label="Address">
                                </div>
                                <div class="col-lg"> <!-- pincode -->
                                  <label for="pin" class="form-label">Pin </label> 
                                  <input type="number" class="form-control disabled-form" name="pin" id="pin" aria-label="Pin code">
                                </div>
                              </div>
                              <div class="row justify-content-evenly"> <!-- City & State -->
                                <div class="col-lg"> <!-- City -->
                                  <label for="city" class="form-label">City </label> 
                                  <input type="text" class="form-control disabled-form" name="city" id="city" aria-label="City">
                                </div>
                                <div class="col-lg"> <!-- State -->
                                  <label for="state" class="form-label">State </label> 
                                  <input type="text" class="form-control disabled-form" name="state" id="state" aria-label="State">
                                </div>
                              </div>
                              <div class="row justify-content-evenly"> <!-- Row Country & bloodgroup -->
                                <div class="col-lg d-none" id="showCountry"> <!-- Country -->
                                  <label for="country" class="form-label">country</label>
                                  <select name="country" id="country" class="form-select" aria-label="Country">
                                    <option value="none" selected>Select</option>
                                    <option value="India">India</option>
                                  </select>
                                </div>
                                <div class="col-lg" id="hideCountry"> <!-- Hidden Country Group -->
                                  <label for="hiddenCountry" class="form-label">Country</label>
                                  <input type="text" id="hiddenCountry" class="form-control disabled-form">
                                </div>
                                <div class="col-lg d-none" id="showBloodGroup"> <!-- Blood Group -->
                                  <label for="nationality" class="form-label">Blood Group</label>
                                  <select name="bloodGroup" id="bloodGroup" class="form-select" aria-label="Blood Group">
                                    <option value="none" selected>Select</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                  </select>
                                </div>
                                <div class="col-lg" id="hideBloodGroup"> <!-- Hidden Blood Group -->
                                  <label for="hiddenBloodGroup" class="form-label">Blood Group</label>
                                  <input type="text" id="hiddenBloodGroup" class="form-control disabled-form">
                                </div>
                              </div>
                              <div class="row justify-content-evenly"> <!-- Phone number & Email -->
                                <div class="col-lg"> <!-- Phone Number -->
                                  <label for="pnum" class="form-label">Phone* </label> 
                                  <input type="tel" class="form-control disabled-form" name="pnum" id="pnum" aria-label="Phone-number" required>
                                </div>
                                <div class="col-lg"> <!-- Email -->
                                  <label for="email" class="form-label">Email* </label> 
                                  <input type="email" class="form-control disabled-form" name="email" id="email" aria-label="Email" required>
                                </div>
                              </div>
                              <div class="row justify-content-evenly"> <!-- Profession & Pin -->
                                <div class="col-lg"> <!-- Profession -->
                                  <label for="profession" class="form-label">Profession </label> 
                                  <input type="text" class="form-control disabled-form" name="profession" id="profession" aria-label="Profession">
                                </div>
                                <div class="col-lg"> <!-- Hobby -->
                                  <label for="hobby" class="form-label">Hobby </label> 
                                  <input type="text" class="form-control disabled-form" name="hobby" id="hobby" aria-label="Hobby">
                                </div>
                              </div>
                              <div class="d-flex justify-content-center"> <!-- Sex -->
                                <div class="radio-border d-none" id="sex">
                                    <label class="form-label px-2" aria-label="sex">Sex: </label>
                                    <div class="form-check form-check-inline">
                                        <label for="sexm">Male</label>
                                        <input type="radio" name="sex" id="sexm" aria-label="Male">
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <label for="sexf">Female</label>
                                        <input type="radio" name="sex" id="sexf" aria-label="Female">
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <label for="sexo">Other</label>
                                        <input type="radio" name="sex" id="sexo" aria-label="Other">
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <label for="sexr">Rather Not Say</label>
                                        <input type="radio" name="sex" id="sexr" aria-label="Rather Not Say">
                                    </div>
                                </div>
                              </div>
                              <div class="row justify-content-evenly"> <!-- Row Username & Whatsapp number & hidden-sex -->
                                <div class="col-lg d-none" id="usernameContainer"> <!-- Username -->
                                  <label for="username" class="form-label" aria-label="Username">Username*</label> 
                                  <input type="text" class="form-control disabled-form" name="username" id="username" required>
                                </div>
                                <div class="col-lg" id="sexHidden"> <!-- hidden-sex -->
                                  <label for="invisSex" class="form-label" aria-label="Sex">Sex</label> 
                                  <input type="text" class="form-control disabled-form" id="invisSex">
                                </div>
                                <div class="col-lg"> <!-- Whatsapp number -->
                                  <label for="wpNum" class="form-label">Whatsapp Number</label> 
                                  <input type="text" class="form-control disabled-form" name="wpNum" id="wpNum" aria-label="Whatsapp Number">
                                </div>
                              </div>
                              <div class="row justify-content-evenly d-none" id="passwords"> <!-- Row Password -->
                                <div class="col-lg">
                                  <label for="pwd" class="form-label">Password*</label>
                                  <input type="password" class="form-control" name="pwd" id="pwd" aria-label="password" required>
                                  <input type="checkbox" id="passVis"><label for="passVis">Show password</label>
                                </div>
                                <div class="col-lg"> <!-- confirm password -->
                                  <label for="conPwd" class="form-label">Confirm Password*</label>
                                  <input type="password" class="form-control" id="conPwd" aria-label="Confirm password" required>
                                </div>
                              </div >
                              <div class="col-lg container justify-content"><!-- Buttons  -->
                                <button type="button" id="editButton" onclick="editFunction()" class="custom-btn text-center">Edit</button>
                                <button type="button" id="cancelButton" onclick="cancelFunction()" class="custom-btn-cancel text-center d-none">Cancel</button>
                                <button type="button" id="submitButton" class="custom-btn-submit text-center d-none">Submit</button>
                              </div>
                            </form>
                          </div>
                      </div>                       
                  </div>
              </div>
          </div>
      </main>
      <!-- Footer -->
      <footer class="container-fluid foot">
          <div class="block-pad">
              <div class="row justify-content-between" style="height: 18vw;">
                  <!-- Quick Links -->
                  <div class="my-col fit-con">
                      <h5 class="foot-headings fit-con mx-auto">Quick Links</h5>
                      <ul class="nav my-flex-column fit-con">
                      <li class="fit-con"><a href="#" class="foot-link">Home</a></li>
                      <li class="fit-con"><a href="#" class="foot-link">Donations</a></li>
                      <li class="fit-con"><a href="#" class="foot-link">Contact US</a></li>
                      <li class="fit-con"><a href="#" class="foot-link">Join Us</a></li>
                      </ul>
                  </div>
                  
                  <!-- Socials -->
                  <div class="my-col fit-con">
                      <h5 class="foot-headings">Socials</h5>
                      <ul class="nav my-flex-column">
                      <li class="fit-con"><a href="#" class="foot-link">Twitter</a></li>
                      <li class="fit-con"><a href="#" class="foot-link">Facebook</a></li>
                      <li class="fit-con"><a href="#" class="foot-link">Instagram</a></li>
                      </ul>
                  </div>
                  
                  <!-- Contact info -->
                  <div class="my-col fit-con">                       
                      <ul class="nav my-flex-column align-items-center" style="line-height: 1.3vw;">
                          <li class="fit-con" style="line-height: .4vw;"><h4 class="foot-headings" style="font-size: 1.5vw;">Address</h4></li>
                          <li class="fit-con address" style="line-height: 1.2vw;"><span class="foot-link" style="font-size: 1vw;">[Insert Address]</span></li>
                          <li class="fit-con nav-item"><h4 class="foot-headings" style="font-size: 1.5vw;">Mobile</h4></li>
                          <li class="fit-con nav-item"><a href="#" style="font-size: 1vw;" class="foot-link"><em>7439272165</em></a></li>
                          <li class="fit-con nav-item"><a href="#" style="font-size: 1vw;" class="foot-link"><em>7439272165</em></a></li>
                          <li class="fit-con nav-item"><h4 class="foot-headings" style="font-size: 1.5vw;">Email</h4></li>
                          <li class="fit-con nav-item"><a href="mailto:email@example.com" style="font-size: 1vw;" class=" foot-link">anishnaskar.mav@gmail.com</a></li>
                          <li></li>
                      </ul>
                  </div>
                  
                  <!-- news letter -->
                  <div class="col-lg" id="nsltr">
                      <form>
                          <h5 class="foot-headings no-line">Subscribe to our newsletter</h5>
                          <p class="foot-headings sub">To know upcoming events and mission updates!</p>
                          <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                              <label for="newsletter1" class="visually-hidden">Email address</label>
                              <input id="newsletter1" type="text" class="nslt-frm" placeholder="Email address">
                              <button class="sub-btn" type="submit">Subscribe</button>
                          </div>
                      </form>
                  </div>
              </div>
                  <!-- Footer-note  -->
                  <div class="flex-column justify-content-center border-top-m pt-2">
                      <div>
                          <p class="foot-headings footer-note">© 2022 [Company], Inc. All rights reserved.</p>
                      </div>
                      <div >
                      <ul class="list-unstyled d-flex justify-content-center mb-0">
                          <li class="ms-3"><a class="link-dark" href="#"><img src="Images/X-logo.png" alt="@Username" title="Twitter" style="width: 2.5vw"></a></li>
                          <li class="ms-3"><a class="link-dark" href="#"><img src="Images/fb-logo.png" alt="Page Name" title="Facebook" style="width: 2.5vw"></a></li>
                          <li class="ms-3"><a class="link-dark" href="#"><img src="Images/Insta-logo.png" alt="Page Name" title="Instagram"  style="width: 2.5vw"></a></li>
                      </ul>
                  </div>
              </div>
          </div>
      </footer>
      <!-- Edit & Cancel -->
      <script>
        function editFunction(){
          fname.classList.remove("disabled-form");
          lname.classList.remove("disabled-form");
          bday.classList.remove("disabled-form");
          address.classList.remove("disabled-form");
          pin.classList.remove("disabled-form");
          city.classList.remove("disabled-form");
          state.classList.remove("disabled-form")
          pnum.classList.remove("disabled-form");
          email.classList.remove("disabled-form");
          username.classList.remove("disabled-form")
          wpNum.classList.remove("disabled-form");
          profession.classList.remove("disabled-form");
          hobby.classList.remove("disabled-form");
          
          showBloodGroup.classList.remove("d-none");
          showCountry.classList.remove("d-none");
          showNationality.classList.remove("d-none");
          sex.classList.remove("d-none");
          usernameContainer.classList.remove("d-none");
          pwd.classList.remove("d-none");
          conPwd.classList.remove("d-none");
          passwords.classList.remove("d-none");
          submitButton.classList.remove("d-none");
          cancelButton.classList.remove("d-none");
          editButton.classList.add("d-none");
          sexHidden.classList.add("d-none");
          hideNationality.classList.add("d-none");
          hideCountry.classList.add("d-none");
          hideBloodGroup.classList.add("d-none");
          cardTitleHeading.classList.add("d-none");
          nameField.classList.remove("d-none");
          changeImage.classList.remove("d-none");

        }
        function cancelFunction(){
          fname.classList.add("disabled-form");
          lname.classList.add("disabled-form");
          bday.classList.add("disabled-form");
          address.classList.add("disabled-form");
          pnum.classList.add("disabled-form");
          email.classList.add("disabled-form");
          pin.classList.add("disabled-form");
          city.classList.add("disabled-form");
          state.classList.add("disabled-form")
          username.classList.add("disabled-form")
          wpNum.classList.add("disabled-form");
          profession.classList.add("disabled-form");
          hobby.classList.add("disabled-form");
          
          showBloodGroup.classList.add("d-none");
          showNationality.classList.add("d-none");
          showCountry.classList.add("d-none");
          sex.classList.add("d-none");
          usernameContainer.classList.add("d-none");
          pwd.classList.add("d-none");
          conPwd.classList.add("d-none");
          passwords.classList.add("d-none");
          submitButton.classList.add("d-none");
          cancelButton.classList.add("d-none");
          nameField.classList.add("d-none");
          changeImage.classList.add("d-none");
          editButton.classList.remove("d-none");
          sexHidden.classList.remove("d-none");
          hideNationality.classList.remove("d-none");
          hideCountry.classList.remove("d-none");
          hideBloodGroup.classList.remove("d-none");
          cardTitleHeading.classList.remove("d-none");
          setSexValue();
          setSelectValue();
        }
        /* Check which radio button is active */
        function getSexValue(){
        var sexRadioButtons = document.querySelectorAll('input[type="radio"][name="sex"]');
          for (let i = 0; i < sexRadioButtons.length; i++) {
            if (sexRadioButtons[i].checked) {
            return sexRadioButtons[i];
            }
          }
          return null;
        }
        
        // Set the value for the hidden sex textfield
        function setSexValue(){
          var radioValue = getSexValue();
          if (radioValue != null) {
            if (radioValue.id === "sexm") {
              invisSex.value = "Male";
            } else if (radioValue.id === "sexf") {
              invisSex.value = "Female";
            } else if (radioValue.id === "sexo") {
              invisSex.value = "Other";
            } else if (radioValue.id === "sexr") {
              invisSex.value = "Rather Not Say";
            }

          }
        }
        // Get Value from the selected
        function getSelectValue(){
          var selectedIndex = nationality.selectedIndex;
          var selectButtons = [nationality.options[selectedIndex].value];
          selectedIndex = country.selectedIndex;
          selectButtons.push(country.options[selectedIndex].value)
          selectedIndex = bloodGroup.selectedIndex;
          selectButtons.push(bloodGroup.options[selectedIndex].value)
          return selectButtons;
        }
        // Set value to the select replacements
        function setSelectValue(){
          text = getSelectValue();
          textboxes = [hiddenNationality, hiddenCountry, hiddenBloodGroup ];
          for (let i = 0; i < textboxes.length; i++) {
            if (text[i] === "none") {
              continue; 
            }
            textboxes[i].value = text[i];
          }
        }
      </script> 
      <!-- adds js for this specific file -->
      <script src="profile.js"></script>
  </body>
</html>
