<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
/**
 * DokuWiki New Day Template
 *
 * You should leave the doctype at the very top - It should
 * always be the very first line of a document.
 *
 * @link   http://www.dokuwiki.org/template:a_new_day
 * @link   http://blog.chirripo.nl
 *
 * @author Andreas Gohr <andi@splitbrain.org>
 * @author Riccardo Govoni <battlehorse@gmail.com>
 * @author Louis Wolf <louiswolf@chirripo.nl>
 *
 */

// Must be run from within DokuWiki
if (!defined('DOKU_INC')) die();

// Include functions that provide sidebar functionality
@require_once(dirname(__FILE__).'/tplfn_sidebar.php');

include(DOKU_TPLINC.'tpl_functions.php');
include(DOKU_TPLINC.'tpl_actions.php');

// Include translations of the template strings
@require_once(dirname(__FILE__).'/lang/'.tpl_translation($conf['lang']).'/settings.php');

?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php tpl_pagetitle()?>
    [<?php echo strip_tags($conf['title'])?>]
  </title>

  <?php tpl_metaheaders()?>

  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />

  <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>

	<script src="<?php echo DOKU_TPL ?>js/prototype.js" type="text/javascript"></script>
	<script src="<?php echo DOKU_TPL ?>js/scriptaculous.js" type="text/javascript"></script>
</head>

<body>
<?php /*old includehook*/ @include(dirname(__FILE__).'/topheader.html')?>
<div class="dokuwiki">
  <?php html_msgarea()?>

  <div class="stylehead">

    <div class="header">
<!--      <div class="pagename">
        [[<?php tpl_link(wl($ID,'do=backlink'),tpl_pagetitle($ID,true))?>]]
      </div> -->
      <div class="logo">
        <?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[ALT+H]"')?>
      </div>

      <div class="clearer"></div>
    </div>
    <div class="menu-top">
    	<!--<div id="tpl_simple_navi">-->
		<?php tpl_topbar() ?>
    	<!--</div>-->
    </div>

    <?php /*old includehook*/ @include(dirname(__FILE__).'/header.html')?>

    <?php if($conf['breadcrumbs']){?>
    <div class="breadcrumbs">
      <div style="float:left">
      <?php tpl_breadcrumbs()?>
      </div>
      <div style="float:right;text-align:right">
      <?php tpl_searchform() ?>
      </div>
      <?php //tpl_youarehere() //(some people prefer this)?>
    </div>
    <?php }?>

    <?php if($conf['youarehere']){?>
    <div class="bread_upper_dark"></div>
    <div class="breadcrumbs">
      <?php tpl_youarehere() ?>
    </div>
    <div class="bread_lower_dark"></div>
    <div class="bread_lower_medium"></div>
    <div class="bread_lower_light"></div>
    <?php }?>

  </div>
  <?php flush()?>

  <?php /*old includehook*/ @include(dirname(__FILE__).'/pageheader.html')?>

