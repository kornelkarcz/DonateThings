<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Homepage</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body id="home" data-spy="scroll" data-target="#main-nav">
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>
<!-- HOME SECTION -->
<section id="home-section" class="template-section py-5">
    <div class="overlay">
        <div class="container">
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-7 text-center justify-content-center text-dark mt-5">
                    <h1 class="display-4">Start Helping</h1>
                    <h2 class="display-4">Give Away Unwanted Things</h2>
                    <div class="d-flex justify-content-around mt-4">
                        <div id="str" class="align-self-center option py-5 mt-2">
                            Donate Things
                        </div>
                        <div class="align-self-center option py-5 mt-2">
                            Organize Collection
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--HOME ICON SECTION  -->
<section id="home-icons" class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4 my-4 text-center">
                <i class="fas fa-users fa-3x align-self-center px-2 mb-4"> ${countUser}</i>
                <h3 class="mb-4">Active Users</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero,
                    veniam.
                </p>
            </div>
            <div class="col-md-4 my-4 text-center">
                <i class="fas fa-building fa-3x align-self-center px-2 mb-4"> 45</i>
                <h3 class="mb-4">Supported Fundations</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero,
                    veniam.
                </p>
            </div>
            <div class="col-md-4 my-4 text-center">
                <i class="fas fa-box fa-3x align-self-center px-2 mb-4"> 64</i>
                <h3 class="mb-4">Collected Donations</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Libero,
                    veniam.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- INSTRUCTION SECTION -->
<section id="instruction" class="template-section p-5">
    <div class="col text-center">
        <h3 class="display-4 py-5">How Does It Work?</h3>
    </div>
    <div class="container">
        <div class="row align-items-center p-4">
            <div class="col-md-3 text-center my-5">
                <i class="fas fa-hands fa-4x mb-4"></i>
                <h4>Choose Things</h4>
                <p>Clothes, toys, small-domestic applications and others</p>
            </div>
            <div class="col-md-3 text-center my-5">
                <i class="fas fa-box-open fa-4x mb-4"></i>
                <h4>Pack Them</h4>
                <p>Use boxes or even garbage bags</p>
            </div>
            <div class="col-md-3 text-center my-5">
                <i class="fas fa-search fa-4x mb-4"></i>
                <h4>Pick Benficiary</h4>
                <p>Choose trust-worthy place</p>
            </div>
            <div class="col-md-3 text-center my-5">
                <i class="fas fa-shipping-fast fa-4x mb-4"></i>
                <h4>Order Courier</h4>
                <p>Courier will pick up the package at your convenience</p>
            </div>
        </div>
    </div>
    <div class="row align-items-center p-5 mt-3">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <p id="create" class="btn btn-outline-dark btn-block p-4">Register Now</p>
        </div>
        <div class="col-md-4"></div>
    </div>
</section>

<!-- ABOUT US SECTION -->
<section id="about-us" class="template-section p-5">
    <div class="container">
        <div class="row d-flex justify-content-between">
            <div class="col-md-6">
                <h3 class="p-4 text-center text-dark">
                    About Us
                </h3>
                <p class="lead text-center">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus
                    voluptatum
                    libero quam molestiae consequuntur. Rem rerum accusamus tempore error ab, excepturi ex quidem
                    quaerat labore
                    fugit animi eveniet vitae dolor quo vel dignissimos voluptates, temporibus odit optio. Impedit,
                    dolorum
                    nostrum voluptatum suscipit, in fugiat quia rem laboriosam dolore, eaque aliquid!</p>
            </div>
            <div class="col-md-6">
                <img src="/images/about-us.jpg" alt="" class="img-fluid ml-auto">
            </div>
        </div>
    </div>
</section>

<!-- SUPPORT SECTION -->
<section id="support" class="template-section p-5">
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10 text-center">
                <h2 class="display-4 my-5">Who Do We Support?</h2>
                <ul class="nav md-pills nav-justified mb-4">
                    <li class="nav-item mx-5 pl-0">
                        <a class="nav-link active " data-toggle="tab" href="#fundations" role="tab">Fundations</a>
                    </li>
                    <li class="nav-item mx-5">
                        <a class="nav-link" data-toggle="tab" href="#ngos" role="tab">NGOs</a>
                    </li>
                    <li class="nav-item mx-5 pr-0">
                        <a class="nav-link" data-toggle="tab" href="#local-collections" role="tab">Local Collections</a>
                    </li>
                </ul>
                <div class="tab-content card">
                    <div class="tab-pane fade in show active" id="fundations">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil odit magnam minima, soluta
                            doloribus
                            reiciendis molestiae placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
                            placeat ratione
                            porro voluptate odit minima.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil odit magnam minima, soluta
                            doloribus
                            reiciendis molestiae placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
                            placeat ratione
                            porro voluptate odit minima.</p>
                    </div>
                    <div class="tab-pane fade" id="ngos">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil odit magnam minima, soluta
                            doloribus
                            reiciendis molestiae placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
                            placeat ratione
                            porro voluptate odit minima.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil odit magnam minima, soluta
                            doloribus
                            reiciendis molestiae placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
                            placeat ratione
                            porro voluptate odit minima.</p>
                    </div>
                    <div class="tab-pane fade" id="local-collections">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil odit magnam minima, soluta
                            doloribus
                            reiciendis molestiae placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
                            placeat ratione
                            porro voluptate odit minima.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil odit magnam minima, soluta
                            doloribus
                            reiciendis molestiae placeat unde eos molestias. Quisquam aperiam, pariatur. Tempora,
                            placeat ratione
                            porro voluptate odit minima.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer id="main-footer" class="template-section text-center p-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-7"></div>
            <div class="col-md-5">
                <h2 class="display-4">Contact Us</h2>
                <form action="#" method="post">
                    <div class="row mt-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="First Name"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Last Name"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Message"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="submit" class="submit btn btn-block" value="Send"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row d-flex justify-content-around mt-5">
            <div id="copyright" class="ml-auto">Copyright &copy; <span id="year"></span> Donate Things</div>
            <div class="ml-auto">
                <a id="twitter-icon" class="mr-2" href="https://www.twitter.com">
                    <i class="fab fa-twitter fa-2x"></i>
                </a>
                <a id="facebook-icon" class="mr-2" href="https://www.facebook.com">
                    <i class="fab fa-facebook-square fa-2x mr-2"></i>
                </a>
                <a id="instagram-icon" class="mr-2" href="https://www.instagram.com">
                    <i class="fab fa-instagram fa-2x"></i>
                </a>
            </div>
        </div>
    </div>
</footer>
    <%@ include file="scripts.jsp" %>
</body>
</html>