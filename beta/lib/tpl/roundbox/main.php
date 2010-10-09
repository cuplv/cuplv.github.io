<?php
/*
 * DokuWiki Roundbox Template
 *
 * A template with a sidebar after the style of my homepage
 * <http://chrisarndt.de/>
 *
 * @link   http://wiki.splitbrain.org/wiki:tpl:roundbox
 * @author Chris Arndt <chris@chrisarndt.de>
 * @author Don Bowman  <don@lynsoft.co.uk>
 */

// include discussion code
if (in_array('discussion', plugin_list('syntax'))) {
    include(DOKU_PLUGIN.'discussion/discussion.php');
    $have_discussion = true;
} else {
    $have_discussion = false;
}

/* include template configuration and translations */
//include_once(dirname(__FILE__).'/conf/default.php');
include_once(dirname(__FILE__).'/lang/en/lang.php');
@include_once(dirname(__FILE__).'/lang/'.$conf['lang'].'/lang.php');

/* include sidebar code */
if (tpl_getConf('rb_sitenav')) {
  include(dirname(__FILE__).'/sidebar.php');
}

/* include template helper functions */
include_once(dirname(__FILE__).'/roundbox.php');


$user = rb_get_user_info();
$perms = auth_quickaclcheck($ID);

// we must move the doctype down (unfortunately) - headers need to be first
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php tpl_pagetitle()?> 
    [<?php echo hsc($conf['title'])?>]
    </title>

  <?php tpl_metaheaders()?>

  <?php rb_checkTheme()?>

  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />

<?php if (tpl_getConf('rb_roundcorners')) { ?>
  <link rel="stylesheet" media="screen" type="text/css" href="<?php echo DOKU_TPL?>roundcorners.css" />
<?php } ?>

  <!--[if gte IE 5]>
  <style type="text/css">
    /* that IE 5+ conditional comment makes this only visible in IE 5+ */
    /* IE bugfix for transparent PNGs */
    //DISABLED   img { behavior: url("<?php echo DOKU_BASE?>lib/scripts/pngbehavior.htc"); }
  </style>
  <![endif]-->

<?php if (tpl_getConf('rb_sidebar_orientation') == 'right') { ?>
<style type="text/css"><!--
div.dokuwiki #content {
    float: left;
    margin-right: 2%;
    margin-left: 0px;
}

div.dokuwiki #sidebar {
    float: right;
}
--></style>
<?php } ?>

  <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>
</head>

<body>
<?php /*old includehook*/ @include(dirname(__FILE__).'/topheader.html')?>

<!-- start dokuwiki block -->
<div class="dokuwiki">

  <!-- start header block -->
  <div id="header">

    <!-- start header title -->
    <div id="header_title">
      <div class="logo">
        <?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[ALT+H]"')?>
      </div>
      <div class="pagename">
        [[&nbsp;<?php if (rb_check_action_perms('backlink', $perms, $user)) {
          tpl_link(wl($ID,'do=backlink'),$ID);
        } else {
        echo hsc($ID); } ?>&nbsp;]]
      </div>
    </div>
    <!-- end header title -->

    <!-- start lower header part -->
    <div class="bar" id="header_bar">
      <!-- start tagline -->
      <div class="bar_left" id="bar_topleft">
         <span class="tagline"><?php echo hsc(tpl_getConf('rb_tagline')) ?></span>
      </div>
      <!-- end tagline -->

      <!-- start goto & search area -->
      <div class="bar_right" id="bar_topright">
<?php if (rb_check_action_perms('goto', $perms, $user)) { ?>
        <form action="<?php echo DOKU_BASE ?>doku.php" accept-charset="utf-8"
          class="search" name="goto" >
          <input type="text" accesskey="g" name="id" class="edit"
            title="<?php echo $lang['tip_goto'] ?> [ALT-G]" />
          <input type="submit" value="<?php echo $lang['btn_goto']?>"
            class="button" title="<?php echo $lang['tip_goto'] ?> [ALT-G]" />
        </form>
<?php } ?>
<?php if (rb_check_action_perms('search', $perms, $user)) { ?>
        <?php tpl_searchform()?>&nbsp;
<?php } ?>
      </div>
      <!-- end goto & search area -->

    </div>
    <!-- end lower header part -->

  </div>
  <!-- end header block -->

  <?php /*old includehook*/ @include(dirname(__FILE__).'/header.html')?>
  <?php flush()?>

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

<!-- wikipage start -->
<?php tpl_content()?>
<!-- end wikipage -->

<!-- discussion start -->
<?php //if ($have_discussion) { tpl_discussion(); } ?>
<!-- end discussion -->

      <div class="toplink">
        <?php tpl_actionlink('top')?>
      </div>
      <hr />

      <!-- start page meta information -->
      <div class="meta">
        <?php tpl_pageinfo()?>
      </div>
      <!-- end page meta information -->

    </div>
    <!-- end wikipage block -->

  </div>
  <!-- end content block -->

  <!-- start sidebar -->
  <div id="sidebar">

<?php if (tpl_getConf('rb_sitenav')) { ?>
    <!-- start site navigation box -->
    <div id="sitenav">
      <div id="sitenav_title">
        <?php ptln(hsc($lang['sitenav_title']))?>
      </div>
      <?php html_sidebar('sitenav_content')?>
    </div>
    <!-- end site navigation box -->
<?php } ?>

    <!-- start site commands box -->
    <div id="sitecmd">
      <div id="sitecmd_title">
        <?php ptln(hsc($lang['sitecmd_title']))?>
      </div>
      <div id="sitecmd_content">
<?php rb_sitecmds($perms, $user) ?>
      </div>
    </div>
    <!-- end site commands box -->

    <!-- start user info -->
    <div class="user">
      <?php tpl_userinfo() ?>
    </div>
    <!-- end user info -->

    <!-- start footer -->
    <?php /*old includehook*/ @include(dirname(__FILE__).'/footer.html')?>
    <!-- end footer -->

  </div>
  <!-- end sidebar -->

  <?php flush()?>

</div>
<!-- end dokuwiki block -->

<?php tpl_indexerWebBug() ?>

</body>
</html>
