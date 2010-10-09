<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
/**
 * DokuWiki Roundbox Template
 *
 * This is the template for displaying image details
 *
 * You should leave the doctype at the very top - It should
 * always be the very first line of a document.
 *
 * @link   http://wiki.splitbrain.org/wiki:tpl:templates
 * @author Andreas Gohr <andi@splitbrain.org>
 * @author Christopher Arndt <chris@chrisarndt.de>
 * @author Don Bowman  <don@lynsoft.co.uk>
 */

/* include language settings */
include_once(dirname(__FILE__).'/lang/en/lang.php');
@include_once(dirname(__FILE__).'/lang/'.$conf['lang'].'/lang.php');

/* include template helper functions */
include_once(dirname(__FILE__).'/roundbox.php');

?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>" lang="<?php echo $conf['lang']?>" dir="ltr">
<head>
  <title>
     <?php echo hsc(tpl_img_getTag('IPTC.Headline',$IMG))?>
    [<?php echo hsc($conf['title'])?>]
  </title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <?php tpl_metaheaders()?>

  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />

  <!--[if gte IE 5]>
  <style type="text/css">
    /* that IE 5+ conditional comment makes this only visible in IE 5+ */
    /* IE bugfix for transparent PNGs */
    //DISABLED img { behavior: url("<?php echo DOKU_BASE?>lib/scripts/pngbehavior.htc"); }
  </style>
  <![endif]-->

<script type="text/javascript"><!--
function metaedit(id) {
    window.open('media.php?edit=' + id, 'mediaselect',
      'width=600,height=415,left=70,top=50,scrollbars=yes,resizable=yes'
    )
    return false;
}
// -->
</script>

</head>

<body>
<!-- start dokuwiki block -->
<div class="dokuwiki">

  <!-- start content block -->
  <div id="content">

    <?php if($conf['breadcrumbs']) { ?>
      <div class="breadcrumbs">
      <?php tpl_breadcrumbs(); ?>
      </div>
      <?php }?>
    
    <?php if($conf['youarehere']) { ?>
      <div class="breadcrumbs">
      <?php tpl_youarehere(); ?>
      </div>
      <?php }?>

    <?php if(tpl_getConf('rb_youarehere')) { ?>
      <div class="breadcrumbs">
      <?php rb_youarehere(); ?>
      </div>
      <?php }?>

    <!-- start wikipage block -->
    <div id="page" class="page">

      <?php html_msgarea()?>

<?php if ($ERROR) {
    print $ERROR;
} else { ?>

      <h1 class="img_title">
        <?php ptln(hsc(tpl_img_getTag('IPTC.Headline', $IMG))); ?>
      </h1>

      <p class="img_backto">&larr; <?php echo $lang['img_backto'] ?>
      <?php tpl_pagelink($ID); ?></p>

      <!-- start image -->
      <div class="img_big">
        <?php tpl_img(900, 700); echo "\n"; ?>
      </div>
      <!-- end image -->

      <!-- start image details -->
      <div class="img_detail">
<?php rb_img_meta(); ?>
      </div>
      <!-- end image details -->
<?php } ?>

    </div>
    <!-- end wikipage block -->

  </div>
  <!-- end content block -->

</div>
<!-- end dokuwiki block -->

</body>
</html>

