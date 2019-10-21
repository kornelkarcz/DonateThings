<!-- FOOTER -->
<footer id="main-footer" class="template-section text-center p-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-7"></div>
            <div class="col-md-5">
                <h2 class="display-4">Contact Us</h2>

                <form:form action="/" method="post" class="form-footer" modelAttribute="message">
                    <div class="row mt-5">
                        <div class="col-md-6">
                            <div class="form-footer-item">
                                <form:input path="name" type="text"/>
                                <span data-placeholder="Name"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-footer-item">
                                <form:input path="email" type="email"/>
                                <span data-placeholder="Email"></span>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-footer-item">
                                <form:input path="messageBody" type="text"/>
                                <span data-placeholder="Message"></span>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="submit" class="submit btn btn-block" value="Send"/>
                            </div>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>
        <div class="row d-flex justify-content-around mt-5">
            <div id="copyright" class="ml-auto">
                Copyright &copy; <span id="year"></span> Donate Things
            </div>
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
<script type="text/javascript">
    $('#year').text(new Date().getFullYear());

    $(document).ready(function () {
        let inputVar = $(".form-footer-item input");
        for (let i = 0; i < inputVar.length; i++) {
            console.log(inputVar[i].valueOf());
            inputVar[i].value = "";
        }
    });

    $(".form-footer-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".form-footer-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>