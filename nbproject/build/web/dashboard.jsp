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

    <body>
        <!-- header -->
        <header class="title-bar d-flex justify-content-center align-items-center">
          <!-- Logo -->
          <div style="padding-left: 1.5vw;">
            <a href="Home.jsp"><img title="Home" src="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg" 
            alt="Logo" class="title-logo rounded-circle"></a>
          </div>
          <!-- Title-bar -->
          <div class="container-fluid d-flex justify-content-between align-items-center">              
            <!-- Hidden menu -->
            <div class="dropdown" id="ham-button">
              <a class="d-flex align-items-center justify-content-center text-decoration-none" id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="Images/ham.png" alt="" class="rounded-circle ham-icon">
              </a>
              <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
                <li>
                  <a class="dropdown-item" href="Home.jsp">Home</a>
                </li>
                <li><a class="dropdown-item" href="Donation">Donations</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="Profile">Profile</a></li>
                <li><a class="dropdown-item" href="Logout">Sign out</a></li>
              </ul>
            </div>
            <!-- Title  -->
            <div>
                <h1><a class="title-link" href="Home.jsp"> HUMANITY FIRST INITIATIVE </a></h1>
            </div>
            <!-- title button -->
            <span><a type="button" href="Logout" id="sign-out" class="btn btn-outline-light title-btn">Sign Out</a></span>
          </div>
        </header>
        <!-- main -->
        <main class="d-flex">
            <!-- Side-bar small -->
            <div class="d-flex flex-column flex-shrink-0 bg-col side-bar" id="side-bar">
                <ul class="nav nav-pills nav-flush flex-column mb-auto">
                  <li id="sb-icon-1">
                    <a href="index.html" class="nav-link py-3 border-bottom side-bar-sm-links" title="Home" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
                      <img src="Images/Home-icon-2.png" title="Home" class="side-bar-sm-icons">
                    </a>
                  </li>
                  <li id="sb-icon-2">
                    <a class="nav-link py-3 activa border-bottom side-bar-sm-links" title="Dashboard" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Dashboard" aria-current="page">
                      <img src="Images/dashboard-icon-2.png" title="Dashboard" class="side-bar-sm-icons">
                    </a>
                  </li>
                  <li id="sb-icon-3">
                    <a href="Donations" class="nav-link py-3 border-bottom side-bar-sm-links" title="Donations" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                      <img src="Images/donate-Icon-2.png" title="Donations" class="side-bar-sm-icons">
                    </a>
                  </li>
                </ul>
                <!-- Dropdown box -->
                <div class="dropdown border-top-m">
                  <a href="Profile" class="d-flex align-items-center justify-content-center text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                      <img src="Images/place-holder-1.jpg" alt="${name}" title="${name}" class="rounded-circle drop-icon">
                  </a>
                  <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
                    <li><a class="dropdown-item" href="Profile">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="Logout">Sign out</a></li>
                  </ul>
                </div>
            </div>
            <!-- Side-bar large -->
            <div class="d-flex flex-column flex-shrink-0 bg-col py-3 d-none text-white " id="side-bar-lg" style="width: 22vw; max-height: fit-content; padding-left: 1em;">
              <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                  <a href="Home.jsp"class="nav-link sb-link">
                    <img src="Images/Home-icon-2.png" alt="Home" title="Home" class="side-bar-lg-icons">
                    Home
                  </a>
                </li>
                <li>
                  <a href="Dashboard" class="nav-link sb-link" aria-current="page">
                    <img src="Images/dashboard-icon-2.png" alt="Dashboard" title="Dashboard" class="side-bar-lg-icons">
                    Dashboard
                  </a>
                </li>
                <li>
                  <a href="Donations" class="nav-link sb-link">
                    <img src="Images/donate-Icon-2.png" alt="Donations" title="Donations" class="side-bar-lg-icons">
                    Donations
                  </a>
                </li>
                <li>
                  <a href="Logout" class="nav-link sb-link">
                    <img src="Images/sign-out-icon.png" alt="sign out" title="sign out" class="side-bar-lg-icons">
                    sign out
                  </a>
                </li>
              </ul>
            </div>
            <!-- Contents -->
            <div class="content-wrapper">
                <!-- Dashboard -->
                <div class="col-lg d-flex align-items-center">
                        <img src="Images/dash.png" alt="Dashboard" class="dash-img" title="Dashboard">
                        <h3 class="dash-text">Dashboard</h3>
                </div>
                <!-- card row 1 -->
                <div class="d-flex row justify-content-center">
                    <div class="col-lg d-flex justify-content-center">
                        <div class="card" style="width: 60em;">
                            <img src="Images/place-holder-1.jpg" class="prof-img-top rounded-circle d-block mx-auto mt-5" alt="...">
                            <div class="card-bod justify-content-center">
                                <h5 class="card-title" style="font-size: 4vw; text-align: center;">${name}</h5>
                                <h4 class="card-sub-title mb-3 pb-3" style="text-align: center;">@${username}</h4>
                                <p class="card-text my-0" style="font-size: 2vw;"><b>Phone:</b> <em>${phone}</p></em></p>
                                <p class="card-text my-0" style="font-size: 2vw;"><b>Email:</b> <a class="mail-link" href="${email}">${email}</a></p>
                                <p class="card-text" style="font-size: 2vw;"><b>Address:</b> <em>${address}</em></p>
                                <div class="d-flex justify-content-center">
                                  <a href="Profile" class="custom-btn text-center">Edit</a>
                              </div>
                            </div>
                        </div>                       
                    </div>
                </div>
                <!-- Cards row 2 -->
                <div class="d-flex row justify-content-center">
                    <div class="col-lg d-flex justify-content-center">
                        <div class="card">
                            <img src="Images/place-holder-1.jpg" class="card-img-top" alt="...">
                            <div class="card-bod">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <div class="d-flex justify-content-center">
                                  <a href="#" class="custom-btn text-center">Edit</a>
                              </div>
                            </div>
                        </div>                       
                    </div>
                    <div class="col-lg d-flex justify-content-center">
                        <div class="card">
                            <img src="Images/place-holder-2.jpg" class="card-img-top" alt="...">
                            <div class="card-bod">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <div class="d-flex justify-content-center">
                                  <a href="#" class="custom-btn text-center">Edit</a>
                              </div>
                            </div>
                        </div>                        
                    </div>
                    <div class="col-lg d-flex justify-content-center">
                        <div class="card">
                            <img src="Images/place-holder-3.jpg" class="card-img-top" alt="...">
                            <div class="card-bod">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <div class="d-flex justify-content-center">
                                  <a href="#" class="custom-btn text-center">Edit</a>
                              </div>
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
        <!-- Javascript for the collapsing view port -->
        <script>
            // Function to check viewport width and hide sidebar if too small
            function checkViewportWidth() {
                const viewportWidth = window.innerWidth;
                const sidebar = document.getElementById("side-bar");
                const ham = document.getElementById("ham-button");
                const sidebarLg = document.getElementById("side-bar-lg");
                var enable

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
        </script>
        <script src="js/footer.js"></script>
</body>
</html>