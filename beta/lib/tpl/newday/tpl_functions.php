<?php
/**
 * DokuWiki Template New Day Functions
 * 
 * @license GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author  Michael Klier <chi@chimeric.de>
 */

/**
 * Renders the topbar
 *
 * @author Michael Klier <chi@chimeric.de>
 * @author Louis Wolf <louiswolf@chirripo.nl>
 */
function tpl_topbar() {
    global $ID;

    $found = false;
    $tbar  = '';
    $path  = explode(':', $ID);

    while(!$found && count($path) >= 0) {
        $tbar = implode(':', $path) . ':' . 'topbar';
        $found = @file_exists(wikiFN($tbar));
        array_pop($path);
        // check if nothing was found
        if(!$found && $tbar == ':topbar') return;
    }

    if($found && auth_quickaclcheck($tbar) >= AUTH_READ) {
        $toolbar = p_wiki_xhtml($tbar,'',false);

	$lines = explode("\n", $toolbar);
	$nr = count($lines);
	$open_ul = 0;
	$primary_ul = 0;
	$positions = array();
	for($i=0; $i<$nr; $i++)
	{
		if (trim($lines[$i]) == '<ul>')
		{
			$open_ul = $open_ul+1;
			if ($open_ul == 1)
			{
				$primary_ul++;
				$lines[$i] = '<ul class="primary">' . "\n";
				array_push($positions, $i);
			}
		}
		else if (strpos($lines[$i], '</ul>') !== false)
		{
			$open_ul = $open_ul-1;
		}
	}

	$first_position = $positions[0];
	$last_position = $positions[count($positions) - 1];
 	$lines[$first_position] = '<ul class="primary start">' . "\n";
	$lines[$last_position] = '<ul class="primary end">' . "\n";
	$width = $primary_ul * 150;

	print '<div id="tpl_simple_navi" style="width:' . $width . 'px;">';
	print implode($lines);
	print '</div>';
    }
}

// Verify if the given action is enabled
function is_action_enabled($type) {	
	$ctype = $type;
	if($type == 'history') $ctype='revisions';
	return actionOK($ctype);
}

// Changes the display style of the given action group, depending on the config file
function action_group_status($groupname) {
	if (tpl_getConf('btl_default_' . $groupname . '_actions_status') == "closed") {
		echo " style='display:none;'" ; 
	}
}

// Check if a translation is available for the template, otherwise fall back to template setting
function tpl_translation($conf) {
	if (file_exists(dirname(__FILE__).'/lang/'.$conf.'/settings.php'))
	{
		return $conf;
	}
	return tpl_getConf('btl_language');

}

// Parse action URL
function tpl_action_url($url) {
	$page_url = urlencode(selfURL());
	$page_title = urlencode(tpl_pagetitle(null, true));

	$url = str_replace("%PAGEURL%", $page_url, $url);
	$url = str_replace("%PAGETITLE%", $page_title, $url);

	return $url;
}

/* Creates the URL of the current page, used for Digg, delicious and google bookmarks */
function selfURL() { 
	$s = empty($_SERVER["HTTPS"]) ? '' : ($_SERVER["HTTPS"] == "on") ? "s" : ""; 
	$protocol = strleft(strtolower($_SERVER["SERVER_PROTOCOL"]), "/").$s; 
	$port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":".$_SERVER["SERVER_PORT"]); 
	return $protocol."://".$_SERVER['SERVER_NAME'].$port.$_SERVER['REQUEST_URI']; 
}

function strleft($s1, $s2) { 
	return substr($s1, 0, strpos($s1, $s2)); 
}
