<h3><?php echo $heading_title; ?></h3>
<div class="row">

    <?php /* Bulk Specials Editor */ ?>
    <?php if(isset($timer_custom_css_styles)) echo $timer_custom_css_styles; ?>
    <?php /* Bulk Specials Editor */ ?>
    
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        
    <?php /* Bulk Specials Editor */ ?>
    <?php if ($product['timer']) { ?>
      
    <div class="timer-block">
      <div class="prices-block">
        <span class="special-price"><?php echo $product['special']; ?></span>
        <span class="old-price"><?php echo $product['price']; ?></span>
        <span class="percentage-discount"><?php echo $text_timer_on_products_page . '-' . $product['percentage_discount']; ?>%</span>
      </div>
      <div class="timer_featured_<?php echo $product['product_id'];?>"></div>
    </div>

    <script type="text/javascript">
      $(document).ready(function() {
        $('.timer_featured_<?php echo $product['product_id'];?>').countdown({until: <?php echo $product['special_date_diff']; ?>});
      });
    </script>

    <?php } ?>
    <?php /* Bulk Specials Editor */ ?>
    
    <?php if ($product['price'] /* Bulk Specials Editor */  && !$product['timer'] /* Bulk Specials Editor */
    ) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
