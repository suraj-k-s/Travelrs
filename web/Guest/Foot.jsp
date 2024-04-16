<div class="inner dark">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-8 mb-3 mb-md-0 mx-auto">
                                            <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>© 2024 Expedia, Inc., an Expedia Group company. All rights reserved. Expedi aare trademarks or registered trademarks of Expedia, Inc.</p></div>
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

	<script src="../tours( Templete )/js/jquery-3.4.1.min.js"></script>
	<script src="../tours( Templete )/js/popper.min.js"></script>
	<script src="../tours( Templete )/js/bootstrap.min.js"></script>
	<script src="../tours( Templete )/js/owl.carousel.min.js"></script>
	<script src="../tours( Templete )/js/jquery.animateNumber.min.js"></script>
	<script src="../tours( Templete )/js/jquery.waypoints.min.js"></script>
	<script src="../tours( Templete )/js/jquery.fancybox.min.js"></script>
	<script src="../tours( Templete )/js/aos.js"></script>
	<script src="../tours( Templete )/js/moment.min.js"></script>
	<script src="../tours( Templete )/js/daterangepicker.js"></script>

	<script src="../tours( Templete )/js/typed.js"></script>
	<script>
		$(function() {
			var slides = $('.slides'),
			images = slides.find('img');

			images.each(function(i) {
				$(this).attr('data-id', i + 1);
			})

			var typed = new Typed('.typed-words', {
				strings: ["San Francisco."," Paris."," New Zealand.", " Maui.", " London."," India."," Fuji."],
				typeSpeed: 80,
				backSpeed: 80,
				backDelay: 4000,
				startDelay: 1000,
				loop: true,
				showCursor: true,
				preStringTyped: (arrayPos, self) => {
					arrayPos++;
					console.log(arrayPos);
					$('.slides img').removeClass('active');
					$('.slides img[data-id="'+arrayPos+'"]').addClass('active');
				}

			});
		})
            
	</script>

	<script src="../tours( Templete )/js/custom.js"></script>

</body>

</html>
<%@include file="Foot.jsp" %>