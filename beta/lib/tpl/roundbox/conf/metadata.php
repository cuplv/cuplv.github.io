<?php
/*
 * additional configuration options used by the template
 * See http://www.splitbrain.org/wiki:tpl:roundbox#configuration for more info
 */
$meta['rb_theme']  = array('multichoice','_choices' => array('evening','spring','haze','sxs','yuk'));

$meta['rb_tagline']  = array('string'); // tagline under wiki title

$meta['rb_roundcorners'] = array('onoff'); // main boxes with round corners? (mozilla only)

$meta['rb_sidebar_orientation'] = array('multichoice','_choices' => array('left','right'));
$meta['rb_sitenav']  = array('onoff'); // show site navigation in sidebar true|false
$meta['rb_uselinks'] = array('onoff'); // use links instead of buttons

$meta['rb_index']    = array('string'); // Sets the name for the index page of namespaces

$meta['rb_youarehere'] = array('onoff'); // hierarchical navigation instead of breadcrumbs
$meta['rb_crumbsep'] = array('string'); // Specifies what separates each breadcrumb
$meta['rb_removeunderscore'] = array('onoff'); // Removes underscore from breadcrumb links
?>
