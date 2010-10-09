<?php

/** 
 * Define your actions here.
 * 
 * action: 
 *	Action name. Also the name of the associated gif image. 
 *      Save your icons in /YOUR/TEMPLATE/DIRECTORY/images/p/actions/
 *
 * url: 
 *	The submission link.
 *	%PAGEURL% will be substituted for the wiki page url.
 *      %PAGETITLE% will be substituted for the wiki page title.
 *
 * textlabel:
 *	The link text that will show up in your wiki action menu.
 *
 * enabled:
 *	Turn off actions by setting this to something other then 1 (suggested: 0).
 * 
 *
 * @author:	Louis Wolf <louiswolf@chirripo.nl>
 * @homepage:   http://blog.chirripo.nl
 */

function tpl_sidebar_actions() {
	$actions = array (
		array (
			'action' => 'digg',
			'url' => 'http://digg.com/submit?phase=2&amp;url=%PAGEURL%&amp;title=%PAGETITLE%', 
			'textlabel' => 'Digg this!',
			'enabled' => 1,
		),
		array (
			'action' => 'delicious',
			'url' => 'http://del.icio.us/post?url=%PAGEURL%&amp;title=%PAGETITLE%', 
			'textlabel' => 'Del.Icio.Us',
			'enabled' => 1,
		),
		array (
			'action' => 'googlebookmarks',
			'url' => 'http://www.google.com/bookmarks/mark?op=add&amp;bkmk=%PAGEURL%&amp;title=%PAGETITLE%',
			'textlabel' => 'Google bookmarks',
			'enabled' => 1,
		),
		array (
			'action' => 'twitter',
			'url' => 'http://twitter.com/home?status=%PAGETITLE%+-+%PAGEURL%',
			'textlabel' => 'Twitter',
			'enabled' => 1,
		),
		array (
			'action' => 'stumbleupon',
			'url' => 'http://www.stumbleupon.com/submit?url=%PAGEURL%&amp;title=%PAGEURL%',
			'textlabel' => 'Stumble upon',
			'enabled' => 1,
		),
		array (
			'action' => 'facebook',
			'url' => 'http://www.facebook.com/share.php?v=4&amp;src=bm&amp;u=%PAGEURL%&amp;t=%PAGETITLE%',
			'textlabel' => 'Facebook',
			'enabled' => 1,
		)
	);

	return $actions;
}

?>
