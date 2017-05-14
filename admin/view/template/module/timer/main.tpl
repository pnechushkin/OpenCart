<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $action; ?>" form="form-slideshow" data-toggle="tooltip" title="<?php echo $l->get('refresh'); ?>" class="btn btn-default" ><i class="fa fa-refresh"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $l->get('cancel'); ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $l->get('heading_title'); ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $l->get('text_edit'); ?>
        </h3>
      </div>
      <div class="panel-body">
        <center>
          <?php if ($success) { ?>
          <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <?php } ?>
          <?php if ($errors) { ?>
           <?php foreach ($errors as $error) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
              <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
           <?php } ?>
          <?php } ?>
        </center>
        <div class="box">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-all-specials" data-toggle="tab"><i class="fa fa-database"></i> &nbsp; <?php echo $l->get('all_specials'); ?></a></li>
            <li><a href="#tab-general-settings" data-toggle="tab"><i class="fa fa-cog"></i> &nbsp; <?php echo $l->get('general_settins'); ?></a></li>
            <li><a href="#tab-additional-settings" data-toggle="tab"><i class="fa fa-puzzle-piece"></i> &nbsp; <?php echo $l->get('additional_settings'); ?></a></li>
            <li><a href="#tab-specials-groups" data-toggle="tab"><i class="fa fa-th-large"></i> &nbsp; <?php echo $l->get('special_groups'); ?></a></li>
            <li><a href="#tab-set-specials" data-toggle="tab"><i class="fa fa-file-text-o"></i> &nbsp; <?php echo $l->get('set_specials'); ?></a></li>
            <li><a href="#tab-edit-specials" data-toggle="tab"><i class="fa fa-edit"></i> &nbsp; <?php echo $l->get('edit_specials'); ?></a></li>
            <li><a href="#tab-delete-specials" data-toggle="tab"><i class="fa fa-trash-o"></i> &nbsp; <?php echo $l->get('delete_specials'); ?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><i class="fa fa-info-circle"></i> &nbsp; <?php echo $l->get('support'); ?></a></li>
          </ul>

          <div class="tab-content">
          <!-- TAB All Specials -->
            <div class="tab-pane active" id="tab-all-specials">
            <!-- Filtering -->
              <!-- <div class="show-hide-filters"><span data-toggle="collapse" data-target=".well"><?php echo $l->get('hide_show_filters'); ?></span></div> -->
              <div class="well collapse in">
                <div class="row">
                  <div class="col-sm-3">
                    <div class="form-group">
                      <label class="control-label" for="input-name"><?php echo $l->get('name'); ?></label>
                      <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $l->get('product_name'); ?>" id="input-name" class="form-control" />
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label" for="input-model"><?php echo $l->get('model'); ?></label>
                      <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $l->get('model'); ?>" id="input-model" class="form-control" />
                    </div>

                    <?php if(isset($additional_admin_settings['show_filter_category'])): ?>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('category'); ?></label>
                        <select name="filter_category" id="input-status" class="form-control">
                          <option value="*"></option>
                          <?php foreach ($categories as $category) { ?>
                            <?php if ($category['category_id'] == $filter_category) { ?>
                              <option value="<?php echo $category['category_id']; ?>" selected="selected">
                                <?php echo str_repeat('<i>&mdash;</i>', $category['level']); ?><?php echo $category['name']; ?>
                              </option>
                            <?php } else { ?>
                              <option value="<?php echo $category['category_id']; ?>">
                                <?php echo str_repeat(' &mdash; ', $category['level']); ?><?php echo $category['name']; ?>
                              </option> 
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                    <?php endif; ?>
                    <?php if(isset($additional_admin_settings['show_filter_manufacturer'])): ?>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('manufacturer'); ?></label>
                        <select name="filter_manufacturer" id="input-status" class="form-control">
                          <option value="*"></option>
                          <?php foreach ($manufacturers as $manufacturer) { ?>
                            <?php if ($manufacturer['manufacturer_id'] == $filter_manufacturer) { ?>
                              <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option> 
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                    <?php endif; ?>
                  </div><!-- First column end !-->
                  <div class="col-sm-3">
                    <?php if(isset($additional_admin_settings['show_filter_customer_groups'])): ?>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('customer_groups'); ?></label>
                        <select name="filter_customer_groups" multiple="true" class="multiple-select">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if (in_array($customer_group['customer_group_id'], $filter_customer_groups)) { ?>
                              <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option> 
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                    <?php endif; ?>
                    <?php if(isset($additional_admin_settings['show_filter_status'])): ?>
                      <div class="form-group">
                        <label class="control-label" for="input-status"><?php echo $l->get('status'); ?></label>
                        <select name="filter_status" id="input-status" class="form-control">
                          <option value="*"></option>
                          <?php if ($filter_status) { ?>
                          <option value="1" selected="selected"><?php echo $l->get('on'); ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $l->get('on'); ?></option>
                          <?php } ?>
                          <?php if (($filter_status !== null) && !$filter_status) { ?>
                          <option value="0" selected="selected"><?php echo $l->get('off'); ?></option>
                          <?php } else { ?>
                          <option value="0"><?php echo $l->get('off'); ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    <?php endif; ?>
                    <?php if(isset($additional_admin_settings['show_filter_quantity'])): ?>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('quantity'); ?></label><br>
                        <input type="text" name="filter_quantity_from" value="<?php echo $filter_quantity_from; ?>" placeholder="<?php echo $l->get('from'); ?>" class="form-control from" />
                        <input type="text" name="filter_quantity_to" value="<?php echo $filter_quantity_to; ?>" placeholder="<?php echo $l->get('to'); ?>" class="form-control to" />
                      </div>
                    <?php endif; ?>
                  </div><!-- Second column end !-->
                  <div class="col-sm-3">
                    <?php if(isset($additional_admin_settings['show_filter_old_price'])): ?>
                      <div class="form-group">
                        <label class="control-label" for="input-price"><?php echo $l->get('old_price'); ?></label><br>
                        <input type="text" name="filter_price_from" value="<?php echo $filter_price_from; ?>" placeholder="<?php echo $l->get('from'); ?>" class="form-control from" />
                        <input type="text" name="filter_price_to" value="<?php echo $filter_price_to; ?>" placeholder="<?php echo $l->get('to'); ?>" class="form-control to" />
                      </div>
                    <?php endif; ?>
                    <?php if(isset($additional_admin_settings['show_filter_special_price'])): ?>
                      <div class="form-group">
                        <label class="control-label" for="input-special-price"><?php echo $l->get('special_price'); ?></label><br>
                        <input type="text" name="filter_special_price_from" value="<?php echo $filter_special_price_from; ?>" placeholder="<?php echo $l->get('from'); ?>" class="form-control from" />
                        <input type="text" name="filter_special_price_to" value="<?php echo $filter_special_price_to; ?>" placeholder="<?php echo $l->get('to'); ?>" class="form-control to" />
                      </div>
                    <?php endif; ?>
                    <?php if(isset($additional_admin_settings['show_filter_special_date'])): ?>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('special_date'); ?></label><br>
                        <input type="text" name="filter_special_date_from" value="<?php echo $filter_special_date_from; ?>" placeholder="<?php echo $l->get('from'); ?>" class="form-control from date" />
                        <input type="text" name="filter_special_date_to" value="<?php echo $filter_special_date_to; ?>" placeholder="<?php echo $l->get('to'); ?>" class="form-control to date" />
                      </div>
                    <?php endif; ?>
                  </div><!-- Third column end !-->
                  <div class="col-sm-3">
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('special_group'); ?></label>
                        <select name="filter_special_group" id="input-special-group" class="form-control">
                          <option value="*"></option>
                          <?php foreach ($special_groups as $special_group) { ?>
                            <?php if ($special_group['product_special_group_id'] == $filter_special_group) { ?>
                              <option value="<?php echo $special_group['product_special_group_id']; ?>" selected="selected"><?php echo $special_group['name']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $special_group['product_special_group_id']; ?>"><?php echo $special_group['name']; ?></option> 
                            <?php } ?>
                          <?php } ?>

                          <option value="0" <?php if($filter_special_group === '0') echo 'selected="selected"'; ?> ><?php echo $l->get('specials_without_special_groups'); ?></option>
                        </select>
                      </div>

                    <?php if(isset($hours_days_status)): ?>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('weekdays'); ?></label>
                        <select name="filter_weekdays" id="input-weekdays" multiple="true" class="weekdays">
                          <?php foreach ($weekdays as $weekday) { ?>
                            <?php if (strpos($filter_weekdays, $weekday['id']) !== false) { ?>
                              <option value="<?php echo $weekday['id']; ?>" selected="true"><?php echo $weekday['name']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $weekday['id']; ?>"><?php echo $weekday['name']; ?></option> 
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="control-label"><?php echo $l->get('hours'); ?></label>
                        <select name="filter_hours" id="input-hours" multiple="true" class="hours">
                          <?php foreach ($hours as $hour) { ?>
                            <?php if (strpos($filter_hours, $hour['id']) !== false) { ?>
                              <option value="<?php echo $hour['id']; ?>" selected="true"><?php echo $hour['name']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $hour['id']; ?>"><?php echo $hour['name']; ?></option> 
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                    <?php endif; ?>
                  </div><!-- Fourth column end !-->


                  <div class="col-sm-12 text-right">
                    <hr>
                    <button type="button" id="reset-filters" class="btn btn-primary pull-right"><?php echo $l->get('clear_filters'); ?></button>
                    <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $l->get('filter'); ?></button>
                  </div><!-- Fourth column end !-->
                </div>
              </div>
            <!-- Filtering END -->

            <!-- Hidden block for editing selected special -->
              <div id="modal_edit_selected" class="modal modal-wide fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title"><?php echo $l->get('edit_selected_specials'); ?></h4>
                    </div>
                    <div class="modal-body">
                      <form method="post" class="form-horizontal" id="edit_selected_specials" action="<?php echo $action_edit_selected_specials; ?>">
                        <?php echo $special_params_for_selected; ?>
                        <div class="error-result"></div>
                        <div class="result"></div>
                        <input type="hidden" name="specials">
  
                        <button type="submit" data-toggle="tooltip" class="btn btn-primary">
                          <i class="fa fa-floppy-o fa-lg"></i> &nbsp; <?php echo $l->get('edit_selected_specials'); ?>
                        </button>
                      </form>
                    </div>
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>

            <!-- Buttons to delete specials -->
              <div style="float:right;">
                <button class="btn btn-primary" data-toggle="modal" data-target="#modal_edit_selected" id="edit_specials">
                  <i class="fa fa-pencil"></i> <?php echo $l->get('edit_selected_specials'); ?>
                </button>

                <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('<?php echo $l->get('delete_hint'); ?>') ? $('#all_products_specials').submit() : false;">
                  <i class="fa fa-trash-o"></i> &nbsp; <?php echo $l->get('delete_chosen_specials'); ?>
                </button>
              </div>
            <!-- Buttons to delete specials END -->

            <!-- Output special products -->
              <br><br><br>
              <form action="<?php echo $action_delete_selected; ?>" method="post" id="all_products_specials">
                <div class="table-responsive" style="overflow-x: visible;">
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                        <?php if(isset($additional_admin_settings['show_column_photo'])): ?>
                          <td class="text-center"><?php echo $l->get('photo'); ?></td>
                        <?php endif; ?>
                        <td class="text-center"><?php echo $l->get('name'); ?></td>
                        <?php if(isset($additional_admin_settings['show_column_category'])): ?>
                          <td class="text-center"><?php echo $l->get('category'); ?></td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_manufacturer'])): ?>
                          <td class="text-center"><?php echo $l->get('manufacturer'); ?></td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_status'])): ?>
                          <td class="text-center"><?php echo $l->get('status'); ?></td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_quantity'])): ?>
                          <td class="text-center"><?php echo $l->get('qty'); ?></td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_old_price'])): ?>
                          <td class="text-center"><?php echo $l->get('old_price'); ?></td>
                        <?php endif; ?>
                        <td class="text-center"><?php echo $l->get('special_price'); ?></td>
                        <td class="text-center"><?php echo $l->get('date_start'); ?></td>
                        <td class="text-center"><?php echo $l->get('date_end'); ?></td>
                        
                        <?php if ($hours_days_status) { ?>
                          <td class="text-center"><?php echo $l->get('weekdays'); ?></td>
                          <td class="text-center"><?php echo $l->get('hours'); ?></td>
                        <?php } ?>

                        <td class="text-center"><?php echo $l->get('timer'); ?></td>
                        <td class="text-center"><?php echo $l->get('customer_group'); ?></td>
                        <td class="text-center"><?php echo $l->get('special_group'); ?></td>
                        <td class="text-center"><?php echo $l->get('priority'); ?></td>
                        <td class="text-center"><?php echo $l->get('actions'); ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php if ($product_specials) { ?>
                      <?php foreach ($product_specials as $product) { ?>
                      <tr id="special_<?php echo $product['product_special_id']; ?>">
                        <td class="text-center">
                          <input type="checkbox" name="selected[]" value="<?php echo $product['product_special_id']; ?>" />
                        </td>
                        <?php if(isset($additional_admin_settings['show_column_photo'])): ?>
                          <td class="text-center"><?php if ($product['image']) { ?>
                            <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
                            <?php } else { ?>
                            <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                            <?php } ?>
                          </td>
                        <?php endif; ?>
                        <td class="text-left"><?php echo $product['name']; ?></td>
                        <?php if(isset($additional_admin_settings['show_column_category'])): ?>
                          <td class="text-left">
                            <?php foreach ($categories as $category) { ?>
                              <?php if (in_array($category['category_id'], $product['category'])) { ?>
                              <?php  echo $category['name'];?><br>
                              <?php } ?>
                            <?php } ?>
                          </td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_manufacturer'])): ?>
                          <td class="text-left">
                            <?php foreach ($manufacturers as $manufacturer) { ?>
                              <?php if (in_array($manufacturer['manufacturer_id'], $product['manufacturer'])) { ?>
                              <?php  echo $manufacturer['name'];?><br>
                              <?php } ?>
                            <?php } ?>
                          </td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_status'])): ?>
                          <td class="text-center"><?php echo $product['status']; ?></td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_quantity'])): ?>
                          <td class="text-center"><?php if ($product['quantity'] <= 0) { ?>
                            <span class="label label-warning"><?php echo $product['quantity']; ?></span>
                            <?php } elseif ($product['quantity'] <= 5) { ?>
                            <span class="label label-danger"><?php echo $product['quantity']; ?></span>
                            <?php } else { ?>
                            <span class="label label-success"><?php echo $product['quantity']; ?></span>
                            <?php } ?>
                          </td>
                        <?php endif; ?>
                        <?php if(isset($additional_admin_settings['show_column_old_price'])): ?>
                          <td class="text-center old_price"><?php echo $product['old_price']; ?></td>
                        <?php endif; ?>
                        <td class="text-center special_price" data-old-price="<?php echo $product['old_price']; ?>"><?php echo $product['special_price']; ?></td>
                        <td class="text-center date_start"><?php echo $product['special_date_start']; ?></td>
                        <td class="text-center date_end"><?php echo $product['special_date_end']; ?></td>
                        <?php if ($hours_days_status) { ?>
                          <td class="text-center special_weekdays">
                            <?php if($product['special_weekdays'] !== "") { ?>
                            <i class="fa fa-bar-chart-o fa-2x" data-toggle="tooltip" title="<?php echo $product['special_weekdays_tooltip']; ?>"></i>
                            <?php } ?>
                            <input type="hidden" value="<?php echo $product['special_weekdays'];?>">
                          </td>
                          <td class="text-center special_hours">
                            <?php if($product['special_hours'] !== "") { ?>
                            <i class="fa fa-clock-o fa-2x" data-toggle="tooltip" title="<?php echo $product['special_hours_tooltip']; ?>"></i>
                            <?php } ?>
                            <input type="hidden" value="<?php echo $product['special_hours'];?>">
                          </td>
                        <?php } ?>
                        <td class="text-center timer">
                          <?php echo ($product['timer_status'] == 1) ? $l->get('on') : $l->get('off'); ?>
                          <input type="hidden" value="<?php echo $product['timer_status'];?>">
                        </td>
                        <td class="text-center customer_group_id">
                          <?php echo $product['customer_group_name']; ?>
                          <input type="hidden" value="<?php echo $product['customer_group_id'];?>">
                        </td>
                        <td class="text-center special_group_id">
                          <?php echo $product['special_group_name']; ?>
                          <input type="hidden" value="<?php echo $product['special_group_id'];?>">
                        </td>
                        <td class="text-center priority"><?php echo $product['priority']; ?></td>
                        <td class="text-center">
                          <a href="javascript:void(0);" data-toggle="tooltip" class="btn btn-primary edit" data-original-title="<?php echo $l->get('edit'); ?>" onclick="show_ajax_edit_form('<?php echo $product['product_special_id']; ?>'); return false;">
                            <i class="fa fa-pencil"></i>
                          </a>
                          <a href="javascript:void(0);" data-toggle="tooltip" class="btn btn-primary save" style="display:none;" data-original-title="<?php echo $l->get('save'); ?>" onclick="saveAjaxData('<?php echo $product['product_special_id']; ?>'); return false;">
                            <i class="fa fa-save"></i>
                          </a>
                          <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                          <div class="result"></div>
                        </td>
                      </tr>
                      <?php } ?>
                      <?php } else { ?>
                      <tr>
                        <?php $total_colspan = 12; ?>
                        <?php if(isset($additional_admin_settings['show_column_photo'])) $total_colspan++; ?>
                        <?php if(isset($additional_admin_settings['show_column_category'])) $total_colspan++; ?>
                        <?php if(isset($additional_admin_settings['show_column_manufacturer'])) $total_colspan++; ?>
                        <?php if(isset($additional_admin_settings['show_column_status'])) $total_colspan++; ?>
                        <?php if(isset($additional_admin_settings['show_column_quantity'])) $total_colspan++; ?>
                        <?php if(isset($additional_admin_settings['show_column_old_price'])) $total_colspan++; ?>
                        <td class="text-center" colspan="<?php echo $total_colspan; ?>"><?php echo $l->get('no_results'); ?></td>
                        <!-- <td class="text-center" colspan="13"><?php //echo $text_no_results; ?></td> -->
                      </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                </div>
              </form>
              <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
              </div>
            <!-- Output special products END -->
            </div>
          <!-- TAB All Specials END -->
          
          <!-- TAB General Settings -->
            <div class="tab-pane" id="tab-general-settings">
              <form method="post" id="general-settings" class="form-horizontal">
                <h3><?php echo $l->get('h3_timer_on_pages'); ?></h3>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_category_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_category_page_status" value='1' <?php echo isset($general_settings['timer_category_page_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_special_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_special_page_status" value='1' <?php echo isset($general_settings['timer_special_page_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_search_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_search_page_status" value='1' <?php echo isset($general_settings['timer_search_page_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_manufacturer_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_manufacturer_page_status" value='1' <?php echo isset($general_settings['timer_manufacturer_page_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_product_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_product_page_status" value='1' <?php echo isset($general_settings['timer_product_page_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>

                <h3><?php echo $l->get('h3_timer_in_modules'); ?></h3>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_in_featured_module_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_in_featured_module_status" value='1' <?php echo isset($general_settings['timer_in_featured_module_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_in_latest_module_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_in_latest_module_status" value='1' <?php echo isset($general_settings['timer_in_latest_module_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_in_special_module_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_in_special_module_status" value='1' <?php echo isset($general_settings['timer_in_special_module_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_in_bestseller_module_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_in_bestseller_module_status" value='1' <?php echo isset($general_settings['timer_in_bestseller_module_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>

                <hr>
                <br>
                <div class="form-group">
                  <label class="col-sm-5 control-label"><?php echo $l->get('timer_product_discount_label_status'); ?></label>
                  <div class="col-sm-3">
                    <input type="checkbox" name="timer_product_page_discount_label_status" value='1' <?php echo isset($general_settings['timer_product_page_discount_label_status']) ? "checked" : ""; ?>/>
                  </div>
                </div>

                <br>
                <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                <div class="error-result"></div>
                <div class="result"></div>
                <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="save_settings($(this).parent());">
                <i class="fa fa-floppy-o fa-lg"></i> &nbsp; <?php echo $l->get('save_settings'); ?>
                </button>
              </form>
            </div>
          <!-- TAB General Settings END -->

          <!-- TAB Additional Settings -->
            <div class="tab-pane" id="tab-additional-settings">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-additional-catalog-settings" data-toggle="tab"><?php echo $l->get('additional_settings_catalog'); ?></a></li>
                <li><a href="#tab-additional-admin-settings" data-toggle="tab"><?php echo $l->get('additional_settings_admin'); ?></a></li>
              </ul>
          
              <div class="tab-content">
              <!-- Additional settings in the catalog -->
                <div class="tab-pane active" id="tab-additional-catalog-settings">
                  <?php echo $additional_catalog_settings_form; ?>
                </div>
              <!-- Additional settings in the catalog END -->

              <!-- Additional settings in the admin panel -->
                <div class="tab-pane" id="tab-additional-admin-settings">
                  <form method="post" id="additional-admin-settings" class="form-horizontal">
                    <h4><?php echo $l->get('display_columns'); ?></h4>
                    <input type="hidden" name="admin" value="1"><!-- to recognize action in controller -->
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('photo'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_column_photo" value='1' <?php echo isset($additional_admin_settings['show_column_photo']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('categories'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_column_category" value='1' <?php echo isset($additional_admin_settings['show_column_category']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('manufacturer'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_column_manufacturer" value='1' <?php echo isset($additional_admin_settings['show_column_manufacturer']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('status'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_column_status" value='1' <?php echo isset($additional_admin_settings['show_column_status']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('quantity'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_column_quantity" value='1' <?php echo isset($additional_admin_settings['show_column_quantity']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('old_price'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_column_old_price" value='1' <?php echo isset($additional_admin_settings['show_column_old_price']) ? "checked" : ""; ?>/>
                      </div>
                    </div>

                    <h4><?php echo $l->get('display_filters'); ?></h4>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('category'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_category" value='1' <?php echo isset($additional_admin_settings['show_filter_category']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('manufacturer'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_manufacturer" value='1' <?php echo isset($additional_admin_settings['show_filter_manufacturer']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('customer_groups'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_customer_groups" value='1' <?php echo isset($additional_admin_settings['show_filter_customer_groups']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('status'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_status" value='1' <?php echo isset($additional_admin_settings['show_filter_status']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('special_date'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_special_date" value='1' <?php echo isset($additional_admin_settings['show_filter_special_date']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('old_price'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_old_price" value='1' <?php echo isset($additional_admin_settings['show_filter_old_price']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('special_price'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_special_price" value='1' <?php echo isset($additional_admin_settings['show_filter_special_price']) ? "checked" : ""; ?>/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4 control-label"><?php echo $l->get('quantity'); ?></label>
                      <div class="col-sm-3">
                        <input type="checkbox" name="show_filter_quantity" value='1' <?php echo isset($additional_admin_settings['show_filter_quantity']) ? "checked" : ""; ?>/>
                      </div>
                    </div>

                    <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                    <div class="error-result"></div>
                    <div class="result"></div>
                    <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="save_settings($(this).parent());">
                      <i class="fa fa-floppy-o fa-lg"></i> &nbsp; <?php echo $l->get('save_settings'); ?>
                    </button>
                  </form>
                </div>
              <!-- Additional settings in the admin panel END -->
              </div>
            </div>
          <!-- TAB Additional Settings END -->



          <!-- TAB Specials Groups -->
            <div class="tab-pane" id="tab-specials-groups">
              <form method="post" class="form-horizontal">
                <div class="form-group"><!-- id="specials-groups-block" -->
                  <label class="col-sm-3 control-label"><?php echo $l->get('label_group_name'); ?></label>
                  <div class="col-sm-6">
                    <input type="text" name="new_special_group" value="" placeholder="<?php echo $l->get('group_name'); ?>" id="new-special-group" class="form-control" />
                  </div>
                  <div class="col-sm-3">
                    <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="add_special_group();" data-original-title="" title=""><i class="fa fa-plus"></i> &nbsp; <?php echo $l->get('add_group'); ?></button>
                  </div>
                </div>

                <div class="form-group">
                  <div class="col-sm-2"></div>
                  <div class="col-sm-8">
                    <div id="special-groups" class="well well-sm">
                      <div class="header">
                        <div><?php echo $l->get('group_name'); ?></div>
                      </div>
                      <?php if (!empty($special_groups)) { ?>
                        <?php foreach ($special_groups as $special_group) { ?>
                          <div id="special_group<?php echo $special_group['product_special_group_id']; ?>" class="special-group">
                              <input type="hidden" name="special_groups[]" value="<?php echo $special_group['product_special_group_id']; ?>" class="id"/>
                              <input type="text" name="special_group_names[]" value="<?php echo $special_group['name']; ?>" class="form-control name">
                              &nbsp;&nbsp;
                              <i class="fa fa-minus-circle" data-toggle="tooltip" data-original-title="<?php echo $l->get('delete_selected_group'); ?>"></i>
                          </div>
                        <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                  <div class="error-result"></div>
                  <div class="result"></div>
                </div>

              </form>
            </div>
          <!-- TAB Specials Groups END -->

          <!-- TAB Set Specials -->
            <div class="tab-pane" id="tab-set-specials">
              <form method="post" class="form-horizontal" action="<?php echo $url_path_to_module; ?>/getPossibleProducts&token=<?php echo $token; ?>" id="form_set_specials">
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

                <!-- Attributes -->
                <div class="form-group">
                  <label class="col-sm-4 control-label text-right"><?php echo $l->get('filter_by_attribute_name_or_value'); ?></label>
                  <div class="col-sm-7">
                    <input type="text" value="" placeholder="<?php echo $l->get('placeholder_attribute_name_or_value'); ?>" class="form-control attribute-text" />
                  </div>
                  <div class="col-sm-1"></div>
                 
                  <br><br><br>
                  <div class="col-sm-4"></div>
                  <div class="col-sm-7">
                    <div id="chosen_attributes" class="well well-sm" style="height: 150px; overflow: auto;">
                    </div>
                  </div>
                  <div class="col-sm-1"></div>
                </div>
                <!-- Attributes END-->

                <!-- Options -->
                <div class="form-group">
                  <label class="col-sm-4 control-label text-right"><?php echo $l->get('filter_by_option_name_or_value'); ?></label>
                  <div class="col-sm-7">
                    <input type="text" value="" placeholder="<?php echo $l->get('placeholder_option_name_or_value'); ?>" class="form-control option-text" />
                  </div>
                  <div class="col-sm-1"></div>
                  
                  <br><br><br>
                  <div class="col-sm-4"></div>
                  <div class="col-sm-7">
                    <div id="chosen_options" class="well well-sm" style="height: 150px; overflow: auto;">
                    </div>
                  </div>
                  <div class="col-sm-1"></div>
                </div>
                <!-- Options END-->

                <!-- Select additional products -->
                <?php echo $include_products_html; ?>
                <!-- Select additional products END -->
                
                <!-- Ignore specials that already exists -->
                <div class="form-group ajax-update">
                    <label class="col-sm-4 control-label" for="input-name"><?php echo $l->get('ignore_creation_if_special_exists'); ?></label>
                    <div class="col-sm-3">
                      <input type="checkbox" name="ignore_creation_if_special_exists" value='1' checked />
                    </div>
                </div>

                <hr>
                <h4 class="text-center text-found-products">
                    <?php echo $l->get('found_products'); ?>
                    <div class="total-found-products">...</div>
                </h4>

                <div class="block-show-possible-products">
                  <a class="show-found-products"><?php echo $l->get('show_found_products'); ?></a>

                  <div class="block-products">
                    <a class="close-block-products">x</a>
                    <table class="found-products" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <td class="text-center">#</td>
                          <td class="text-center"><?php echo $l->get('photo'); ?></td>
                          <td class="text-center"><?php echo $l->get('name'); ?></td>
                          <td class="text-center"><?php echo $l->get('price'); ?></td>
                          <td class="text-center"><?php echo $l->get('status'); ?></td>
                          <td class="text-center"><?php echo $l->get('qty'); ?></td>
                        </tr>
                      </thead>
                      <tbody></tbody>
                    </table>
                  </div>
                </div>
                
                <hr>
                <h3><span><?php echo $l->get('special_parameters'); ?></span></h3>
                <?php echo $special_params; ?>

                <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                <div class="error-result"></div>
                <div class="result"></div>
                <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="set_specials($(this).parent());">
                  <i class="fa fa-plus"></i> &nbsp; <?php echo $l->get('set_specials_on_products'); ?>
                </button>

                <!-- Don't allow to send empty form (avoid problems with parsing params) -->
                <input type="hidden" name="random_val" value="0"></input>
              </form>
            </div>
          <!-- TAB Set Specials END -->
          
          <!-- TAB Edit Specials -->
            <div class="tab-pane" id="tab-edit-specials">
              <form method="post" action="<?php echo $url_path_to_module; ?>/ajaxUpdateSpecials&token=<?php echo $token; ?>" class="form-horizontal" id="form_edit_specials">
                <!-- Load filters by which user can filter specials + see found specials by these filters -->
                <?php echo $filters_edit_delete_specials_html; ?>
                
                <hr>
                <h3><span><?php echo $l->get('special_parameters'); ?></span></h3>
                <?php echo $special_params_for_selected; ?>

                <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                <div class="error-result"></div>
                <div class="result"></div>
                <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="ajax_edit_or_delete_specials($(this).closest('form'));">
                  <i class="fa fa-edit fa-lg"></i> &nbsp; <?php echo $l->get('edit_specials'); ?>
                </button>

              </form>
            </div>
          <!-- TAB Edit Specials END -->

          <!-- TAB Delete Specials -->
            <div class="tab-pane" id="tab-delete-specials">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-delete-specials-by-parameters" data-toggle="tab"><?php echo $l->get('by_parameters'); ?></a></li>
                <li><a href="#tab-delete-all-specials" data-toggle="tab"><?php echo $l->get('delete_all_specials'); ?></a></li>
              </ul>
          
              <div class="tab-content">
              <!-- Delete Specilas by Parameters -->
                <div class="tab-pane active" id="tab-delete-specials-by-parameters" >
                  <form method="post" class="form-horizontal" action="<?php echo $url_path_to_module; ?>/ajaxDeleteSpecials&token=<?php echo $token; ?>" id="form_delete_specials_by_parameters">
                    <!-- Load filters by which user can filter specials + see found specials by these filters -->
                    <?php echo $filters_edit_delete_specials_html; ?>
                    <hr>
                    
                    <div class="text-center">
                      <div class="ajax-loader" style="display: none;"><img src="../image/loading.gif"></div>
                      <div class="error-result"></div>
                      <div class="result"></div>
                      <button type="button" data-toggle="tooltip" class="btn btn-danger btn-lg submit" onclick="ajax_edit_or_delete_specials($(this).closest('form'));">
                        <i class="fa fa-trash-o fa-lg"></i> &nbsp; <?php echo $l->get('delete_specials'); ?>
                      </button>
                    </div>

                    <!-- Don't allow to send empty form (avoid problems with parsing params) -->
                    <input type="hidden" name="random_val" value="0"></input>
                  </form>
                </div>
              <!-- Delete Specilas by Parameters END -->

              <!-- Delete All Specilas -->
                <div class="tab-pane" id="tab-delete-all-specials">
                  <button type="button" data-toggle="tooltip" class="btn btn-danger" onclick="confirm('<?php echo $l->get('delete_hint');?>') ? location='<?php echo $action_delete_all_specials; ?>' : false;">
                    <i class="fa fa-trash-o fa-lg"></i> &nbsp; <?php echo $l->get('delete_all_specials'); ?>
                  </button>
                </div>
              <!-- Delete All Specilas END -->
              </div><!-- END TAB #5/#3 -->
            </div>
          <!-- TAB Delete Specials END -->

          <!-- TAB Support -->
            <div class="tab-pane" id="tab-support">
              <iframe src="<?php echo $link_to_support; ?>" frameborder="0" style="height: 100vh;" height="100%" width="100%"></iframe>
            </div>
          <!-- TAB Support END -->
          </div><!-- End tab-content -->

        </div><!-- End class="box" -->
      </div> <!-- End  class="panel-body" -->
    </div><!-- End  class="panel panel-default" -->
  </div><!-- End  class="container-fluid" -->
</div>
<script>
  // $('.colorpicker').each(function(index) {
  //    $(this).attr('id', 'colorpicker_'+index );
  //        var colorpicker = new Array();
  //        colorpicker[index] = $('#colorpicker_'+index).val();
  //       $('#colorpicker_'+index).css('border-left-color', colorpicker[index]);

  //   $('#colorpicker_' + index).colpick({
  //     layout:'rgbhex',
  //     submit:0,
  //     color: colorpicker[index],
  //     onChange:function(hsb,hex,rgb,el,bySetColor) {
  //       if(!bySetColor) {
  //         $(el).val('#'+hex);
  //         $('#colorpicker_'+index).val('#'+hex );
  //       }
  //       $(el).css('border-left-color','#'+hex);
  //       // $(this+' .colpick_current_color').css('background-color', colorpicker[index] );
  //       $('.colpick_current_color').css('display', 'none' );

  //     }
  //   }).keyup(function(){
  //     $(this).colpickSetColor(this.value);
  //   });
  // });
</script>

<?php echo $js_part; ?>
<?php echo $footer; ?>