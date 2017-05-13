<?php echo $header; ?>
<?php $config = $this->registry->get('config'); ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row">
  
  <?php echo $column_left; ?>
    
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="box">
      <div class="cart-info">
    <table>
      <?php if ($products) { ?>
      <thead>
        <tr>
          <td class="image tablet_hide"><?php echo $column_image; ?></td>
          <td class="name"><?php echo $column_name; ?></td>
          <td class="model tablet_hide"><?php echo $column_model; ?></td>
          <td class="stock tablet_hide"><?php echo $column_stock; ?></td>
          <td class="price tablet_hide"><?php echo $column_price; ?></td>
          <td class="action" style="width:20%;"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody>
      <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image tablet_hide"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <div class="desktop_hide">
          <div class="up_to_tablet">
          <small><?php echo $column_model; ?>: <?php echo $product['model']; ?></small>
          <small><?php echo $column_stock; ?>: <?php echo $product['stock']; ?></small>
          <?php if ($product['price']) { ?>
              <?php if (!$product['special']) { ?>
              <small><?php echo $column_price; ?>: <?php echo $product['price']; ?></small><br />
              <?php } else { ?>
              <small><?php echo $column_price; ?>: <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b></small><br />
              <?php } ?>
            <?php } ?>
            </div>
          </div>
          </td>
          <td class="model tablet_hide"><?php echo $product['model']; ?></td>
          <td class="stock tablet_hide"><?php echo $product['stock']; ?></td>
          <td class="price tablet_hide"><?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['special']; ?></span> <span class="price"><?php echo $product['price']; ?></span> 
              <?php } ?>
            </div>
            <?php } ?></td>
          <td class="action">
          <a onclick="cart.add('<?php echo $product['product_id']; ?>')" class="btn btn-primary btn-sm margin-b-sm"><?php echo $button_cart; ?></a>
          <a href="<?php echo $product['remove']; ?>" class="btn btn-dark btn-sm"><?php echo $button_remove; ?></a>
        </tr>
      </tbody>
      <?php } ?>
      <?php } else { ?>
      <td><p><?php echo $text_empty; ?></p></td>
      <?php } ?>
    </table>
  </div>
      <div class="table_bottom_line text-right">
        <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
        </div>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 