<div class="sideandpage" >
	<?php if (tpl_getConf('btl_sidebar_position') == "right") { ?>
	      <div class="mainleft" >
	        <div class="page">
	          <!-- wikipage start -->
	          <?php tpl_content()?>
	          <!-- wikipage stop -->
	        </div>
	     </div>
	<?php } ?>

	<?php if (tpl_getConf('btl_sidebar_position') == "right") { ?>
		<div class="sideright">
	<?php } else { ?>
		<div class="sideleft">
	<?php } ?>
	<div class="userbarandshadows" >
		<?php if (tpl_getConf('btl_sidebar_independent') == 1) { ?>
		<table cellspacing="0" cellpadding="0" border="0" width="100%" >
			<tr>
				<td>
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						<td valign="top">
						  <div class="userbar" >
							<div id="sidebarActionTableId">
							<table cellspacing="0" cellpadding="2" border="0" width="100%">
							<tr><td>
								<div class="smallpadding">
								<div id="sidebar">
								<?php tpl_sidebar() ?>
								</div>
								</div>
							</td></tr>
							</table>
							</div>
						  </div>
						</td>
						</tr>
					</table>
				</td>
			</tr>
		</table><br/>
		<?php } ?>
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<tr>
				<td>
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						<td valign="top">
						<div class="userbar">
						<?php  if (tpl_getConf('btl_sidebar_independent') == 0) { 
?>
							<div id="sidebarActionTableId">
							<table><tr><td>
								<div class="smallpadding">
								<div id="sidebar">
								<?php tpl_sidebar() ?>
								</div>
								</div>
							</td></tr></table>
							</div>
						<?php } ?>

		<?php if (tpl_getConf('btl_hide_page_actions') == 0) { ?>

			<?php if (tpl_getConf('btl_action_palette') && (is_action_enabled('history') || is_action_enabled('backlink') || (is_action_enabled('edit') && (!$conf['useacl'] || $ACT != 'show' || ($conf['useacl'] && $_SERVER['REMOTE_USER']))))) { ?>
			<div class="userbarstrip" onclick="Effect.toggle('pageActionTableId','slide')"><?php echo $lang['btl_strip_page_actions']; ?></div>
			<?php } ?>
			<div id="pageActionTableId" <?php action_group_status('page'); ?> ><div>
		        <table cellspacing="0" cellpadding="2" border="0" width="100%" >
		          <tr><td>
								<?php if (is_action_enabled('history')) { ?>
								<div class="smallpadding"><?php tpl_actionlink('history')?></div></td></tr><tr><td>
								<?php } ?>
								<?php if (is_action_enabled('backlink')) { ?>
	      							<div class="smallpadding"><?php tpl_actionlink('backlink')?></div></td></tr><tr><td>
								<?php } ?>
								<?php if (is_action_enabled('edit')) { ?>
	      							<div class="smallpadding"><?php tpl_actionlink('edit')?></div></td></tr><tr><td>
								<?php } ?>
			</td></tr></table></div></div>

		<?php } ?>
		<?php if (tpl_getConf('btl_hide_wiki_actions') == 0) { ?>

			<?php if (tpl_getConf('btl_action_palette') && (is_action_enabled('index') || is_action_enabled('recent') || (is_action_enabled('admin') && $INFO['perm'] == 255 ))) { ?>
			<div class="userbarstrip" onclick="Effect.toggle('wikiActionTableId','slide')"><?php echo $lang['btl_strip_wiki_actions']; ?></div>
			<?php } ?>
			<div id="wikiActionTableId" <?php action_group_status('wiki'); ?> ><div>
		        <table cellspacing="0" cellpadding="2" border="0" width="100%" >
				<tr><td>
								<?php if (is_action_enabled('index')) { ?>
								<div class="smallpadding"><?php tpl_actionlink('index')?></div></td></tr><tr><td>
								<?php } ?>
								<?php if (is_action_enabled('recent')) { ?>
	      							<div class="smallpadding"><?php tpl_actionlink('recent')?></div></td></tr><tr><td>
								<?php } ?>
								<?php if (is_action_enabled('admin') && $INFO['perm'] == 255) { ?>
									<div class="smallpadding"><?php tpl_actionlink('admin') ?></div></td></tr><tr><td>
								<?php } ?>
			</td></tr></table></div></div>
	
		<?php } ?>
		<?php if (tpl_getConf('btl_hide_user_actions') == 0) { ?>

			<?php if (tpl_getConf('btl_action_palette') && (is_action_enabled('login') || (is_action_enabled('profile') && $_SERVER['REMOTE_USER'] ) || (is_action_enabled('subscribe') && $conf['useacl'] && $ACT == 'show' && $conf['subscribers'] == 1 && $_SERVER['REMOTE_USER']))) { ?>
			<div class="userbarstrip" onclick="Effect.toggle('userActionTableId','slide')"><?php echo $lang['btl_strip_user_actions']; ?></div>
			<?php } ?>
			<div id="userActionTableId" <?php action_group_status('user'); ?> ><div>
		        <table cellspacing="0" cellpadding="2" border="0" width="100%" >
				<tr><td>
								<?php if (is_action_enabled('login')) { ?>
						        <div class="smallpadding"><?php tpl_actionlink('login')?>
									<?php 
										if ($_SERVER['REMOTE_USER']){
											echo $INFO['userinfo']['name'] ; 
										}
									?>
									</div></td></tr><tr><td>
								<?php } ?>
								<?php if (is_action_enabled('profile') && $_SERVER['REMOTE_USER']) { ?>
									<div class="smallpadding"><?php tpl_actionlink('profile') ?></div></td></tr><tr><td>
								<?php } ?>
								<?php if (is_action_enabled('subscribe')) { ?>
									<?php if($conf['useacl'] && $ACT == 'show' && $conf['subscribers'] == 1 && $_SERVER['REMOTE_USER']){ ?>
										<div class="smallpadding"><?php tpl_actionlink('subscribe')?></div></td></tr><tr><td>
									<?php } ?>
								<?php } ?>
			</td></tr></table></div></div>

		<?php } ?>
		<?php if (tpl_getConf('btl_hide_submit_actions') == 0) { ?>

			<?php if (tpl_getConf('btl_action_palette')) { ?>
			<div class="userbarstrip" onclick="Effect.toggle('submitActionTableId','slide')"><?php echo $lang['btl_strip_submit_actions']; ?></div>
			<?php } ?>
			<div id="submitActionTableId" <?php action_group_status('submit'); ?> ><div>
		        <table cellspacing="0" cellpadding="2" border="0" width="100%" >
			<?php
			$actions = tpl_sidebar_actions();
			foreach ($actions as $action)
			{
				if ($action['enabled'] == 1) 
				{
			?>
				<tr>
					<td>
						<div class="smallpadding">
							<a class="tpl_action" style="background: url('<?php echo DOKU_TPL ?>images/p/actions/<?php echo $action['action'] ?>.gif') no-repeat scroll left center" href="<?php echo tpl_action_url($action['url']) ?>">
								<?php echo $action['textlabel'] ?>
							</a>
						</div>
					</td>
				</tr>
			<?php
				}
			}
			?>
		        </table></div></div>

		<?php } ?>

		</div>
		</td>
		</tr>
		</table>
				</td>
			</tr>
		</table>
	</div> 

      </div>
	<?php if (tpl_getConf('btl_sidebar_position') == "left") { ?>
	      <div class="mainright" >
	        <div class="page">
        	  <!-- wikipage start -->
	          <?php tpl_content()?>
	          <!-- wikipage stop -->
        	</div>
	     </div>
	<?php } ?> 
      <div class="clearer">&nbsp;</div>
</div>

 <?php flush()?>

  <div class="stylefoot">

    <div class="meta">
      <div class="user">
        <?php tpl_userinfo()?>
      </div>
      <div class="doc">
        <?php tpl_pageinfo()?> &nbsp;
		<span class="doclink">
			&nbsp;
	        <?php tpl_actionlink('top') ?>
		</span>
      </div>
    </div>

   <?php /*old includehook*/ @include(dirname(__FILE__).'/pagefooter.html')?>

    <div class="bar" id="bar__bottom">
       <?php /*old includehook*/ @include(dirname(__FILE__).'/footer.html')?>
       <img style="float:right" class="footer_border" src="<?php echo DOKU_TPL . '/images/footer_image_right.png' ?>" alt=""/> 
     <div class="clearer"></div>
    </div>
    
  </div>

</div>

<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
</body>
</html>
