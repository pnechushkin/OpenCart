<div class="scrollbox manufacturers">
  <?php foreach ($manufacturers as $manufacturer) { ?>
  <label class="level-0">
    <input type="checkbox" name="manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" class="manufacturer"/><?php echo $manufacturer['name']; ?>
  </label>
  <?php } ?>
</div>