<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/d_social_login/styles.css" media="screen" />
<div class="popup_login_holder">
<div class="top">
<div class="heading">
<a href="<?php echo $register; ?>" class="btn btn-default pull-right"><?php echo $text_register; ?></a>
<h2><?php echo $text_login; ?></h2> 
</div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<div class="form-group">
<label class="control-label"><?php echo $entry_email; ?></label>
<input type="text" name="email" class="form-control" value="<?php echo $email; ?>" />
</div>
<div class="form-group">
<label class="control-label"><?php echo $entry_password; ?></label>
<input type="password" name="password" class="form-control" value="<?php echo $password; ?>" />
</div>
<input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
<a href="<?php echo $forgotten; ?>" class="forgotten"><?php echo $text_forgotten; ?></a>
<?php if ($redirect) { ?>
<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
<?php } ?>
</form>
</div>
<div class="bottom">
<div id="social_login_popup_holder" class="popup"><?php echo $content_top; ?></div>
</div>
</div>