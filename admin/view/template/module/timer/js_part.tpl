<script type="text/javascript">
  <?php if ($hours_days_status) { ?>  
      set_multiselect('.weekdays');
      set_multiselect('.hours');

      function set_multiselect(identificator) {
        $(identificator).multipleSelect({
            multiple: true,
            width: '100%',
            multipleWidth: '100%',
            placeholder: "<?php echo $l->get('choose'); ?>",
            selectAllText: "<?php echo $l->get('always'); ?>",
            allSelected: "<?php echo $l->get('always'); ?>",
            countSelected: false,
        });
      }
  <?php } ?>

  $('.multiple-select').multipleSelect({
      multiple: true,
      width: '100%',
      multipleWidth: '100%',
      placeholder: "<?php echo $l->get('choose'); ?>",
      selectAllText: "<?php echo $l->get('all'); ?>",
      allSelected: "<?php echo $l->get('all'); ?>",
      countSelected: false,
  });


  // Attach Tooltip
  tooltip_restart();

  function tooltip_restart() {
      $('[data-toggle=\'tooltip\']').tooltip({
        container: 'body', 
        html: true,
        content: function () {
          return $(this).prop('title');
        }
      });
  }

  // Edit selected specials
  $('#edit_specials').on('click', function() {
    var specials = $('#all_products_specials :checkbox').map(function(i,el){
      if($(el).prop('checked')){
            // Ignore checkbox "Select all specials"
          if($(el).val() != 'on')
            return $(el).val();
      }
    }).get();

    // Paste specials IDs into hidden input
    $('#edit_selected_specials input[name="specials"]').val(specials);
  });


  $('input[type="checkbox"][name="timer_status"],\
    #tab-additional-admin-settings input[type="checkbox"],\
    #tab-general-settings input[type="checkbox"],\
    #tab-additional-catalog-settings input[type="checkbox"]').onoff();


  function clean_inputs(form) {
    form.find('input[type="text"], input[type="number"]').val('');
    form.find('input[type="checkbox"]').prop("checked", false );

    form.find('button.btn-primary').trigger('click');
    $('html, body').animate({scrollTop: $(document).height()}, 'slow');
  }


  // On the filter page
  $('#reset-filters').on('click', function() {
    var url = '<?php echo $url_path_to_module; ?>&token=<?php echo $token; ?>';
    location = url;
  });

  $('#button-filter').on('click', function() {
    var url = '<?php echo $url_path_to_module; ?>&token=<?php echo $token; ?>',
        filters = [],
        filters_with_select = [];

    filters.push('filter_name', 
        'filter_model',
        'filter_special_date_from', 'filter_special_date_to',
        'filter_price_from', 'filter_price_to',
        'filter_special_price_from', 'filter_special_price_to',
        'filter_quantity_from', 'filter_quantity_to'
    );

    filters_with_select.push('filter_category',
        'filter_manufacturer',
        'filter_customer_groups',
        'filter_special_group',
        'filter_status'
    );
    
    <?php if ($hours_days_status) { ?>
      filters_with_select.push('filter_weekdays', 'filter_hours');
    <?php } ?>

    $.merge(filters, filters_with_select);
    
    $.each(filters , function(i, val) { 
        var item = '';

        if($.inArray(val, filters_with_select) != -1) {
            item = $("select[name='" + val + "']").val();
        } else {
            item = $("input[name='" + val + "']").val();
        }

        if (item
            && item != '*' 
            && typeof(item) != "undefined"
            && item !== null
        ) {
          // Check if it's filter_weekdays or hours, if yes, then convert to array
          if(val == 'filter_weekdays' || val == 'filter_hours' || val == 'filter_customer_groups')
            item = item.join("_");

          url += '&' + val + '=' + encodeURIComponent(item);
        }
    });

    location = url;
  });

  $('input[name=\'filter_name\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'filter_name\']').val(item['label']);
    }
  });

  $('input[name=\'filter_model\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['model'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'filter_model\']').val(item['label']);
    }
  });
</script>

