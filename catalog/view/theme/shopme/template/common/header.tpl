<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if (@$icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- Version 2.0.3 -->
<?php $config = $this->registry->get('config'); ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shopme/stylesheet/stylesheet.css" />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shopme/stylesheet/responsive.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if ($direction == 'rtl') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/shopme/stylesheet/rtl.css" />
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/shopme/js/owl.carousel.min.js"></script>
<script src="catalog/view/theme/shopme/js/jquery.matchHeight.min.js" type="text/javascript"></script>
<script type="text/javascript" src="catalog/view/theme/shopme/js/colorbox/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="catalog/view/theme/shopme/js/shopme_common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<?php 
require_once( DIR_TEMPLATE.$config->get('config_template')."/lib/module.php" );
$modules = new Modules($this->registry);
$top_menu = $modules->getModules('top_menu'); 
?>
<?php echo @$google_analytics; ?>


<?php echo $shopme_styles; ?>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body class="<?php echo $class; ?> <?php echo $config->get('shopme_default_product_style'); ?> <?php if ($config->get('shopme_use_custom')) { ?><?php echo $config->get('shopme_container_layout'); ?><?php } ?>">
<?php echo $shopme_cookie; ?>
<div class="outer_container">
<div class="header_wrapper <?php echo $config->get('shopme_menu_sticky'); ?> <?php echo $config->get('shopme_header_style'); ?>">
<?php if($config->get('shopme_header_style')){ 
require('catalog/view/theme/shopme/template/common/headers/' . $config->get('shopme_header_style') . '.tpl' ); 
} ?>
</div> <!-- header_wrapper ends -->
<div class="breadcrumb_wrapper container"></div>
<div id="notification" class="container"></div>