<br><br><br><br><br>

<div class="site-footer">
    <div class="inner first">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <div class="widget">
                        <header class="header" id="header">
                            <div class="container">
                                <a class="navbar-brand nav" href="index1.html">
                                    <img src="../00.svg" height="100" alt="logo"  />
                                </a>
                            </div>
                        </header>
                        <h3 class="heading">About Expedia</h3>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    </div>

                    <div class="widget">
                        <ul class="list-unstyled social">
                            <li><a href="#"><span class="icon-twitter"></span></a></li>
                            <li><a href="#"><span class="icon-instagram"></span></a></li>
                            <li><a href="#"><span class="icon-facebook"></span></a></li>
                            <li><a href="#"><span class="icon-linkedin"></span></a></li>
                            <li><a href="#"><span class="icon-dribbble"></span></a></li>
                            <li><a href="#"><span class="icon-pinterest"></span></a></li>
                            <li><a href="#"><span class="icon-apple"></span></a></li>
                            <li><a href="#"><span class="icon-google"></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2 pl-lg-5">
                    <div class="widget">
                        <h3 class="heading">Pages</h3>
                        <ul class="links list-unstyled">
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2">
                    <div class="widget">
                        <h3 class="heading">Resources</h3>
                        <ul class="links list-unstyled">
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="widget">
                        <h3 class="heading">Contact</h3>
                        <ul class="list-unstyled quick-info links">
                            <li class="email"><a href="#">mail@example.com</a></li>
                            <li class="phone"><a href="#">+1 222 212 3819</a></li>
                            <li class="address"><a href="#">43 Raymouth Rd. Baltemoer, London 3910</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="inner dark">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 mb-3 mb-md-0 mx-auto">
                    <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co" class="link-highlight">Untree.co</a> <!-- License information: https://untree.co/license/ -->Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a>
                    </p>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="overlayer"></div>
<div class="loader">
    <div class="spinner-border" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>

<script src="../Assets/Template/Main/js/jquery-3.4.1.min.js"></script>
<script src="../Assets/Template/Main/js/popper.min.js"></script>
<script src="../Assets/Template/Main/js/bootstrap.min.js"></script>
<script src="../Assets/Template/Main/js/owl.carousel.min.js"></script>
<script src="../Assets/Template/Main/js/jquery.animateNumber.min.js"></script>
<script src="../Assets/Template/Main/js/jquery.waypoints.min.js"></script>
<script src="../Assets/Template/Main/js/jquery.fancybox.min.js"></script>
<script src="../Assets/Template/Main/js/aos.js"></script>
<script src="../Assets/Template/Main/js/moment.min.js"></script>
<script src="../Assets/Template/Main/js/daterangepicker.js"></script>

<script src="../Assets/Template/Main/js/typed.js"></script>
<script>
                                $(function() {
                                var slides = $('.slides'),
                                        images = slides.find('img');
                                        images.each(function(i) {
                                        $(this).attr('data-id', i + 1);
                                        })

                                        var typed = new Typed('.typed-words', {
                                        strings: ["San Francisco.", " Paris.", " New Zealand.", " Maui.", " London."],
                                                typeSpeed: 80,
                                                backSpeed: 80,
                                                backDelay: 4000,
                                                startDelay: 1000,
                                                loop: true,
                                                showCursor: true,
                                                preStringTyped: (arrayPos, self) = > {
                                        arrayPos++;
                                                console.log(arrayPos);
                                                $('.slides img').removeClass('active');
                                                $('.slides img[data-id="' + arrayPos + '"]').addClass('active');
                                        }

                                        });
                                })
</script>

<script src="../Assets/Template/Main/js/custom.js"></script>

</body>

</html>
