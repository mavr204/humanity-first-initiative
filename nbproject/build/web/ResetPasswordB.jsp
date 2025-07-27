<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" href="CSS/SignUpStyle.css">
        <link rel="stylesheet" href="CSS/footer.css">
        <!-- Javascript Import-->
        <!--FAVICON -->
        <link rel="icon" href="https://www.logolynx.com/images/logolynx/af/af9677459fff9298be379a290e71434d.jpeg">
    </head>

    <body>
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
        <main class="login-wrapper">
            <div class="login-side">
                <div class="my-form__wrapper">
                    <div class="login-welcome-row">
                        <h1>OTP Sent!</h1>
                        <p>Check Your Registered Email!</p>
                    </div>
                    <form action="ResetPasswordB" method="post">
                        <div class="socials-row">
                            <a href="#" title="Use Google">
                                <img src="Images/google.png" alt="Google">
                                Log in with Google
                            </a>
                            <a href="#" title="Use Apple">
                                <img src="Images/apple.png" alt="Apple">
                                Log in with Apple
                            </a>
                        </div>
                        <div class="divider">
                            <div class="divider-line"></div>
                            Or
                            <div class="divider-line"></div>
                        </div>
                        <div class="text-field">
                            <label for="username">OTP: </label>
                            <input type="text" id="username" name="otp" placeholder="OTP" maxlength="6" minlength="6"
                                required>
                        </div>
                        <div class="text-field">
                            <label for="password">New Password:</label>
                            <input id="password" type="password" name="password" placeholder="Your Password" title="Minimum 6 characters at 
                                        least 1 Alphabet and 1 Number" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"
                                required>
                        </div>
                        <div class="text-field">
                            <label for="confirm-password">Confirm Password:</label>
                            <input id="confirm-password" type="password" name="password" placeholder="Repeat Password"
                                title="Minimum 6 characters at east 1 Alphabet and 1 Number"
                                pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$" required>
                        </div>
                        <input type="submit" class="my-form__button" value="Reset Password">
                        <div class="my-form__actions">
                            <div class="my-form__row">
                            </div>
                            <div class="my-form__signup">
                                <a href="Login.html" title="Log in">
                                    Log in
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="info-side">

                <img src="Images/mock.png" alt="Mock" class="mockup">
                <div class="welcome-message">
                    <h2>Welcome</h2>
                    <p>
                        Welcome to our NGO family, where your passion for helping others finds its true home!
                    </p>
                </div>
            </div>
        </main>
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
        <script src="js/SignUpJS.js"></script>
        <script src="js/footer.js"></script>
    </body>

    </html>