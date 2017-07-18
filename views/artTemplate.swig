{% extends 'layout-2.swig' %}
{% set title = 'Artwork' %}
{% block body %}
	<div class="container">
		<div class="banner">
			<div class="top">
				<div class="bold left">Collection Object ID {{ art.obj_id }}</div>
				<div class="middle">Catalog Sheet</div>
				<div class="right">Examined: Michele Seekings 01-17</div>
			</div>
		</div>
		<header>
			<div class="main">
			<div class="title">
				<p class="collection-title"><span class="bold">{{ cust.lastName }}</span> {{ cust.collectionName }}</p>
			</div>
			<div class="logo">
				<img class="logo-img" src="/images/red_82x44.png" />
			</div>
			</div>
			<div class="bottom">
				<div class="subheading">Collection Inventory 2017 | Prepared by Spire Art Services</div>
			</div>
		</header>
		<div>
			<div class="column-left bg-gray">
				<div class="label-block">
					<span class="bold">Type:</span><p class="value"> {{ art.type }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Artist:</span><p class="value"> Fraser, West (American, b. 1955)</p>
				</div>
				<div class="label-block">
					<span class="bold">Title:</span><p class="value"> {{ art.title }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Medium:</span><p class="value"> {{ art.medium }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Description:</span><p class="value"> {{ art.description}}</p>
				</div><br />
				<div class="label-block">  
					<span class="bold">Dimensions (HxWxD):</span><p class="value"> {{ art.dimensions }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Dimensions Frame:</span><p class="value"> {{ art.frame_dimensions }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Condition:</span><p class="value"> {{ art.condition }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Current Location:</span><p class="value"> {{ art.current_location }}</p>
				</div>
				<div class="label-block">
					<span class="bold">Source:</span><p class="value"> Helena Fox Fine Art, Charleston, SC - 2009</p>
				</div>

				<div class="divider"></div>

				<div class="label-block">
					<p class="label-heading bold">Provenance:</p><p class="block-value"> Purchased from artist/gallery</p>
				</div>

				<div class="divider"></div>

				<div class="label-block"> 
					<img src="/images/blue_183x83.png" />
					<p class="label-heading bold">Note:</p><p class="block-value"> Signed by artist lower left corner (facing) and dated ’09.</p>
					<p class="block-value">Since work is framed, accurate piece depth dimension was not specifically noted. Total depth dimension noted with frame dimension.</p>
				</div>

				<div class="divider"></div>

				<div class="label-block">
					<img src="/images/green_172x144.png" />
					<p class="label-heading bold">Frame:</p><p class="block-value"> Gilt wood frame with dark outer accent</p>
				</div>
			</div>
			<div class="column-right">
				<div class="big-img">
					<img src="/images/pink_988x792.png" />
				</div>
					<div class="bio">
					<h3 class="bold">Artist’s Biography</h3>
					<p class="bold">{{ art.artist.biography }}</p>
				</div>
			</div>
		</div>
	</div>
{% endblock %}