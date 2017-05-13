<?php if (!isset($redirect)) { ?>
<div class="checkout-product cart-info confirm">
  <table>
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="model mobile_hide"><?php echo $column_model; ?></td>
        <td class="quantity mobile_hide"><?php echo $column_quantity; ?></td>
        <td class="price mobile_hide"><?php echo $column_price; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?></td>
        <td class="model mobile_hide"><?php echo $product['model']; ?></td>
        <td class="quantity mobile_hide"><?php echo $product['quantity']; ?></td>
        <td class="unit_price mobile_hide"><?php echo $product['price']; ?></td>
        <td class="total"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>        
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="model mobile_hide"></td>
        <td class="quantity mobile_hide">1</td>
        <td class="price mobile_hide"><?php echo $voucher['amount']; ?></td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>

    <tfoot class="confirm_totals price">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="names price filler"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="filler mobile_hide"></td>
        <td class="filler mobile_hide"></td>
        <td class="filler mobile_hide"></td>
        <td class="amounts"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<div class="table_bottom_line cormfirm_order">
<div class="payment"><?php echo $payment; ?></div>
</div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
<?php if ($auto_submit) { ?>
<script type="text/javascript"><!--
$('.payment form').submit();
$('.payment input[type=\'button\']').trigger('click');
$('.payment #button-confirm').trigger('click');
//--></script> 
<?php } ?>