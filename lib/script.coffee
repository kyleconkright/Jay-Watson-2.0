$ ->

	songs = ['276460687','504965130','329093515','203910723','284193124','331646673','319100093','721242118','613132533','402625405','27910495','152620650','483670359','321597782','279264164','309969982']
		
	itunes = () -> $.ajax
		url: "https://itunes.apple.com/lookup?id=#{song}&entity=song&callback=?"
		type: 'GET'
		dataType: 'json'
		success: (data) ->
			$('<li></li>')
			.append('<a class="play" href="' + data.results[0].previewUrl + '"><i class="fa fa-play-circle-o"></i></a><p><span class="artist">' + data.results[0].artistName + '</span> - <span class="song">"' + data.results[0].trackName + '"</span></p><a class="buy" target="_blank" href="' + data.results[0].trackViewUrl + '"><i class="fa fa-apple"></i> iTunes</a>')
			.appendTo('#playlist ul')
		complete: ->
			$('#playlist ul li:even').css('background':'rgba(255,255,255,.1)');

	itunes song for song in songs	

	$.ajax
		url: 'data/series.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$.each results.response.seriesList, ->
				$('<div class="seriesInfo" id="gallery-title">
						<h2>' + this.title + '</h2>
						<span class="share">
							<a href="http://twitter.com/share?url=http%3A%2F%2Fjay.gprojectgear.com%2F%23' + this.id + '" target="_blank"><i class="fa fa-twitter"></i></a>
							<a href="http://www.facebook.com/sharer/sharer.php?s=100&p[summary]=Stream%20Eric%20Hutchinson%27s%20New%20Single%20%22TELL%20THE%20WORLD%22&p[url]=http%3A%2F%2Fjay.gprojectgear.com%2F%23' + this.id + '" target="_blank"><i class="fa fa-facebook"></i></a>
							<a href="http://www.pinterest.com/pin/create/button/?url=http%3A%2F%2Fjay.gprojectgear.com%2F%23' + this.id + '&media=http%3A%2F%2Fkyleconkright.com/jay/assets/series/' + this.id + '/' + this.photoSet.photo[0].url + '&description=' + this.title + '" target="_blank"><i class="fa fa-pinterest"></i></a>
						</span>
					</div>
					<ul class="seriesPhotos" id="' + this.id + '"></ul>')
				.appendTo('#gallery')
				$.each this.photoSet.photo, ->
					$('<li class="photo" style="background-image: url(assets/series/' + this.rel + '/' + this.url + ');"><a href="assets/series/'+ this.rel + '/' + this.url + '" data-lightbox-gallery="' + this.rel + '" title="' + this.caption + '"></a></li>')
					.appendTo('div#gallery ul#' + this.rel)
		complete: ->
			$('#gallery ul li a').nivoLightbox({
				theme: 'default',
				keyboardNav: true,
				clickOverlayToClose: true
				})

			

	$.ajax
		url: 'data/series.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$.each results.response.masthead, ->
				$('<li style="background-image: url(assets/series/' + this.id + '/' + this.mastPhoto + ');"><div class="mastcaption"><p>' + this.title + '</p></div></li>').appendTo('#masthead ul')
		complete: ->
			$("#masthead ul").responsiveSlides()

	