<!-- Validation specials -->
<script type="text/javascript">
  // Function to save both General and Additional Settings 
  function save_settings(form) {
    var errors = 0,
        ajax_loader = form.find('.ajax-loader'),
        error_result = form.find('.error-result'),
        result = form.find('.result'),
        submit_button = form.find('.button'),
        url_part = "";

    // Cleaning previous errors
    error_result.html('');
    result.html('');

    if(form.attr('id') == "general-settings") {
      url_part = "save_general_settings";
    } else if(form.attr('id') == "additional-admin-settings" || form.attr('id') == "additional-catalog-settings") {
      url_part = "save_additional_settings";
    }

    if(errors === 0) {
      $.ajax({
        'type': 'POST',
        'cache': false,
        'dataType': 'json',
        'url': '<?php echo $url_path_to_module; ?>' + '/' + url_part + '&token=<?php echo $token; ?>',
        'data': form.serialize(),
        'success': function (data) {
          submit_button.removeAttr('disabled');
          ajax_loader.hide();

          $.each(data.result, function (index, value) {
            result.append(value + "<br>");
          });

          $.each(data.errors, function (index, value) {
            error_result.append(value + "<br>");
          });
        },
        'beforeSend': function () {
          submit_button.attr('disabled', 'disabled');
          error_result.html('');
          result.html('');
          ajax_loader.show();
        },
      }); // END AJAX
    }

    return false;
  }

  function set_specials(form) {
    var ajax_loader = form.find('.ajax-loader'),
        error_result = form.find('.error-result'),
        result = form.find('.result'),
        submit_button = form.find('.button');

    if(validate_new_specials(form)) {
      $.ajax({
        'type': 'POST',
        'cache': false,
        'dataType': 'json',
        'url': '<?php echo $url_path_to_module; ?>/ajax_set_specials&token=<?php echo $token; ?>',
        'data': form.serialize(),
        'success': function (data) {
          submit_button.removeAttr('disabled');
          ajax_loader.hide();

          $.each(data.result, function (index, value) {
            result.append(value + "<br>");
          });

          $.each(data.errors, function (index, value) {
            error_result.append(value + "<br>");
          });

          // TAB #1. Clear Product list
          if(form.attr('id') == "set-specials-by-products")
            form.find('#special_product').html('');

          // TAB #2. Clear Category list
          if(form.attr('id') == "set-specials-by-categories")
            form.find('.unselect-all').trigger('click');

          // TAB #3. Clear Manufacturer list
          if(form.attr('id') == "set-specials-by-manufacturers")
            form.find('.unselect-all').trigger('click');
        },
        'beforeSend': function () {
          submit_button.attr('disabled', 'disabled');
          error_result.html('');
          result.html('');
          ajax_loader.show();
        },
      }); // END AJAX
    } // END if

    return false;
  }
  
  function ajax_edit_or_delete_specials(form) {
    var ajax_loader = form.find('.ajax-loader'),
        error_result = form.find('.error-result'),
        result = form.find('.result'),
        submit_button = form.find('button.btn-primary');

    $.ajax({
      'type': 'POST',
      'cache': false,
      'dataType': 'json',
      'url': form.attr('action'),
      'data': form.serialize(),
      'success': function (data) {
        submit_button.removeAttr('disabled');
        ajax_loader.hide();

        $.each(data.result, function (index, value) {
          result.append(value + "<br>");
        });

        $.each(data.errors, function (index, value) {
          error_result.append(value + "<br>");
        });
      },
      'beforeSend': function () {
        submit_button.attr('disabled', 'disabled');
        error_result.html('');
        result.html('');
        ajax_loader.show();
      },
    }); // END AJAX

    return false;
  }

  function validate_new_specials(form) {
    var errors = 0,
        form_id = form.attr('id'),
        total_discount_input = form.find('.total_discount'),
        total_discount = parseFloat(total_discount_input.val()),
        error_result = form.find('.error-result');
    
    // Cleaning previous errors
    error_result.text('');
    form.find('.result').html('');
    form.find('.error').attr('data-original-title','').removeClass('error');

    // Check all tabs on total discount 
    if(isNaN(total_discount)) {
      errors += 1;
      total_discount_input.addClass('error');
      error_result.append('<?php echo $l->get('error_discount'); ?><br>');
    } else {
      if(form.find('.discount_type').val() == 'percentage' && ( total_discount >= 100 || total_discount <= 0 )) {
        errors += 1;
        total_discount_input.addClass('error');
        error_result.append('<?php echo $l->get('error_percentage_discount'); ?><br>');
      } else if(form.find('.discount_type').val() == 'currency' && total_discount <= 0 ) {
        errors += 1;
        total_discount_input.addClass('error');
        error_result.append('<?php echo $l->get('error_min_discount'); ?><br>');
      }
    }

    // TAB #1. Check if Products isn't empty
    // if(form_id == "set-specials-by-products") {
    //   if($.trim(form.find('#special-product').text()).length == 0) {
    //     errors += 1;
    //     form.find('#special-product').addClass('error');
    //     error_result.append('<?php echo $l->get('error_no_selected_products'); ?><br>');
    //   }
    // }

    // // TAB #2. Check if Categories isn't empty
    // if(form_id == "set-specials-by-categories") {
    //   if(form.find(".category:checked").length == 0) {
    //     errors += 1;
    //     form.find('.categories').addClass('error');
    //     error_result.append('<?php echo $l->get('error_no_selected_categories'); ?><br>');
    //   }
    // }

    // // TAB #3. Check if Manufacturers isn't empty
    // if(form_id == "set-specials-by-manufacturers") {
    //   if(form.find(".manufacturer:checked").length == 0) {
    //     errors += 1;
    //     form.find('.manufacturers').addClass('error');
    //     error_result.append('<?php echo $l->get('error_no_selected_manufacturers'); ?><br>');
    //   }
    // }


    // Set customer groups ids as array in the hidden field
    var items = form.find('.customer_group_id :checkbox').map(function(i, el){
      if($(el).prop('checked')){
            // Ignore checkbox "All selected"
          if($(el).val() != 'on')
            return $(el).val();
      }
    }).get();

    // Paste customer groups IDs into hidden input
    items = items.join("_");
    
    if(items.length == 0) {
        errors += 1;
        form.find(".customer_group_id").addClass('error');
        error_result.append('<?php echo $l->get('error_empty_customer_groups'); ?><br>');
    } else {
        form.find('.customer_groups').val(items);
    }
    
    return errors == 0;
  }


  function show_ajax_edit_form(product_special_id) {  // ( post_id, meta, nonce )
    special_div = $('#special_' + product_special_id);

    special_price = special_div.children( ".special_price" );
    date_start = special_div.children( ".date_start" );
    date_end = special_div.children( ".date_end" );
    priority = special_div.children( ".priority" );
    timer = special_div.children( ".timer" );
    customer_group_id = special_div.children( ".customer_group_id" );
    special_group_id = special_div.children( ".special_group_id" );

    <?php if ($hours_days_status) { ?>
      weekdays = special_div.children( ".special_weekdays" );
      hours = special_div.children( ".special_hours" );
    <?php } ?>

    timer_val = timer.find('input[type="hidden"]').val();
    timer_text = '<input type="checkbox" name="timer" value="1" />';
    timer.html( timer_text );

    if (timer_val == 1) {
      special_div.find('input[name="timer"]').prop("checked", true);
    }


    customer_group_id_val = customer_group_id.find('input[type="hidden"]').val();
    customer_group_text = '<select name="customer_group_id" class="form-control">';
      <?php foreach ($customer_groups as $customer_group) { ?>
        customer_group_text += '<option value="<?php echo $customer_group["customer_group_id"]; ?>"';
        customer_group_text += '><?php echo $customer_group["name"]; ?></option>';
      <?php } ?>
    customer_group_text += '</select>';

    customer_group_id.html( customer_group_text );
    special_div.find("select[name='customer_group_id'] option[value='" + customer_group_id_val + "']").prop("selected", true);


    special_group_id_val = special_group_id.find('input[type="hidden"]').val();
    special_group_text = '<select name="special_group_id" class="form-control">';
      special_group_text += '<option value="0"></option>'
     
      <?php foreach ($special_groups as $special_group) { ?>
        special_group_text += '<option value="<?php echo $special_group["product_special_group_id"]; ?>"';
        special_group_text += '><?php echo $special_group["name"]; ?></option>';
      <?php } ?>
    special_group_text += '</select>';

    special_group_id.html( special_group_text );
    special_div.find("select[name='special_group_id'] option[value='" + special_group_id_val + "']").prop("selected", true);


    <?php if ($hours_days_status) { ?>
        weekdays_arr = weekdays.find('input[type="hidden"]').val();
        weekdays_arr = weekdays_arr.split(',');

        weekdays_text = '<select name="weekdays[]" multiple="true">';
          <?php foreach ($weekdays as $weekday) { ?>
            weekdays_text += '<option value="<?php echo $weekday["id"]; ?>"';
            weekdays_text += '><?php echo $weekday["name"]; ?></option>';
          <?php } ?>
        weekdays_text += '</select>';
        weekdays.html(weekdays_text);

        // Select old values
        $.each(weekdays_arr, function (i, val) {
            special_div.find("select[name='weekdays[]'] option[value='" + val + "']").prop("selected", true);
        });
        
        // Attach script Multiselect to "select" weekdays
        set_multiselect(weekdays.find("select[name='weekdays[]']"));


        hours_arr = hours.find('input[type="hidden"]').val();
        hours_arr = hours_arr.split(',');

        hours_text = '<select name="hours[]" multiple="true">';
          <?php foreach ($hours as $hour) { ?>
            hours_text += '<option value="<?php echo $hour["id"]; ?>"';
            hours_text += '><?php echo $hour["name"]; ?></option>';
          <?php } ?>
        hours_text += '</select>';
        hours.html(hours_text);

        // Select old values
        $.each(hours_arr, function (i, val) {
            special_div.find("select[name='hours[]'] option[value='" + val + "']").prop("selected", true);
        });
        
        set_multiselect(hours.find("select[name='hours[]']"));
    <?php } ?>


    special_price.html('<input type="text" name="special_price" value="' + special_price.text() + '" data-old-price="' + special_price.attr('data-old-price') +'" class="form-control">');
    date_start.html( getDateField('date_start', date_start.text()) );
    date_end.html( getDateField('date_end', date_end.text()) );
    priority.html( getInputField('priority', priority.text()) );

    special_div.find('.edit').hide();
    special_div.find('.save').show();
    special_div.find('.result').text('');

    reinstallDateTimePicker();
  }


  function getDateField(date_name, date_value) {
   
    if(date_value == '0000-00-00') {
      date_value = '';
    }

    date = '<div class="input-group date">';
    date+= ' <input type="text" name="' + date_name + '" value="' + date_value + '" maxlength="10" class="form-control" data-date-format="YYYY-MM-DD" placeholder="0000-00-00" />';
    date+= ' <span class="input-group-btn">';
    date+= '  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    date+= ' </span>';
    date+= '</div>';

    return date;
  }


  function getInputField(input_name, input_value) {
    input = '<input type="text" name="' + input_name + '" value="' + input_value + '" class="form-control">';
    return input;
  }


  function saveAjaxData(product_special_id) {
    special_div = $('#special_' + product_special_id);

    $.ajax({
      'type': 'POST',
      'cache': false,
      'dataType': 'json',
      'url': '<?php echo $url_path_to_module; ?>/ajax_update_special&token=<?php echo $token; ?>',
      'data': {
        'product_special_id': product_special_id,
        'old_price'         : special_div.find('input[name="special_price"]').attr('data-old-price'),
        'price'             : special_div.find('input[name="special_price"]').val(),
        'date_start'        : special_div.find('input[name="date_start"]').val(),
        'date_end'          : special_div.find('input[name="date_end"]').val(),
        'priority'          : special_div.find('input[name="priority"]').val(),
        'timer'             : special_div.find('input[name="timer"]:checked').val(),
        'customer_group_id' : special_div.find('select[name="customer_group_id"]').val(),
        'special_group_id'  : special_div.find('select[name="special_group_id"]').val(),

        <?php if ($hours_days_status) { ?>
          'weekdays'          : special_div.find('select[name="weekdays[]"]').val(),
          'hours'             : special_div.find('select[name="hours[]"]').val(),
        <?php } ?>
      },
      'success': function (data) {
          special_div.find('.ajax-loader').hide();

          if (data.status == "success") {
            special_div.find('.result').text('<?php echo $l->get('settings_saved_successfully'); ?>').addClass("success").delay(4000).fadeOut();

            special_div.children( ".special_price" ).text(data.price);
            special_div.children( ".date_start" ).text(data.date_start);
            special_div.children( ".date_end" ).text(data.date_end);
            special_div.children( ".priority" ).text(data.priority);

            special_div.children( ".timer" ).html(data.timer_status + '<input type="hidden" value="' + data.timer + '">');
            special_div.children( ".customer_group_id" ).html(data.customer_group_name + '<input type="hidden" value="' + data.customer_group_id + '">');
            special_div.children( ".special_group_id" ).html(data.special_group_name + '<input type="hidden" value="' + data.special_group_id + '">');

            <?php if ($hours_days_status) { ?>
                // Return weekdays and hours values
                if(data.weekdays != "") {
                    weekdays_html = '<i class="fa fa-bar-chart-o fa-2x" data-toggle="tooltip" title="' + data.weekdays_tooltip + '"></i>';
                } else {
                    weekdays_html = ""; 
                }

                special_div.children(".special_weekdays").html(weekdays_html + '<input type="hidden" value="' + data.weekdays + '">');


                if(data.hours != "") {
                    hours_html = '<i class="fa fa-clock-o fa-2x" data-toggle="tooltip" title="' + data.hours_tooltip + '"></i>';
                } else {
                    hours_html = "";    
                }
                
                special_div.children(".special_hours").html(hours_html + '<input type="hidden" value="' + data.hours + '">');
                
                // Reset tooltip for weekdays and hours
                tooltip_restart();
            <?php } ?>


            special_div.find('.edit').show();
            special_div.find('.save').hide();

          } else {
              
              special_div.find('.result').text('<?php echo $l->get('data_has_errors'); ?>').addClass('error-result');

              $.each(data.errors, function (index, value) {
                  special_div.find('input[name="' + index + '"]').addClass('error').attr('data-toggle','tooltip').attr('data-original-title', value);
              });
          }
      },
      'beforeSend': function () {
          special_div.find('.error-result').removeClass('error-result');
          special_div.find('.result').text('').show().removeClass('success'); 
          special_div.find('.error').attr('data-original-title','');
          special_div.find('.error').removeClass('error');
          special_div.find('.ajax-loader').show();
      },
    });
    // $('.tooltip').tooltip();
  }


  // Convert all inputs to array
  function convertInputsToArray(selector) {
      return $(selector).map(function() {
              return $(this).val();
          }).toArray();
  }


  function convertArrToStr(array, glue) {
      return Array.prototype.join.call(array, glue);
  }


  $('.input-product').autocomplete({
    source: function(request, response) {      
      var form = $(this).closest('form'),
          product_name = form.find('.input-product.product_name').val(),
          product_model = form.find('.input-product.model').val();

      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(product_name) + '&filter_model=' +  encodeURIComponent(product_model),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            // Notice: Don't use <b> inside label, it causes some problems with selection
            
            // Ignore chosen product ids
            if (!form.find('#included_product_' + item["product_id"]).length) {
                return {
                  label: item['name'] + " (Price: " + parseFloat(item['price']).toFixed(2) + "). <?php echo $l->get('model'); ?>: " + item['model'],
                  name:  item['name'],
                  value: item['product_id'],
                  price: item['price'],
                }
            }
          }));
        }
      });
    },
    select: function(item) {
      var form = $(this).closest('form'),
          products_block = form.find('.included-products');

      form.find('.input-product').val('');
      form.find('#included_product_' + item['value']).remove();
    
      row = '<div id="included_product_' + item['value'] + '">';
      row += '<i class="fa fa-minus-circle"></i> ' + item['label'];
      row += '<input type="hidden" name="products[id][]" value="' + item['value'] + '" class="product-id"/>';
      row += '<input type="hidden" name="products[price][]" value="' + item['price'] + '" />';
      row += '<input type="hidden" name="products[name][]" value="' + item['name'] + '" />';
      row += '</div>';
      
      products_block.append(row);

      if (form.parent().attr('id') == 'tab-set-specials') {
        update_total_possible_products_number();
      } else {
        update_total_possible_specials_number(form.attr('id'));
      }
    }
  });
  
  $('.included-products').delegate('.fa-minus-circle', 'click', function() {
    var form = $(this).closest('form');

    $(this).parent().remove();

    if (form.parent().attr('id') == 'tab-set-specials') {
      update_total_possible_products_number();
    } else {
      update_total_possible_specials_number(form.attr('id'));
    }
  });


  // Search for attributes (in tab "set specials)
  $('#tab-set-specials .attribute-text').autocomplete({
    // .attribute_text can be attribute name/attribute value/attribute group

    source: function(request, response) {
      var attribute_text = $(this).val(),
          chosen_attribute_ids = "",
          params = '&token=<?php echo $token; ?>'; // Additional params to URL
      
      params += '&attribute_text=' +  encodeURIComponent(attribute_text);

      var chosen_attributes = {
          'ids'    : convertInputsToArray('#chosen_attributes .attribute-id'),
          'values' : convertInputsToArray('#chosen_attributes .attribute-value')
      };
      
      // If there exist some chosen attributes, join them to the url
      if (!$.isEmptyObject(chosen_attributes["ids"])) {
          params += "&ids=" + convertArrToStr(chosen_attributes["ids"], "_")
          params += "&values=" + convertArrToStr(chosen_attributes["values"], "_")
      }

      $.ajax({
        url: '<?php echo $url_path_to_module; ?>/getAttibutesByText' + params,
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            var label = item['attribute_name'];
            label += " - " + item["attribute_value"];
            label += " (<?php echo $l->get('attribute_group'); ?>: " + item["attribute_group_name"] + ")";

            return {
              label: label,
              value: item['attribute_id'] + "_" + item['attribute_value'],
              attribute_id: item["attribute_id"],
              attribute_value: item["attribute_value"]
            }
          }));
        }
      });
    },

    select: function(item) {
      // Clean input field
      $(this).val('');

      // Clean the existing value to avoid duplicates
      $('.chosen_attribute_' + item['attribute_id']).each(function() {
        var value = $(this).find(".attribute-value").val();

        if (value == item["attribute_value"]) {
          $(this).remove();
        }
      });
      

      var row = '<div class="chosen_attribute_' + item['attribute_id'] + '">';
      row += '<i class="fa fa-minus-circle"></i> ';
      row += item['label'];
      row += '<input type="hidden" name="attributes[id][]" value="' + item['attribute_id'] + '" class="attribute-id"/>';
      row += '<input type="hidden" name="attributes[value][]" value="' + item['attribute_value'] + '" class="attribute-value" />';
      row += '</div>';

      $('#chosen_attributes').append(row);

      update_total_possible_products_number();
    }
  });
    
  $('#chosen_attributes').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();

    update_total_possible_products_number();
  });
  // Search for attributes END


  // Search for options (in tab "set specials)
  $('#tab-set-specials .option-text').autocomplete({
    // .option_text can be option name/option value

    source: function(request, response) {
      var option_text = $(this).val(),
          chosen_option_ids = "",
          params = '&token=<?php echo $token; ?>'; // Additional params to URL
      
      params += '&option_text=' +  encodeURIComponent(option_text);

      var chosen_options = {
          'ids'    : convertInputsToArray('#chosen_options .option-id'),
          'values' : convertInputsToArray('#chosen_options .option-value-id')
      };
      
      // If there exist some chosen attributes, join them to the url
      if (!$.isEmptyObject(chosen_options["ids"])) {
          params += "&ids=" + convertArrToStr(chosen_options["ids"], "_")
          params += "&values_ids=" + convertArrToStr(chosen_options["values"], "_")
      }

      $.ajax({
        url: '<?php echo $url_path_to_module; ?>/getOptionsByText' + params,
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['option_name'] + " - " + item["option_value_name"],
              value: item['option_id'] + "_" + item['option_value_id'],
              option_id: item["option_id"],
              option_value_id: item["option_value_id"]
            }
          }));
        }
      });
    },

    select: function(item) {
      // Clean input field
      $(this).val('');

      // Clean the existing value to avoid duplicates
      $('.chosen_option_' + item['option_id']).each(function() {
        var value = $(this).find(".option-value-id").val();

        if (value == item["option_value_id"]) {
          $(this).remove();
        }
      });
      
      var row = '<div class="chosen_option_' + item['option_id'] + '">';
      row += '<i class="fa fa-minus-circle"></i> ';
      row += item['label'];
      row += '<input type="hidden" name="options[id][]" value="' + item['option_id'] + '" class="option-id"/>';
      row += '<input type="hidden" name="options[value][]" value="' + item['option_value_id'] + '" class="option-value-id" />';
      row += '</div>';

      $('#chosen_options').append(row);

      update_total_possible_products_number();
    }
  });
  
  $('#chosen_options').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();

    update_total_possible_products_number();
  });
  // Search for options END


  // For Tab "Set specials"
  // TODO: window with possible products
  function update_total_possible_products_number() {
      var form = $("#tab-set-specials > form"),
          products_block = form.find('.found-products tbody');
      
      $.ajax({
        'type': "POST",
        'cache': false,
        'dataType': 'json',
        'url': form.attr("action"),
        'data': form.serialize(),
        'success': function (data) {
            form.find('.total-found-products').html(data.total);

            var sort_order = 1;
        
            // Show found products
            $.each(data.products, function (index, product_info) {
                html = '<tr class="product-item">';
                html += '  <td class="sort-order text-center">' + sort_order + '</td>';
                html += '  <td class="photo text-center"><img src="' + product_info.image + '" alt="' + product_info.name + '" class="img-thumbnail" /></td>';
                html += '  <td class="name">' + product_info.name + '</td>';
                html += '  <td class="price text-center">' + product_info.price + '</td>';
                html += '  <td class="status text-center">' + product_info.status + '</td>';
                html += '  <td class="quantity text-center">' + product_info.quantity + '</td>';
                html += '</tr>';

                products_block.append(html);

                sort_order++;
            });
            
            if (data.products.length < data.total) { 
                products_block.append('<td colspan="6"><b><?php echo $l->get('shown'); ?> ' + data.products.length + ' / ' + data.total + '</b></td>');
            }
        },
        'beforeSend': function () {
            form.find('.total-found-products').html('<img src="../image/loading.gif">');

            // Clean previous found products
            form.find('.found-products tbody').html('');
        },
      });
  }
  
  // Need to update the number of found specials in tabs "edit", "delete" specials
  function update_total_possible_specials_number(form_selector, start_limit = 0) {
      var form = $('#' + form_selector).parent().find('form');
          specials_block = form.find('.found-specials tbody');
      
      $.ajax({
        'type': "POST",
        'cache': false,
        'async': false,
        'dataType': 'json',
        'url': '<?php echo $url_path_to_module; ?>/getPossibleSpecials&token=<?php echo $token; ?>',
        'data': {
            'form': form.serialize(),
            'start_limit': start_limit
        },
        'success': function (data) {
            form.find('.total-found-specials').html(data.total);

            var sort_order = start_limit + 1;
                total_shown_specials = specials_block.children('.special-item').length + (data.specials ? data.specials.length : 0);
            
            if (total_shown_specials <= data.total) {
                specials_block.find('tr').last().remove();
            }

            // Show found specials
            if (data.specials) {
                $.each(data.specials, function (index, product_info) {
                    html = '<tr class="special-item">';
                    html += '  <td class="sort-order text-center">' + sort_order + '</td>';
                    html += '  <td class="photo text-center"><img src="' + product_info.image + '" alt="' + product_info.name + '" class="img-thumbnail" /></td>';
                    html += '  <td class="name">' + product_info.name + '</td>';
                    html += '  <td class="old-price text-center">' + product_info.old_price + '</td>';
                    html += '  <td class="special-price text-center">' + product_info.special_price + '</td>';
                    html += '  <td class="status text-center">' + product_info.status + '</td>';
                    html += '  <td class="special-group text-center">' + product_info.special_group_name + '</td>';
                    html += '  <td class="date-start text-center">' + product_info.date_start + '</td>';
                    html += '  <td class="date-end text-center">' + product_info.date_end + '</td>';

                    <?php if ($hours_days_status) { ?>
                        // Return weekdays and hours values
                        html += '  <td class="text-center weekdays"><i class="fa fa-bar-chart-o fa-2x" data-toggle="tooltip" title="' + product_info.weekdays_tooltip + '"></i></td>';
                        html += '  <td class="text-center hours"><i class="fa fa-bar-chart-o fa-2x" data-toggle="tooltip" title="' + product_info.hours_tooltip + '"></i></td>';
                    <?php } ?>

                    html += '</tr>';

                    specials_block.append(html);

                    sort_order++;
                });
            }

            if (total_shown_specials < data.total) {
                specials_block.append('<tr><td colspan="6"><b><?php echo $l->get('shown'); ?> ' + total_shown_specials + ' / ' + data.total + '</b><br><a href="#" onclick="update_total_possible_specials_number("' + form_selector + '", '(start_limit + 100) + '); return false;"><?php echo $l->get('show_more_records'); ?></a></td></tr>');
            }

            // Reset tooltip for weekdays and hours
            tooltip_restart();
        },
        'beforeSend': function () {
            form.find('.total-found-specials').html('<img src="../image/loading.gif">');

            // Clean previous found products (only when the user changed filters)
            if (!start_limit) {
                form.find('.found-specials tbody').html('');
            }
        },
      });
  }
  
  // Bind "show"/"close" found products/specials to the form
  $('.show-found-products, .show-found-specials').bind('click', function() {
    var form = $(this).closest('form');
    form.find('.block-products, .block-specials').slideToggle('fast');
  });
  
  $('.close-block-products, .close-block-specials').bind('click', function() {
    var form = $(this).closest('form');
    form.find('.block-products, .block-specials').slideUp('fast');
  });
    
  $('#tab-edit-specials .ajax-update, #tab-delete-specials .ajax-update').on('change', function(){
    var form = $(this).closest('form');
    update_total_possible_specials_number(form.attr('id'));
  });
  
  $('#tab-edit-specials .select-all, #tab-edit-specials .unselect-all, #tab-delete-specials .select-all, #tab-delete-specials .unselect-all').on('click', function(){
    var form = $(this).closest('form');
    update_total_possible_specials_number(form.attr('id'));
  });
  
  $('#tab-set-specials .ajax-update').on('change', function(){ update_total_possible_products_number(); });
  $('#tab-set-specials .select-all, #tab-set-specials .unselect-all').on('click', function(){ update_total_possible_products_number(); });
  

  // Special groups
  function add_special_group() {
    var special_group_name = $('#new-special-group').val();

    var form = $('#tab-specials-groups form'),
        ajax_loader = form.find('.ajax-loader'),
        error_result = form.find('.error-result'),
        result = form.find('.result');
    
    error_result.html('');
    result.html('');

    if (special_group_name.length > 100 || special_group_name.length == 0) {
      error_result.show().append('<?php echo $l->get('error_special_group_name'); ?>' + "<br>").delay(4000).fadeOut();
    } else {
      $.ajax({
        'cache': false,
        'dataType': 'json',
        'url': '<?php echo $url_path_to_module; ?>/add_new_special_group&token=<?php echo $token; ?>',
        'data': {
            'name' : special_group_name
        },
        'success': function (data) {
          ajax_loader.hide();

          $.each(data.result, function (index, value) {
            if (typeof(data.special_group_id) != "undefined" && data.special_group_id !== null) {
              $('#new-special-group').val('');
              
              // Add the new element into the table
              html = '<div id="special_group' + data.special_group_id +'" class="special-group"><div>\
                          <input type="hidden" name="special_groups[]" value="' + data.special_group_id +'" class="id">\
                          <input type="text" name="special_group_names[]" value="' + special_group_name + '" class="form-control name">\
                          &nbsp;&nbsp; <i class="fa fa-minus-circle"></i>\
                      </div></div>';
              $('#special-groups').append(html);

              reinstall_renaming_special_group();
            }
            
            // Add success msg
            result.show().append(value + "<br>").delay(4000).fadeOut();
          });

          $.each(data.errors, function (index, value) {
            error_result.show().append(value + "<br>").delay(4000).fadeOut();
          });
        },
        'beforeSend': function () {
          error_result.html('');
          result.html('');
          ajax_loader.show();
        },
      }); // END AJAX
    } // end if
  }


  function reinstall_renaming_special_group() {
    $('.special-group .name').on('change', function(){
      var special_group_name = $(this).val(),
          special_group_id = $(this).siblings('.id').val();

      var form = $('#tab-specials-groups form'),
          ajax_loader = form.find('.ajax-loader'),
          error_result = form.find('.error-result'),
          result = form.find('.result');
    
      error_result.html('');
      result.html('');

      if (special_group_name.length > 10 || special_group_name.length == 0) {
        error_result.show().append('<?php echo $l->get('error_special_group_name'); ?>' + "<br>").delay(4000).fadeOut();
      } else {
        $.ajax({
          'cache': false,
          'async': false,
          'dataType': 'json',
          'url': '<?php echo $url_path_to_module; ?>/rename_special_group&token=<?php echo $token; ?>',
          'data': {
              'id': special_group_id,
              'name' : special_group_name
          },
          'success': function (data) {
            ajax_loader.hide();

            $.each(data.result, function (index, value) {
              result.show().append(value + "<br>").delay(4000).fadeOut();
            });

            $.each(data.errors, function (index, value) {
              error_result.show().append(value + "<br>").delay(4000).fadeOut();
            });
          },
          'beforeSend': function () {
            error_result.html('');
            result.html('');
            ajax_loader.show();
          },
        }); // END AJAX
      }
    });
  }

  // Delete special group by id
  $('#special-groups').delegate('.fa-minus-circle', 'click', function() {
    var form = $('#tab-specials-groups form');
        special_group_block = $(this).parent(),
        special_group_id = special_group_block.find('.id').val(),
        special_group_name = special_group_block.find('.name').val();

    var ajax_loader = form.find('.ajax-loader'),
        error_result = form.find('.error-result'),
        result = form.find('.result');
    
      $.ajax({
        // 'type': 'POST',
        'cache': false,
        'dataType': 'json',
        'url': '<?php echo $url_path_to_module; ?>/delete_special_group_by_id&token=<?php echo $token; ?>',
        'data': {
            'id': special_group_id,
            'name' : special_group_name
        },
        'success': function (data) {
          ajax_loader.hide();

          $.each(data.result, function (index, value) {
            result.show().append(value + "<br>").delay(4000).fadeOut();

            special_group_block.remove();
          });

          $.each(data.errors, function (index, value) {
            error_result.show().append(value + "<br>").delay(4000).fadeOut();
          });
        },
        'beforeSend': function () {
          error_result.html('');
          result.html('');
          ajax_loader.show();
        },
      }); // END AJAX
  });


  function reinstallDateTimePicker(){
    $('.date').datetimepicker({
      pickTime: false,
      format: 'YYYY-MM-DD',
    });
  }

  /*=============================================
  =            Initial methods calls            =
  =============================================*/
  
  reinstall_renaming_special_group();
  reinstallDateTimePicker();
  
  /* Init self call while page is loading first time */
  update_total_possible_products_number();

  // In the tabs (edit && delete specials)
  update_total_possible_specials_number('form_edit_specials');
  update_total_possible_specials_number('form_delete_specials_by_parameters');
  
  /*=====  End of Initial methods calls  ======*/

</script>