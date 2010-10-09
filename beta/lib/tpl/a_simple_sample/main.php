<?php
/**
 * DokuWiki Arctic Template
 *
 * This is the template you need to change for the overall look
 * of DokuWiki.
 *
 * You should leave the doctype at the very top - It should
 * always be the very first line of a document.
 *
 * @author Andreas Gohr <andi@splitbrain.org>
 * @author Michael Klier <chi@chimeric.de>
 * @link   http://wiki.splitbrain.org/template:arctic
 * @link   http://chimeric.de/projects/dokuwiki/template/arctic
 */

// must be run from within DokuWiki
if (!defined('DOKU_INC')) die();

// include custom arctic template functions
require_once(dirname(__FILE__).'/tpl_functions.php');
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php echo strip_tags($conf['title'])?> – <?php tpl_pagetitle()?>
    
  </title>

  <?php tpl_metaheaders()?>


  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />

  <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>

</head>
<body id="body-<?php echo str_replace(':', '-', $ID);?>" class="sidebar-<?php echo tpl_getConf('sidebar'); ?>">
<div class="dokuwiki">    
<?php html_msgarea()?>
<?php /*old includehook*/ @include(dirname(__FILE__).'/head.html')?>
<div id="wrapper">
	

<div id="menu">
	<?php render_full_navigation(":menu"); ?>
    <?php tpl_searchform() ?>
</div>





<div id="header">

	<h1 id="sitename"><?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" accesskey="h" title="[ALT+H]"')?></h1>
	<h1 id="pagename"><?php tpl_link(wl($ID,'do=backlink'),tpl_pagetitle($ID,true))?></h1>

      


    <?php flush()?>


</div>



  <?php if(!$toolb) { ?>
  <?php if(!tpl_getConf('hideactions') || tpl_getConf('hideactions') && isset($_SERVER['REMOTE_USER'])) { ?>
  <div class="bar" id="bar__top">
    <div class="bar-left">
      <?php 
        if(!tpl_getConf('closedwiki') || (tpl_getConf('closedwiki') && isset($_SERVER['REMOTE_USER']))) {
                // check if new page button plugin is available
                if(!plugin_isdisabled('npd') && ($npd =& plugin_load('helper', 'npd'))) {
                  $npd->html_new_page_button();
                }
                tpl_actionlink('edit');
                tpl_actionlink('history');
        }
      ?>
    </div>
    <div class="bar-right">
      <?php
            if(!tpl_getConf('closedwiki') || (tpl_getConf('closedwiki') && isset($_SERVER['REMOTE_USER']))) {
              tpl_actionlink('admin');
              tpl_actionlink('revert');
              tpl_actionlink('profile');
              tpl_actionlink('recent');
              tpl_actionlink('index');
              tpl_actionlink('login');
              if(tpl_getConf('sidebar') == 'none') tpl_searchform();
            } else {
              tpl_actionlink('login');
            }
      ?>
    </div>
</div>
<?php } ?>
<?php } ?>


<!--
<div class="sidebar" id="sidebar">          
<?php if(!tpl_sidebar_hide()){  
			tpl_sidebar(tpl_getConf('sidebar'));
		  } ?>
</div>
-->

<div class="page" id="page">
	<div class="content">
		<?php ($notoc) ?  tpl_content(false) : tpl_content() ?>
<!--
		<div class="meta">
			<?php tpl_userinfo()?>
	    	<?php tpl_pageinfo()?>
		</div>
-->		

	    
		
	</div>
</div>



		<?php if(tpl_getConf('trace')) {?>     
	<div id="trail">
	      <?php ($conf['youarehere'] != 1) ? tpl_breadcrumbs() : tpl_youarehere(' ➔ ');?>
	</div>
	    <?php } ?>

    <?php flush()?>

    <?php /*old includehook*/ @include(dirname(__FILE__).'/footer.html')?>
</div>





</div>
<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
</body>
</html>
