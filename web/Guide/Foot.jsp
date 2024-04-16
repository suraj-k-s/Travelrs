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
