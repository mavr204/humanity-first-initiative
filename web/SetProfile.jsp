<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGO</title>
    <!-- Bootsrap import CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Bootstrap Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js"></script>
    <!-- Style sheet -->
    <link rel="stylesheet" href="CSS/ProfileStyle.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <!-- Javascript Import-->
    <!--FAVICON -->
    <link rel="icon" href="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg">
  </head>
  <% String username=(String)session.getAttribute("username"); String email=(String)session.getAttribute("email");
    String password=(String)session.getAttribute("password"); %>

    <body>
      <!-- header -->
      <!-- Header -->
      <header class="title-bar d-flex justify-content-center align-items-center">
        <!-- Title-bar -->
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <!-- Logo -->
            <div style="padding-left: 1.5vw;">
                <a href="Home.jsp"><img title="Home"
                        src="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg"
                        alt="Logo" class="title-logo rounded-circle"></a>
            </div>
            <!-- Title  -->
            <div>
                <h1><a class="title-link timesF" href="Home.jsp"> HUMANITY FIRST INITIATIVE </a></h1>
            </div>
            <!-- title button -->
            <span><a type="button" href="Logout" id="sign-out"
                    class="btn btn-outline-light title-btn p22MacF">Sign out</a></span>
        </div>
    </header>
      <!-- main -->
      <main class="d-flex">
        <!-- Contents -->
        <div class="content-wrapper">
          <!-- Profile -->
          <div class="col-lg d-flex align-items-center margin-logo">
            <img src="Images/profile.png" alt="Profile" class="indicator-img" title="Profile">
            <h3 class="indicator-text">Set up Profile</h3>
          </div>
          <!-- card form -->
          <div class="d-flex row justify-content-center">
            <div class="col-lg d-flex justify-content-center">
              <div class="card" style="width: 60em;">
                <img src="Images/place-holder-1.jpg" class="prof-img-top rounded-circle d-block mx-auto mt-5"
                  alt="Profile Picture">
                <div class="card-bod flex-column">
                  <div class=" d-none" id="cardTitleHeading">
                    <h5 class="card-title" style="font-size: 4vw; text-align: center;"></h5>
                    <h4 class="card-sub-title mb-3 pb-3" style="text-align: center;"></h4>
                  </div>
                  <h6 style="color: red; text-align: center;" class="d-none" id="fillWarning">Please Fill all the
                    mandatory fields marked by *</h6>
                  <!-- Form -->
                  <form action="SetProfile" method="post">
                    <!-- Profile Picture Change -->
                    <div class="row justify-content-evenly" id="changeImage">
                      <div class="custom-btn">
                        <label class="form-label m-1" for="profileImage">Choose file</label>
                        <input type="file" class="form-control d-none" id="profileImage">
                      </div>
                    </div>
                    <div class="row justify-content-evenly" id="nameField"> <!-- Name -->
                      <div class="col-lg"> <!-- First name -->
                        <label for="fname" class="form-label">First Name*</label>
                        <input type="text" class="form-control" autocapitalize="on" name="firstname" id="fname"
                          aria-label="First Name" required>
                      </div>
                      <div class="col-lg"> <!-- Last name -->
                        <label for="lname" class="form-label">Last Name*</label>
                        <input type="text" class="form-control" autocapitalize="on" name="lastname" id="lname"
                          aria-label="Last Name" required>
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- Row Birthdate & Nationality -->
                      <div class="col-lg"> <!-- Birth Date -->
                        <label for="bday" class="form-label">Birth date*</label>
                        <input type="date" class="form-control" name="birthdate" id="bday" autocomplete="off"
                          aria-label="Birth Date" required>
                      </div>
                      <div class="col-lg" id="showNationality"> <!-- Nationality -->
                        <label for="nationality" class="form-label">Nationality*</label>
                        <select name="nationality" id="nationality" class="form-select" aria-label="Nationality">
                          <option value="India" selected>India</option>
                        </select>
                      </div>
                      <div class="col-lg d-none" id="hideNationality"> <!-- Hidden Nationality -->
                        <label for="hiddenNationality" class="form-label">Nationality*</label>
                        <input type="text" id="hiddenNationality" class="form-control">
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- Address & Pin -->
                      <div class="col-lg"> <!-- Address -->
                        <label for="address" class="form-label">Address </label>
                        <input type="text" class="form-control" name="address" id="address" autocomplete="on"
                          aria-label="Address">
                      </div>
                      <div class="col-lg"> <!-- pincode -->
                        <label for="pin" class="form-label">Pin </label>
                        <input type="number" class="form-control" name="pin" id="pin" aria-label="Pin code">
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- City & State -->
                      <div class="col-lg"> <!-- City -->
                        <label for="city" class="form-label">City </label>
                        <input type="text" class="form-control" name="city" id="city" aria-label="City">
                      </div>
                      <div class="col-lg"> <!-- State -->
                        <label for="state" class="form-label">State </label>
                        <input type="text" class="form-control" name="state" id="state" aria-label="State">
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- Row Country & bloodgroup -->
                      <div class="col-lg" id="showCountry"> <!-- Country -->
                        <label for="country" class="form-label">country</label>
                        <select name="country" id="country" class="form-select" autocomplete="off" aria-label="Country">
                          <option value="none" selected>Select</option>
                          <option value="India">India</option>
                        </select>
                      </div>
                      <div class="col-lg d-none" id="hideCountry"> <!-- Hidden Country Group -->
                        <label for="hiddenCountry" class="form-label">Country</label>
                        <input type="text" id="hiddenCountry" class="form-control">
                      </div>
                      <div class="col-lg" id="showBloodGroup"> <!-- Blood Group -->
                        <label for="nationality" class="form-label">Blood Group</label>
                        <select name="bloodgroup" id="bloodgroup" class="form-select" aria-label="Blood Group">
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
                      <div class="col-lg d-none" id="hideBloodGroup"> <!-- Hidden Blood Group -->
                        <label for="hiddenBloodGroup" class="form-label">Blood Group</label>
                        <input type="text" id="hiddenBloodGroup" class="form-control">
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- Phone number & Email -->
                      <div class="col-lg"> <!-- Phone Number -->
                        <label for="pnum" class="form-label">Phone* </label>
                        <input type="tel" class="form-control" name="phone" id="pnum" aria-label="Phone-number"
                          required>
                      </div>
                      <div class="col-lg"> <!-- Email -->
                        <label for="email" class="form-label">Email* </label>
                        <input type="email" value="<%=email%>" class="form-control disabled-form" readonly tabindex="-1"
                          autocomplete="on" name="email" id="email" aria-label="Email" required>
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- Profession & Pin -->
                      <div class="col-lg"> <!-- Profession -->
                        <label for="profession" class="form-label">Profession </label>
                        <input type="text" class="form-control" name="profession" id="profession"
                          aria-label="Profession">
                      </div>
                      <div class="col-lg"> <!-- Hobby -->
                        <label for="hobby" class="form-label">Hobby </label>
                        <input type="text" class="form-control" name="hobby" id="hobby" aria-label="Hobby">
                      </div>
                    </div>
                    <div class="d-flex justify-content-center"> <!-- Sex -->
                      <div class="radio-border" id="sex">
                        <label class="form-label px-2" aria-label="sex">Sex: </label>
                        <div class="form-check form-check-inline">
                          <label for="sexm">Male</label>
                          <input type="radio" name="sex" id="sexm" value="Male" aria-label="Male">
                        </div>
                        <div class="form-check form-check-inline">
                          <label for="sexf">Female</label>
                          <input type="radio" name="sex" value="Female" id="sexf" aria-label="Female">
                        </div>
                        <div class="form-check form-check-inline">
                          <label for="sexo">Other</label>
                          <input type="radio" name="sex" value="Other" id="sexo" aria-label="Other">
                        </div>
                        <div class="form-check form-check-inline">
                          <label for="sexr">Rather Not Say</label>
                          <input type="radio" name="sex" id="sexr" value="Rather Not Say" aria-label="Rather Not Say">
                        </div>
                      </div>
                    </div>
                    <div class="row justify-content-evenly"> <!-- Row Username & Whatsapp number & hidden-sex -->
                      <div class="col-lg" id="usernameContainer"> <!-- Username -->
                        <label for="username" class="form-label" aria-label="Username">Username*</label>
                        <input type="text" value="<%=username%>" class="form-control disabled-form" readonly
                          tabindex="-1" autocomplete="on" name="username" minlength="4" maxlength="10" id="username"
                          required>
                      </div>
                      <div class="col-lg d-none" id="sexHidden"> <!-- hidden-sex -->
                        <label for="invisSex" class="form-label" aria-label="Sex">Sex</label>
                        <input type="text" class="form-control disabled-form" id="invisSex">
                      </div>
                      <div class="col-lg"> <!-- Whatsapp number -->
                        <label for="wpNum" class="form-label">Whatsapp Number</label>
                        <input type="tel" class="form-control" name="wpnumber" id="wpNum" aria-label="Whatsapp Number">
                      </div>
                    </div>
                    <div class="row justify-content-evenly" id="passwords"> <!-- Row Password -->
                      <div class="col-lg">
                        <label for="pwd" class="form-label">Password*</label>
                        <input type="password" value="<%=password%>" class="form-control" name="password" id="password"
                          aria-label="password" required>
                        <input type="checkbox" class="form-check-input" id="passVis"><label for="passVis"
                          class="form-check-label">Show password</label>
                      </div>
                      <div class="col-lg"> <!-- confirm password -->
                        <label for="conPwd" class="form-label">Confirm Password*</label>
                        <input type="password" value="<%=password%>" class="form-control" id="conPwd"
                          aria-label="Confirm password" required>
                      </div>
                    </div>
                    <div class="col-lg container justify-content"><!-- Buttons  -->
                      <input type="submit" onclick="enableMandatoryWarning()" class="custom-btn-submit text-center"
                        value="Submit">
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
            <div class="row justify-content-between mb-3" id="footer-div" style="height: 18vw;">
                <!-- Quick Links -->
                <div class="my-col fit-con">
                    <h5 class="foot-headings fit-con p22MacF">Quick Links</h5>
                    <ul class="nav my-flex-column fit-con">
                        <li class="fit-con"><a href="index.html" class="foot-link">Home</a></li>
                        <li class="fit-con"><a href="./payment.html" class="foot-link">Donate</a></li>
                        <li class="fit-con"><a href="./Complain.html" class="foot-link">Complaint</a></li>
                        <li class="fit-con"><a href="./privacyPolicy.html" class="foot-link">Privacy
                                Policies</a></li>
                    </ul>
                </div>

                <!-- Socials -->
                <div class="my-col fit-con">
                    <h5 class="foot-headings p22MacF">Socials</h5>
                    <ul class="nav my-flex-column fit-con">
                        <li class="fit-con"><a href="#" class="foot-link">Twitter</a></li>
                        <li class="fit-con"><a href="#" class="foot-link">Facebook</a></li>
                        <li class="fit-con"><a href="#" class="foot-link">Instagram</a></li>
                    </ul>
                </div>

                <!-- Contact info -->
                <div class="my-col fit-con">
                    <ul class="nav my-flex-column align-items-center" style="line-height: 1.3vw;">
                        <li class="fit-con" style="line-height: .4vw;">
                            <h4 class="foot-headings p22MacF" style="font-size: 1.5vw;">Address</h4>
                        </li>
                        <li class="fit-con address" style="line-height: 1.2vw;"><span class="foot-link"
                                style="font-size: 1vw;">TMSL, EM-4/1, Sector V, Saltlake.</span></li>
                        <li class="fit-con nav-item">
                            <h4 class="foot-headings p22MacF" style="font-size: 1.5vw;">Mobile</h4>
                        </li>
                        <li class="fit-con nav-item"><a style="font-size: 1vw;"
                                class="foot-link cascadiaF"><em>+91-7439272165</em></a></li>
                        <li class="fit-con nav-item">
                            <h4 class="foot-headings p22MacF" style="font-size: 1.5vw;">Email</h4>
                        </li>
                        <li class="fit-con nav-item cascadiaF"><a href="mailto:humanityfirstinitiative.org@gmail.com"
                                style="font-size: 1vw;"
                                class=" foot-link">humanityfirstinitiative.org@gmail.com</a></li>
                        <li></li>
                    </ul>
                </div>

                <!-- news letter -->
                <div class="col-lg" id="nsltr">
                    <form action="Newsletter" method="post" id="nsltr-form" target="_blank">
                        <h5 class="foot-headings no-line p22MacF">Subscribe to our newsletter</h5>
                        <p class="foot-headings sub cascadiaF">To know upcoming events and mission updates!</p>
                        <div id="emailSubmitted" class="d-none" style="color: green">Email Successfully
                            submitted!</div>
                        <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                            <label for="newsletter1" class="visually-hidden p22MacF">Email address</label>
                            <input id="newsletter1" type="email" class="nslt-frm" name="email"
                                placeholder="Email address" required>
                            <button class="sub-btn" type="button"
                                onclick="resetAndSubmitNewsletter('nsltr-form', 'emailSubmitted')">Subscribe</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Footer-note  -->
            <div class="flex-column justify-content-center border-top-m pt-2">
                <div>
                    <p class="foot-headings footer-note cascadiaF">© 2022 HFI Org. All rights reserved.</p>
                </div>
                <div>
                    <ul class="list-unstyled d-flex justify-content-center mb-0">
                        <li class="ms-3"><a class="link-dark" href="#"><img src="Images/X-logo.png"
                                    alt="@Username" title="Twitter" style="width: 2.5vw"></a></li>
                        <li class="ms-3"><a class="link-dark" href="#"><img src="Images/fb-logo.png"
                                    alt="Page Name" title="Facebook" style="width: 2.5vw"></a></li>
                        <li class="ms-3"><a class="link-dark" href="#"><img src="Images/Insta-logo.png"
                                    alt="Page Name" title="Instagram" style="width: 2.5vw"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
      <!-- adds js for this specific file -->
      <script src="js/SetProfile.js"></script>
      <script src="js/footer.js"></script>
    </body>

  </html>