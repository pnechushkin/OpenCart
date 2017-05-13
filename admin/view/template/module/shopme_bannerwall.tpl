<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-shopme_bannerwall" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shopme_bannerwall" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
          
             
          <div class="tab-pane">
            <ul class="nav nav-tabs" id="language">
              <?php foreach ($languages as $language) { ?>
              <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
            
            
              <?php foreach ($languages as $language) { ?>
              <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
				
                
                <div class="panel-default">
                <div class="panel-body">
                
                
                <div class="row">
                                
                <div class="col-sm-4">
                <div class="well text-center" style="padding:15px 25px 0px;">
				<div class="form-group">
                <b><?php echo $text_image1; ?></b><br />
                <a href="" id="thumb-icon1<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon1[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="image1[<?php echo $language['language_id']; ?>];" value="<?php echo $image1[$language['language_id']]; ?>" id="input-image1<?php echo $language['language_id']; ?>" />
              	</div>
                <div class="form-group">
                <label><?php echo $text_html_link; ?></label>
                <input type="text" class="form-control" name="html1[<?php echo $language['language_id']; ?>];" value="<?php echo $html1[$language['language_id']]; ?>" id="input-html1<?php echo $language['language_id']; ?>" />
                </div>
                </div>
                </div> <!-- Col ends -->
                
                <div class="col-sm-4">
                <div class="well text-center" style="padding:15px 25px 0px;">
				<div class="form-group">
                <b><?php echo $text_image2; ?></b><br />
                <a href="" id="thumb-icon2<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon2[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="image2[<?php echo $language['language_id']; ?>];" value="<?php echo $image2[$language['language_id']]; ?>" id="input-image2<?php echo $language['language_id']; ?>" />
              	</div>
                <div class="form-group">
                <label><?php echo $text_html_link; ?></label>
                <input type="text" class="form-control" name="html2[<?php echo $language['language_id']; ?>];" value="<?php echo $html2[$language['language_id']]; ?>" id="input-html2<?php echo $language['language_id']; ?>" />
                </div>
                </div>
                
                <div class="well text-center" style="padding:15px 25px 0px;">
				<div class="form-group">
                <b><?php echo $text_image3; ?></b><br />
                <a href="" id="thumb-icon3<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon3[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="image3[<?php echo $language['language_id']; ?>];" value="<?php echo $image3[$language['language_id']]; ?>" id="input-image3<?php echo $language['language_id']; ?>" />
              	</div>
                <div class="form-group">
                <label><?php echo $text_html_link; ?></label>
                <input type="text" class="form-control" name="html3[<?php echo $language['language_id']; ?>];" value="<?php echo $html3[$language['language_id']]; ?>" id="input-html3<?php echo $language['language_id']; ?>" />
                </div>
                </div>
                
                </div>
                
                <div class="col-sm-4">
				<div class="well text-center" style="padding:15px 25px 0px;">
				<div class="form-group">
                <b><?php echo $text_image4; ?></b><br />
                <a href="" id="thumb-icon4<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon4[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="image4[<?php echo $language['language_id']; ?>];" value="<?php echo $image4[$language['language_id']]; ?>" id="input-image4<?php echo $language['language_id']; ?>" />
              	</div>
                <div class="form-group">
                <label><?php echo $text_html_link; ?></label>
                <input type="text" class="form-control" name="html4[<?php echo $language['language_id']; ?>];" value="<?php echo $html4[$language['language_id']]; ?>" id="input-html4<?php echo $language['language_id']; ?>" />
                </div>
                </div>
                
                </div>
                
                </div>
                </div>
                
                

                
                
    			
                </div>
              </div> <!-- Tab ends -->
              <?php } ?>
              
            </div>
          </div>
          
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>