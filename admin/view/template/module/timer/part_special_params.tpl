<div class="special-params">
    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo $l->get('priority'); ?></label>
        <div class="col-sm-3">
          <input type="text" name="priority" value="" size="5" class="form-control" placeholder="0" />
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[priority]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo $l->get('timer'); ?></label>
        <div class="col-sm-3">
          <input type="checkbox" name="timer_status" value='1' checked />
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[timer]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo $l->get('total_discount'); ?></label>
        <div class="col-sm-3">
          <input type="text" name="total_discount" value="" size="5" class="form-control total_discount" />
          <select name="discount_type" class="form-control discount_type">
            <option value="percentage">%</option>
            <option value="currency"><?php echo $l->get('currency'); ?></option>
          </select>
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[price]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo $l->get('date_start'); ?></label>
        <div class="col-sm-3">
          <div class="input-group date">
            <input type="text" name="date_start" value="" maxlength="10" class="form-control" data-date-format="YYYY-MM-DD" />
            <span class="input-group-btn">
              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
            </span>
          </div>
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[date_start]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo $l->get('date_end'); ?></label>
        <div class="col-sm-3">
          <div class="input-group date">
            <input type="text" name="date_end" value="" maxlength="10" class="form-control" data-date-format="YYYY-MM-DD" />
            <span class="input-group-btn">
              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
            </span>
          </div>
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[date_end]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>

    <?php if ($hours_days_status) { ?>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $l->get('weekdays'); ?></label>
            <div class="col-sm-3">
              <select name="weekdays[]" id="input-weekdays" multiple="true" class="weekdays">
                <?php foreach ($weekdays as $weekday) { ?>
                  <option value="<?php echo $weekday['id']; ?>" selected="true"><?php echo $weekday['name']; ?></option> 
                <?php } ?>
              </select>
            </div>
            <?php if (isset($overwrite)) { ?>
            <div class="col-sm-3">
              <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
              <div class="col-sm-2">
                <input type="checkbox" name="overwrite[weekdays]" checked="checked" value="1" class="overwrite">
              </div>
            </div>
            <?php } ?>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $l->get('hours'); ?></label>
            <div class="col-sm-3">
              <select name="hours[]" id="input-hours" multiple="true" class="hours">
                <?php foreach ($hours as $hour) { ?>
                  <option value="<?php echo $hour['id']; ?>" selected="true"><?php echo $hour['name']; ?></option> 
                <?php } ?>
              </select>
            </div>
            <?php if (isset($overwrite)) { ?>
            <div class="col-sm-3">
              <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
              <div class="col-sm-2">
                <input type="checkbox" name="overwrite[hours]" checked="checked" value="1" class="overwrite">
              </div>
            </div>
            <?php } ?>
        </div>
    <?php } ?>

    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo !isset($overwrite) ? $l->get('customer_groups') : $l->get('customer_group'); ?></label>
        <div class="col-sm-3">
          <select name="customer_group_id" <?php echo !isset($overwrite) ? 'multiple="true" class="multiple-select customer_group_id"' : 'class="form-control"'; ?> >
            <?php foreach ($customer_groups as $customer_group) { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
            <?php } ?>
          </select>
          
          <?php if (!isset($overwrite)) { // if we are in the tab set specials, then display hidden input for customer groups ?>
            <input type="hidden" name="customer_group_id" value="" class="customer_groups">
          <?php } ?>
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[customer_group_id]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label"><?php echo $l->get('special_group'); ?></label>
        <div class="col-sm-3">
          <select name="special_group_id" class="form-control">
            <option value="0"></option>
            <?php foreach ($special_groups as $special_group) { ?>
            <option value="<?php echo $special_group['product_special_group_id']; ?>"><?php echo $special_group['name']; ?></option>
            <?php } ?>
          </select>
        </div>
        <?php if (isset($overwrite)) { ?>
        <div class="col-sm-3">
          <label class="col-sm-8 control-label"><?php echo $l->get('overwrite'); ?></label>
          <div class="col-sm-2">
            <input type="checkbox" name="overwrite[special_group_id]" checked="checked" value="1" class="overwrite">
          </div>
        </div>
        <?php } ?>
    </div>


    <?php if (isset($overwrite)) { ?>
    <!-- For recognizing the overwritten fields-->
    <input type="hidden" name="overwrite[]" checked="checked" value="1">

    <div class="form-group">
        <div class="col-sm-7"></div>
        <div class="col-sm-3">
            <a onclick="$(this).closest('.special-params').find('.overwrite:checkbox').prop('checked', true);"><?php echo $l->get('select_all'); ?></a>
            /
            <a onclick="$(this).closest('.special-params').find('.overwrite:checkbox').prop('checked', false);" class="unselect-all"><?php echo $l->get('unselect_all'); ?></a>
        </div>
    </div>
    <?php } ?>    
</div>