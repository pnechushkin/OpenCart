<?php echo $header; ?>
<?php $config = $this->registry->get('config'); 
$shopme_quicklook = $config->get('shopme_text_ql');
if(empty($shopme_quicklook[$config->get('config_language_id')])) {
$shopme_text_ql = false;
} else if (isset($shopme_quicklook[$config->get('config_language_id')])) {
$shopme_text_ql = html_entity_decode($shopme_quicklook[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
}
?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
  
  <?php echo $column_left; ?>
    
<?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> <?php echo $config->get('shopme_grid_category'); ?>">
    <?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
   <div class="bordered_content products_holder box">
  <div class="product-filter">
    <div class="left_side">
    <div class="limit hidden-sm hidden-xs"><?php echo $text_limit; ?>
      <select id="input-limit" onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><?php echo $text_sort; ?>
      <select id="input-sort" onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>     
    </div>
    </div>
    <div class="right_side display">
    <a id="grid_view_icon"><i class="fa fa-th"></i></a><a id="list_view_icon"><i class="fa fa-list"></i></a>
    </div>
  </div>
  <div id="main" class="eq_height product-<?php echo $config->get('shopme_default_view'); ?>">
    <?php foreach ($products as $product) { ?>
    <div class="item">
    <div class="left">
        <div class="image_wrap">
        <div class="btn-holder top">
            <!-- wishlist -->
            <a class="btn btn-icon wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" data-placement="right" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
            <!-- compare -->
            <a class="btn btn-icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_compare; ?>" <?php if ($config->get('shopme_default_product_style') == "style-4") { echo 'data-placement="left"'; } ?>"><i class="icon-resize-small"></i></a>
            <!-- quicklook -->
            <div class="centered">
            <div class="centered_cell">
            <?php if ($shopme_text_ql) {?>
            <a class="btn btn-dark qlook quickview" rel="nofollow" href="<?php echo $product['quickview']; ?>" 
            <?php if ($config->get('shopme_default_product_style') == "style-2") { echo 'data-toggle="tooltip"'; } ?> title="<?php echo $shopme_text_ql; ?>"><i class="fa fa-eye"></i><span><?php echo $shopme_text_ql; ?></span></a>
            <?php } ?>
            <span class="style-4-break"></span>
            <!-- add to cart -->
            <a class="btn btn-primary cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" <?php if ($config->get('shopme_default_product_style') == "style-2") { echo 'data-toggle="tooltip" data-placement="left"'; } ?> title="<?php echo $button_cart; ?>"><i class="icon-basket"></i><span><?php echo $button_cart; ?></span></a>
            </div>
            </div>
            </div>
            <div class="image">
            <?php if ($product['special'] && ($config->get('shopme_percentage_sale_badge') == 'enabled')) { ?>
            <div class="sale_badge">-<?php echo $product['sales_percantage']; ?>%</div>
            <?php } ?>
            <?php if ($product['thumb_hover'] && ($config->get('shopme_rollover_effect') == 'enabled')) { ?>
            <div class="image_hover"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_hover']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
            <?php } elseif ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
            <?php } ?>
            </div><!-- image ends -->
            </div><!-- image_wrap ends -->
           <?php if (($product['special']) && ($product['special_date_end'] > 0) && ($config->get('shopme_countdown'))) { ?>
            <div class="list_countdown">
            <div class="countdown <?php echo $product['product_id']; ?>"></div>
            </div>
            <script type="text/javascript">
            $('.<?php echo $product['product_id']; ?>').countdown({
            until: <?php echo $product['special_date_end']; ?>, 
            layout: '<div><p>{dn}</p>{dl}</div> <div><p>{hn}</p>{hl}</div> <div><p>{mn}</p>{ml}</div> <div><p>{sn}</p>{sl}</div>'});
            </script>
            <?php } ?>
           </div><!-- left ends -->
            <div class="details_wrap">
            <div class="information_wrapper">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div class="price_rating_table <?php if ($product['rating']) { echo "hasrating"; } ?>">
            
    <?php /* Bulk Specials Editor */ ?>
    <?php if ($product['timer']) { ?>
      
    <div class="timer-block">
      <div class="prices-block">
        <span class="special-price"><?php echo $product['special']; ?></span>
        <span class="old-price"><?php echo $product['price']; ?></span>
        <span class="percentage-discount"><?php echo $text_timer_on_products_page . '-' . $product['percentage_discount']; ?>%</span>
      </div>
      <div class="timer_<?php echo $product['product_id'];?>"></div>
    </div>

    <script type="text/javascript">
      $(document).ready(function() {
        $('.timer_<?php echo $product['product_id'];?>').countdown({until: <?php echo $product['special_date_diff']; ?>});
      });
    </script>

    <?php } ?>
    <?php /* Bulk Specials Editor */ ?>
    
    <?php if ($product['price'] /* Bulk Specials Editor */  && !$product['timer'] /* Bulk Specials Editor */
    ) { ?>
            <div class="price">
            <?php if (!$product['special']) { ?>
            <span><?php echo $product['price']; ?></span>
            <?php } else { ?>
            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
            </div>
            <?php } ?>
            <?php if ($product['rating']) { ?>      
            <div class="rating">
            <span class="rating_stars rating r<?php echo $product['rating']; ?>">
           <i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
           </span>
            </div>
            <?php } ?>
            </div><!-- price_rating_table -->
            <div class="description"><?php echo $product['description']; ?></div>
            </div><!-- informtion wrapper ends -->
            <div class="btn-holder bottom">
            <!-- add to cart -->
            <a class="btn btn-primary" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></a>
            <!-- wishlist -->
            <a class="btn btn-icon wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
            <!-- compare -->
            <a class="btn btn-icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_compare; ?>"><i class="icon-resize-small"></i></a>
            <!-- quicklook -->
            </div>
            <div class="plain_links">
            <a class="plain_link wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_wishlist; ?></a>
            <a class="plain_link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" ><?php echo $button_compare; ?></a>
            </div>
            </div><!-- details_wrap ends -->
        </div><!-- item ends -->
    <?php } ?>
  </div> <!-- #main ends -->
    
  <div class="bottom_buttons pagination_holder">
    <div class="row">
    <div class="col-sm-6 text-left"><?php echo $results; ?></div>
    <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
    </div>
  </div>
  </div> <!-- .bordered ends -->
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
   
<script type="text/javascript">
$(function() {
	var pv = $.cookie('product_view');
	if (pv == 'g') {
		$('#main').removeClass('product-list');
		$('#main').addClass('product-grid');
		$('#list_view_icon').removeClass();

		$('#grid_view_icon').addClass('active');
	} else if (pv == 'l') {
		$('#main').removeClass('product-grid');
		$('#main').addClass('product-list');
		$('#grid_view_icon').removeClass();
		$('#list_view_icon').addClass('active');
	} else {
		$('#<?php echo $config->get('shopme_default_view'); ?>_view_icon').addClass('active');
	}
});
$(window).load(function() {
	$('#grid_view_icon').click(function() {
		$(this).addClass('active');
		$('#list_view_icon').removeClass();
		$('#main').fadeTo( 150, 0, function() {
			$(this).removeClass('product-list');
			$(this).addClass('product-grid').fadeTo( 500, 1);
			$('#content .product-grid.eq_height .item').matchHeight();
			$.cookie('product_view', 'g');
		});
		return false;
	});
	$('#list_view_icon').click(function() {
		$(this).addClass('active');
		$('#grid_view_icon').removeClass();
		$('#main').fadeTo( 150, 0, function() {
			$(this).removeClass('product-grid');
			$(this).addClass('product-list').fadeTo( 500, 1);
			$.cookie('product_view', 'l');
		});
		return false;
	});
});
</script>
</div>

    <?php /* Bulk Specials Editor */ ?>
    <?php if(isset($timer_custom_css_styles)) echo $timer_custom_css_styles; ?>
    <?php /* Bulk Specials Editor */ ?>
    
<?php echo $footer; ?>