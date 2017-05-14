<h3><span><?php echo $l->get('filter_by_products_parameters'); ?></span></h3>

<!-- Categories -->
<div class="form-group ajax-update">
  <label class="col-sm-4 control-label"><?php echo $l->get('categories'); ?></label>
  <div class="col-sm-5">
    <?php echo $category_list; ?>
    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="select-all"><?php echo $l->get('select_all'); ?></a> /
    <a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="unselect-all"><?php echo $l->get('unselect_all'); ?></a>
  </div>
</div>

<!-- Manufacturers -->
<div class="form-group ajax-update">
  <label class="col-sm-4 control-label"><?php echo $l->get('manufacturers'); ?></label>
  <div class="col-sm-5">
  <?php echo $manufacturer_list; ?>
  <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="select-all"><?php echo $l->get('select_all'); ?></a> /
  <a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="unselect-all"><?php echo $l->get('unselect_all'); ?></a>
  </div>
</div>

<!-- Special groups -->
<div class="form-group ajax-update">
  <label class="col-sm-4 control-label text-right"><?php echo $l->get('special_groups'); ?></label>
  <div class="col-sm-5">
    <div class="scrollbox special-groups">
      <?php foreach ($special_groups as $special_group) { ?>
      <label class="level-0">
        <input type="checkbox" name="special_groups[]" value="<?php echo $special_group['product_special_group_id']; ?>" class="special-group"/><?php echo $special_group['name']; ?>
      </label>
      <?php } ?>
    </div>
    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="select-all"><?php echo $l->get('select_all'); ?></a> /
    <a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="unselect-all"><?php echo $l->get('unselect_all'); ?></a>
  </div>
</div>

<!-- Select additional products -->
<?php echo $include_products_html; ?>
<!-- Select additional products END -->

<hr>
<h4 class="text-center text-found-specials">
    <?php echo $l->get('found_specials'); ?>
    <div class="total-found-specials">...</div>
</h4>

<div class="block-show-possible-specials">
  <a class="show-found-specials"><?php echo $l->get('show_found_specials'); ?></a>

  <div class="block-specials">
    <a class="close-block-specials">x</a>
    <table class="found-specials table table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-center">#</td>
          <td class="text-center"><?php echo $l->get('photo'); ?></td>
          <td class="text-center"><?php echo $l->get('name'); ?></td>
          <td class="text-center"><?php echo $l->get('old_price'); ?></td>
          <td class="text-center"><?php echo $l->get('special_price'); ?></td>
          <td class="text-center"><?php echo $l->get('status'); ?></td>
          <td class="text-center"><?php echo $l->get('special_group'); ?></td>
          <td class="text-center"><?php echo $l->get('date_start'); ?></td>
          <td class="text-center"><?php echo $l->get('date_end'); ?></td>

          <?php if ($hours_days_status) { ?>
            <td class="text-center"><?php echo $l->get('weekdays'); ?></td>
            <td class="text-center"><?php echo $l->get('hours'); ?></td>
          <?php } ?>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>
</div>