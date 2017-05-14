<form method="post" id="additional-catalog-settings" class="form-horizontal">
  <button type="button" data-toggle="tooltip" class="btn btn-default reset-settings" onclick="clean_inputs($(this).parent());">
    <i class="fa fa-refresh"></i> &nbsp; <?php echo $l->get('clear_inputs'); ?>
  </button>

  <h4><?php echo $l->get('h4_detailed_product_page_settings'); ?></h4>
  <input type="hidden" name="catalog" value="1"><!-- to recognize action in controller -->

  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('badge_color'); ?></label>
    <div class="col-sm-2">                  
      <input type="text" class="colorpicker form-control" name="badge_color" value="<?php echo isset($additional_catalog_settings['badge_color']) ? $additional_catalog_settings['badge_color'] : ""; ?>" placeholder="#FF3E30"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('badge_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="badge_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['badge_font_size']) ? $additional_catalog_settings['badge_font_size'] : ""; ?>" placeholder="12" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('badge_top'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="badge_top" class="form-control" value="<?php echo isset($additional_catalog_settings['badge_top']) ? $additional_catalog_settings['badge_top'] : ""; ?>" placeholder="10" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('badge_font_weight'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="badge_font_weight" class="form-control" value="<?php echo isset($additional_catalog_settings['badge_font_weight']) ? $additional_catalog_settings['badge_font_weight'] : ""; ?>" placeholder="700" />
    </div>
  </div>
  <br><hr><br>

  
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('special_price_color'); ?></label>
    <div class="col-sm-2">                          
      <input type="text" class="colorpicker form-control" name="product_timer_special_price_color" value="<?php echo isset($additional_catalog_settings['product_timer_special_price_color']) ? $additional_catalog_settings['product_timer_special_price_color'] : ""; ?>" placeholder="#e95144"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('special_price_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_special_price_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_special_price_font_size']) ? $additional_catalog_settings['product_timer_special_price_font_size'] : ""; ?>" placeholder="33" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('special_price_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_special_price_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_special_price_margin']) ? $additional_catalog_settings['product_timer_special_price_margin'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('old_price_color'); ?></label>
    <div class="col-sm-2">            
      <input type="text" class="colorpicker form-control" name="product_timer_old_price_color" value="<?php echo isset($additional_catalog_settings['product_timer_old_price_color']) ? $additional_catalog_settings['product_timer_old_price_color'] : ""; ?>" placeholder="#e95144"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('old_price_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_old_price_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_old_price_font_size']) ? $additional_catalog_settings['product_timer_old_price_font_size'] : ""; ?>" placeholder="17" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('old_price_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_old_price_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_old_price_margin']) ? $additional_catalog_settings['product_timer_old_price_margin'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>
  <br><hr><br>

  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_price_block_border_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_price_block_border_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_price_block_border_size']) ? $additional_catalog_settings['product_timer_price_block_border_size'] : ""; ?>" placeholder="1" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_price_block_border_color'); ?></label>
    <div class="col-sm-2">
      <input type="text" class="colorpicker form-control" name="product_timer_price_block_border_color" value="<?php echo isset($additional_catalog_settings['product_timer_price_block_border_color']) ? $additional_catalog_settings['product_timer_price_block_border_color'] : ""; ?>" placeholder="#a3a3a3"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_price_block_padding'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_price_block_padding" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_price_block_padding']) ? $additional_catalog_settings['product_timer_price_block_padding'] : ""; ?>" placeholder="10px 10px 10px 10px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_price_block_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_price_block_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_price_block_margin']) ? $additional_catalog_settings['product_timer_price_block_margin'] : ""; ?>" placeholder="14px 0px 14px 0px" />
    </div>
  </div>           
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_price_block_full_width'); ?></label>
    <div class="col-sm-2">
      <input type="checkbox" name="product_timer_price_block_full_width" value='1' <?php echo isset($additional_catalog_settings['product_timer_price_block_full_width']) ? "checked" : ""; ?>/>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_block_timer_text_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_block_timer_text_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_timer_text_font_size']) ? $additional_catalog_settings['product_timer_block_timer_text_font_size'] : ""; ?>" placeholder="17" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('product_timer_block_timer_text'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_block_timer_text" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_timer_text']) ? $additional_catalog_settings['product_timer_block_timer_text'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>
  <br><hr><br>

  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_border_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_block_countdown_border_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_border_size']) ? $additional_catalog_settings['product_timer_block_countdown_border_size'] : ""; ?>" placeholder="1" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_border_color'); ?></label>
    <div class="col-sm-2">       
      <input type="text" class="colorpicker form-control" name="product_timer_block_countdown_border_color" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_border_color']) ? $additional_catalog_settings['product_timer_block_countdown_border_color'] : ""; ?>" placeholder="#ccc"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_background_color'); ?></label>
    <div class="col-sm-2">
      <input type="text" class="colorpicker form-control" name="product_timer_block_countdown_background_color" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_background_color']) ? $additional_catalog_settings['product_timer_block_countdown_background_color'] : ""; ?>" placeholder="#eee"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_text_color'); ?></label>
    <div class="col-sm-2">
      <input type="text" class="colorpicker form-control" name="product_timer_block_countdown_text_color" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_text_color']) ? $additional_catalog_settings['product_timer_block_countdown_text_color'] : ""; ?>" placeholder=""/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_block_countdown_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_margin']) ? $additional_catalog_settings['product_timer_block_countdown_margin'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_padding'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="product_timer_block_countdown_padding" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_padding']) ? $additional_catalog_settings['product_timer_block_countdown_padding'] : ""; ?>" placeholder="5px 0px 5px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_amount_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_block_countdown_amount_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_amount_font_size']) ? $additional_catalog_settings['product_timer_block_countdown_amount_font_size'] : ""; ?>" placeholder="200" />
        <span class="input-group-addon">%</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_period_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="product_timer_block_countdown_period_size" class="form-control" value="<?php echo isset($additional_catalog_settings['product_timer_block_countdown_period_size']) ? $additional_catalog_settings['product_timer_block_countdown_period_size'] : ""; ?>" placeholder="100" />
        <span class="input-group-addon">%</span>
      </div>
    </div>
  </div>


  <h4><?php echo $l->get('h4_settings_in_other_sections_of_site'); ?></h4>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_border_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="timer_block_countdown_border_size" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_border_size']) ? $additional_catalog_settings['timer_block_countdown_border_size'] : ""; ?>" placeholder="1" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_border_color'); ?></label>
    <div class="col-sm-2">                          
      <input type="text" class="colorpicker form-control" name="timer_block_countdown_border_color" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_border_color']) ? $additional_catalog_settings['timer_block_countdown_border_color'] : ""; ?>" placeholder="#ccc"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_background_color'); ?></label>
    <div class="col-sm-2">                          
      <input type="text" class="colorpicker form-control" name="timer_block_countdown_background_color" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_background_color']) ? $additional_catalog_settings['timer_block_countdown_background_color'] : ""; ?>" placeholder="#eee"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_text_color'); ?></label>
    <div class="col-sm-2">
      <input type="text" class="colorpicker form-control" name="timer_block_countdown_text_color" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_text_color']) ? $additional_catalog_settings['timer_block_countdown_text_color'] : ""; ?>" placeholder=""/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="timer_block_countdown_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_margin']) ? $additional_catalog_settings['timer_block_countdown_margin'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_amount_font_size'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="timer_block_countdown_padding" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_padding']) ? $additional_catalog_settings['timer_block_countdown_padding'] : ""; ?>" placeholder="5px 0px 5px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_amount_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="timer_block_countdown_amount_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_amount_font_size']) ? $additional_catalog_settings['timer_block_countdown_amount_font_size'] : ""; ?>" placeholder="200" />
        <span class="input-group-addon">%</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('countdown_period_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="timer_block_countdown_period_size" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_countdown_period_size']) ? $additional_catalog_settings['timer_block_countdown_period_size'] : ""; ?>" placeholder="100" />
        <span class="input-group-addon">%</span>
      </div>
    </div>
  </div>
  <br><hr><br>

  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('timer_block_percentage_discount_full_width'); ?></label>
    <div class="col-sm-2">
      <input type="checkbox" name="timer_block_percentage_discount_full_width" value='1' <?php echo isset($additional_catalog_settings['timer_block_percentage_discount_full_width']) ? "checked" : ""; ?>/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('timer_block_percentage_discount_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="timer_block_percentage_discount_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_percentage_discount_margin']) ? $additional_catalog_settings['timer_block_percentage_discount_margin'] : ""; ?>" placeholder="0px 4px 0px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('timer_block_percentage_discount_background'); ?></label>
    <div class="col-sm-2">                          
      <input type="text" class="colorpicker form-control" name="timer_block_percentage_discount_background" value="<?php echo isset($additional_catalog_settings['timer_block_percentage_discount_background']) ? $additional_catalog_settings['timer_block_percentage_discount_background'] : ""; ?>" placeholder="#e95144"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('timer_block_percentage_discount_color'); ?></label>
    <div class="col-sm-2">                          
      <input type="text" class="colorpicker form-control" name="timer_block_percentage_discount_color" value="<?php echo isset($additional_catalog_settings['timer_block_percentage_discount_color']) ? $additional_catalog_settings['timer_block_percentage_discount_color'] : ""; ?>" placeholder="#fff"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('timer_block_percentage_discount_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="timer_block_percentage_discount_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_percentage_discount_font_size']) ? $additional_catalog_settings['timer_block_percentage_discount_font_size'] : ""; ?>" placeholder="11" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <br><hr><br>

  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('special_price_color'); ?></label>
    <div class="col-sm-2">                          
      <input type="text" class="colorpicker form-control" name="timer_block_special_price_color" value="<?php echo isset($additional_catalog_settings['timer_block_special_price_color']) ? $additional_catalog_settings['timer_block_special_price_color'] : ""; ?>" placeholder="#FE2917"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('special_price_font_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="timer_block_special_price_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_special_price_font_size']) ? $additional_catalog_settings['timer_block_special_price_font_size'] : ""; ?>" placeholder="14" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('old_price_color'); ?></label>
    <div class="col-sm-2">            
      <input type="text" class="colorpicker form-control" name="timer_block_old_price_color" value="<?php echo isset($additional_catalog_settings['timer_block_old_price_color']) ? $additional_catalog_settings['timer_block_old_price_color'] : ""; ?>"/>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('old_price_size'); ?></label>
    <div class="col-sm-2">
      <div class="input-group">
        <input type="number" name="timer_block_old_price_font_size" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_old_price_font_size']) ? $additional_catalog_settings['timer_block_old_price_font_size'] : ""; ?>" placeholder="14" />
        <span class="input-group-addon">px</span>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('special_price_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="timer_block_special_price_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_special_price_margin']) ? $additional_catalog_settings['timer_block_special_price_margin'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label"><?php echo $l->get('old_price_margin'); ?></label>
    <div class="col-sm-2">
      <input type="text" name="timer_block_old_price_margin" class="form-control" value="<?php echo isset($additional_catalog_settings['timer_block_old_price_margin']) ? $additional_catalog_settings['timer_block_old_price_margin'] : ""; ?>" placeholder="0px 0px 0px 0px" />
    </div>
  </div>

  <!--  -->
  <!--  -->
  <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
  <div class="error-result"></div>
  <div class="result"></div>
  <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="save_settings($(this).parent());">
    <i class="fa fa-floppy-o fa-lg"></i> &nbsp; <?php echo $l->get('save_settings'); ?>
  </button>
</form>