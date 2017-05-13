<?php if ($module_title){ ?>
<h3><?php echo $module_title; ?></h3>
<?php } ?>
<?php if ($template == 'info1 full' || $template == 'action full'){ ?>
</div> 
<div class="clearfix"></div>
</div> 
</div> 
<div class="full_width_wrapper">
<div class="container">
<?php } ?>
<div class="box">
<div class="row custom <?php echo $template; ?> <?php if ($template == 'info1' || $template == 'info1 full'){ echo 'no_margin'; }  ?>">
<?php foreach($sections as $section){ ?>
<div class="<?php echo $columns; ?>">
    <div class="single dark_color <?php if ($template == 'info1' || $template == 'info1 full' || $template == 'info2' || $template == 'info3'){ echo 'light_bg_color_hover'; }  ?> <?php if ($template == 'action boxed'){ echo 'light_bg_color'; }  ?>">
        <?php if ($section['title']){ ?>
        <h3><?php echo $section['title']; ?></h3>
        <?php } ?>
        <?php echo $section['description']; ?>
    </div>
</div>
<?php } ?>
</div>
</div>
<?php if ($template == 'info1 full' || $template == 'action full'){ ?>
</div>
<div class="clearfix"></div>
</div>
<div>
<div class="container">
<div>
<?php } ?>