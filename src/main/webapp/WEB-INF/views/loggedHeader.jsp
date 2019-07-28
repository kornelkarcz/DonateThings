<!-- NAVBAR SECTION -->
<nav class="navbar navbar-expand-md fixed-top navbar-light fixed-top py-4"
     id="main-nav">
    <div class="container">
        <a href="/" class="navbar-brand">
            <img src="${pageContext.request.contextPath}/images/logo.png" width="75" height="75" alt=""/>
            <h3 class="d-inline align-middle">Donate Things</h3>
        </a>
        <div id="navigation-content" class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item px-2">
                    <a href="#home-section" class="nav-link">Home</a>
                </li>
                <li class="nav-item px-2">
                    <a href="#instruction" class="nav-link">How Does It Work?</a>
                </li>
                <li class="nav-item px-2">
                    <a href="#support" class="nav-link">Fundations</a>
                </li>
                <li class="nav-item px-2">
                    <a href="#about-us" class="nav-link">About Us</a>
                </li>
                <li class="nav-item px-2">
                    <a href="" class="nav-link">Contact</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item px-2">
                    <a href="/profile/" class="nav-link">Hello, ${firstName}!</a>
                </li>
                <li class="nav-item px-2">
                    <a href="/logout" class="nav-link">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>