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
      <link rel="stylesheet" href="CSS/ProfileStyle.css">
      <link rel="stylesheet" href="CSS/footer.css">
      <!-- Javascript Import-->
      <!--FAVICON -->
      <link rel="icon" href="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg">
  </head>
  <%
    String name = (String) request.getAttribute("firstName") + " " + request.getAttribute("lastName");
  %>
  <body>
      <!-- header -->
      <header class="title-bar d-flex justify-content-center align-items-center">
        <!-- Title-bar -->
        <div class="container-fluid d-flex justify-content-between align-items-center">              
            <!-- Logo -->
            <div style="padding-left: 1.5vw;">
                <a href=""><img title="Home" src="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg" 
                alt="Logo" class="title-logo rounded-circle"></a>
              </div>
          <!-- Title  -->
          <div>
              <h1><a class="title-link" href="Home.jsp"> HUMANITY FIRST INITIATIVE </a></h1>
          </div>
          <!-- title button -->
          <span><a type="button" href="Logout" id="sign-out" class="btn btn-outline-light title-btn">Sign out</a></span>
        </div>
      </header>
      <!-- main -->
      <main class="d-flex">
          <!-- Contents -->
          <div class="content-wrapper">
              <!-- Profile -->
              <div class="col-lg d-flex align-items-center margin-logo">
                      <img src="Images/profile.png" alt="Profile" class="indicator-img" title="Profile">
                      <h3 class="indicator-text">Profile</h3>
              </div>
              <!-- card form -->
              <div class="d-flex row justify-content-center">
                  <div class="col-lg d-flex justify-content-center">
                      <div class="card" style="width: 60em;">
                          <img src="Images/place-holder-1.jpg" class="prof-img-top rounded-circle d-block mx-auto mt-5" alt="Profile Picture">
                          <div class="card-bod flex-column">
                            <div id="cardTitleHeading">
                                <h5 class="card-title" style="font-size: 4vw; text-align: center;"><%=name%></h5>
                              <h4 class="card-sub-title mb-3 pb-3" style="text-align: center;">@${username}</h4>
                            </div>

                            <!-- Form -->
                            <form>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="birthdate" class="form-label">Birthdate</label>
                                  <input type="text" id="birthdate" value="${birthdate}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="nationality" class="form-label">Nationality</label>
                                  <input type="text" id="nationality" value="${nationality}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="Address" class="form-label">Address</label>
                                  <input type="text" id="Address" value="${address}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="pin" class="form-label">Pin</label>
                                  <input type="text" id="pin" value="${pin}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="city" class="form-label">City</label>
                                  <input type="text" id="city" value="${city}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="state" class="form-label">State</label>
                                  <input type="text" id="state" value="${state}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="country" class="form-label">Country</label>
                                  <input type="text" id="country" value="${country}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="Bloodgroup" class="form-label">Bloodgroup</label>
                                  <input type="text" id="Bloodgroup" value="${Bloodgroup}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="phone" class="form-label">Phone</label>
                                  <input type="text" id="phone" value="${phone}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="email" class="form-label">Email</label>
                                  <input type="email" id="email" value="${email}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="profession" class="form-label">Profession</label>
                                  <input type="text" id="profession" value="${profession}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="hobby" class="form-label">Hobby</label>
                                  <input type="text" id="hobby" value="${hobby}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-evenly row">
                                <div class="col-lg">
                                  <label for="sex" class="form-label">Sex</label>
                                  <input type="text" id="sex" value="${sex}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                                <div class="col-lg">
                                  <label for="wpnumber" class="form-label">Whatsapp Number</label>
                                  <input type="text" id="wpnumber" value="${wpnumber}" class="form-control disabled-form" tabindex="-1" readonly>
                                </div>
                              </div>
                              <div class="d-flex justify-content-center row">
                                <div class="col-lg">
                                  <input type="button" onclick="redirectToPage()" value="Back" class="custom-btn">
                                </div>
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
                      <h5 class="foot-headings fit-con">Quick Links</h5>
                      <ul class="nav my-flex-column fit-con">
                      <li class="fit-con"><a href="Home.jsp"class="foot-link">Home</a></li>
                      <li class="fit-con"><a href="Donate"class="foot-link">Donations</a></li>
                      <li class="fit-con"><a href="#" class="foot-link">Terms & Conditions</a></li>
                      </ul>
                  </div>
                  
                  <!-- Socials -->
                  <div class="my-col fit-con">
                      <h5 class="foot-headings">Socials</h5>
                      <ul class="nav my-flex-column fit-con">
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
                          <li class="fit-con nav-item"><a style="font-size: 1vw;" class="foot-link"><em>7439272165</em></a></li>
                          <li class="fit-con nav-item"><a style="font-size: 1vw;" class="foot-link"><em>7439272165</em></a></li>
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
      <script>
        function redirectToPage() {
            window.location.href = 'Dashboard';
        }
    </script>
      <!-- adds js for footer file -->
      <script src="js/footer.js"></script>
  </body>
</html>