<div class="scrollbox categories">
	<?php foreach ($categories as $category) { ?>
	<label class="level-<?php echo $category['level']; ?>"><?php echo str_repeat('<i>&mdash;</i>', $category['level']); ?><input type="checkbox" name="categories[]" value="<?php echo $category['category_id']; ?>" class="category" /><?php echo $category['name']; ?></label>
	<?php } ?>
</div>