<div class="form-group">
  <label class="col-sm-4 control-label text-right"><?php echo $l->get('include_additioanal_products'); ?></label>
  <div class="col-sm-3">
    <input type="text" value="" placeholder="<?php echo $l->get('by_product_name'); ?>" class="form-control input-product product_name" />
  </div>

  <label class="col-md-1 control-label text-right"><?php echo $l->get('model'); ?></label>
  <div class="col-sm-3">
    <input type="text" value="" placeholder="<?php echo $l->get('by_model'); ?>" class="form-control input-product model" />
  </div>
  
  <br><br><br>
  <div class="col-sm-4"></div>
  <div class="col-sm-7">
    <div class="included-products well well-sm" style="height: 150px; overflow: auto;"></div>
  </div>
</div>