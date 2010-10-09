<?php

/**
 * Checks if the color scheme has changed
 */
function rb_checkTheme(){
  $theme = tpl_getConf('rb_theme');
  $file  = DOKU_TPLINC.'style.ini';
  $file2 = DOKU_TPLINC.'themes/'.$theme.'/style.ini';
  $ini   = parse_ini_file($file);
  
  if ($ini['__theme__'] != $theme){
    if ((@file_exists($file2)) && (@unlink($file)) && (@copy($file2, $file))){
      global $conf;
      if ($conf['fperm']) chmod($file, $conf['fperm']);
      echo '<meta http-equiv="Refresh" content=0 />';
    } else {
      msg('Could not set correct style.ini file for your chosen theme.', -1);
    }
  }
}


/**
 * get user name an groups
 * Works around bug in DokuWiki <= 2009-09-22 and also appends
 * 'ALL' to list of groups to facilitate group access checking
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function rb_get_user_info() {
    global $INFO;
    $user = array();
    if ($_REQUEST['do'] == 'logout' or !isset($INFO['userinfo'])) {
        $user['groups'] = array();
    } else {
        $user['groups'] = $INFO['userinfo']['grps'];
        $user['name'] = $_SERVER['REMOTE_USER'];
    }
    array_push($user['groups'], 'ALL');
    return $user;
}

/**
 * check if current user should have access to given action
 * Relies on certain configuration parameters to be present
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function rb_check_action_perms($action, $perms, $user) {
    global $conf;
//    $ac_lvl = $conf['rb_act_ac_lvl'][$action];
    $ac_lvls = tpl_getConf('rb_act_ac_lvl');
    $ac_users = tpl_getConf('rb_act_users');
    $ac_lvl = $ac_lvls[$action];
    if (!isset($ac_lvl) or $ac_lvl == '') { $ac_lvl = 255; }
    if ($perms >= $ac_lvl) {
        return true;
//    } elseif (!empty($conf['rb_act_users'][$action])) {
//        $speclist = explode(',', $conf['rb_act_users'][$action]);
    } elseif (!empty($ac_users[$action])) {
        $speclist = explode(',', $ac_users[$action]);
        $allowed_users = array();
        $allowed_groups = array();
        foreach ($speclist as $spec) {
            $spec = trim($spec);
            if (substr($spec, 0, 1) == '@') {
                array_push($allowed_groups, substr($spec, 1));
            } else {
                array_push($allowed_users, $spec);
            }
        }
        if (!empty($info['user']) and
          in_array($user['name'], $allowed_users)) {
            return true;
        }
        foreach ($user['groups'] as $group) {
            if (in_array($group, $allowed_groups)) {
                return true;
            }
        }
    }
    return false;
}

/**
 * print button of link for given action depending on visibility settings
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function rb_button($action, $perms, $user) {
    global $conf;
    if (rb_check_action_perms($action, $perms, $user)) {
        if (tpl_getConf('rb_uselinks')) {
            ptln('<li class="level1">');
            tpl_actionlink($action);
            ptln('</li>');
        } else {
            tpl_button($action);
            ptln('<br>');
        }
    }
}

/**
 * prints the contents of the command box in the sidebar
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function rb_sitecmds($perms, $user) {
    global $conf;
    if (tpl_getConf('rb_uselinks')) {
        ptln('<ul>');
    } else {
        ptln('<div class="buttonbox">');
    }
    foreach (tpl_getConf('rb_actions') as $command) {
        if ($command == '-') {
            if (tpl_getConf('rb_uselinks')) {
                ptln('</ul>');
                ptln('<ul>');
            } else {
                ptln('<br>');
            }
        } else {
            rb_button($command, $perms, $user);
        }
    }
    if (tpl_getConf('rb_uselinks')) {
        ptln('</ul>');
    } else {
        ptln('</div>');
    }
}

/**
 * replacement for tpl_youarehere()
 * Links namespaces to <namespace>:index
 *
 * taken from:
 * <http://wiki.splitbrain.org/wiki:tips:breadcrumb_namespace_index_links>
 */
function rb_youarehere() {
    global $conf;
    global $ID;
    global $lang;

    $parts = explode(':', $ID);

    print hsc($lang['youarehere']).': ';

    // Always show start page
    if ($a_part[0] != $conf['start']) {
        tpl_link(wl($conf['start']), $conf['start'],
          'title="'.$conf['start'].'"');
    }

    $page = '';
    $last = count($parts);
    $count = 1;

    foreach ($parts as $part) {
        if ($count != $last || $part != tpl_getConf('rb_index')) {
            // Skip start page if already done
            if ($part == $conf['start']) continue;
            print tpl_getConf('rb_crumbsep');
            $page .= $part;
            // Remove underscores
            if (tpl_getConf('rb_removeunderscores') == 1) {
                $part = str_replace('_', ' ', $part);
            }
            // Set link variable
            if ($count == $last) $link = $page;
            else $link = "$page:" . tpl_getConf('rb_index');
            // Check if page exists
            if (file_exists(wikiFN($link))) {
                tpl_link(wl($link), $part, 'title="'.$link.'"');
            }
            else {
                // Print link, but mark as not-existing
                tpl_link(wl($link), $part,
                  'title="'.$link.'" class="wikilink2"');
            }
            $page .= ':';
        }
        $count++;
    }
}

/**
 * Show meta information for images
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function rb_img_meta($debug=false) {
    global $conf;
    global $lang;
    global $IMG;

    /* change the order of fields in this array to change the order in which
     * the image information tags are listed
     */
    $tags = array(
      'img_caption' => array('IPTC.Caption', 'EXIF.UserComment',
           'EXIF.TIFFImageDescription', 'EXIF.TIFFUserComment'),
      'img_artist' => array('Iptc.Byline', 'Exif.TIFFArtist', 'Exif.Artist',
        'Iptc.Credit'),
      'img_keywords' => array('IPTC.Keywords','IPTC.Category'),
      'img_copyr' => array('Iptc.CopyrightNotice', 'Exif.TIFFCopyright',
        'Exif.Copyright'),
      'img_camera' => 'Simple.Camera',
      'img_fname' => 'File.Name',
      'img_format' => 'File.Format',
      'img_dimen'=> null, // built from File.Width and File.Height
      'img_date' => 'Date.EarliestTime',
      'img_fsize'=> 'File.NiceSize',
    );

    ptln('<table class="img_tags">');
    ptln('<caption>', 2);
    ptln($lang['img_metaheading'], 4);
    if (tpl_img_getTag('File.Mime') == 'image/jpeg') {
        rb_btn_img_meta_edit($IMG, true);
    }
    ptln('</caption>', 2);
    /* Comment out the following six lines if you don't want column headers */
    ptln('<thead>', 2);
    ptln('<tr>', 4);
    ptln('<th class="label">' . $lang['colfield'] . '</th>', 6);
    ptln('<th class="value">' . $lang['colvalue'] . '</th>', 6);
    ptln('</tr>', 4);
    ptln('</thead>', 2);
    /* end column headers */
    ptln('<tbody>', 2);
    foreach ($tags as $tagname => $meta) {
        if ($tagname == 'img_dimen') {
            $info = tpl_img_getTag('File.Width') . '&#215;' .
              tpl_img_getTag('File.Height');
        } else {
            $info = tpl_img_getTag($meta);
            if ($info && $tagname == 'img_date') {
                $info = strftime($conf['dformat'], $info);
            } else {
                $info = nl2br(hsc($info));
            }
        }
        if ($info) {
            ptln('<tr>', 4);
            ptln('<td class="label">' . hsc($lang[$tagname]) . '</td>', 6);
            ptln('<td class="value">' . $info . '</td>', 6);
            ptln('</tr>', 4);
        }
    }
    ptln('</tbody>', 2);
    ptln('</table>');
    if ($debug) {
        dbg(tpl_img_getTag('Simple.Raw'));
    }
}

/**
 * Print link to mediaedit page
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function rb_btn_img_meta_edit($id, $newwin=false) {
    global $AUTH;
    global $lang;
    if ($AUTH >= AUTH_UPLOAD) {
        print '<a href="' . DOKU_BASE . 'lib/exe/media.php?edit=' .
          urlencode($id) . '"';
        if ($newwin) {
            print ' onclick="return metaedit(\'' . urlencode($id) .
              '\');" target="mediaselect"';
        }
        print '>';
        print '<img src="' . DOKU_BASE . 'lib/images/edit.gif" alt="' .
          $lang['metaedit'] . '" title="' . $lang['metaedit'] . '" />';
        ptln('</a>');
    }
}

/**
 * Helper function for sorting media files with images first
 *
 * @author Chris Arndt <chris@chrisarndt.de>
 */
function mediacmp($a, $b) {
    if ($a['isimg'] && $b['isimg']) {
        return strcmp($a['file'], $b['file']);
    } elseif ($a['isimg']) {
        return -1;
    } elseif ($b['isimg']) {
        return 1;
    } else {
        return strcmp($a['file'], $b['file']);
    }
}

/**
 * Print a list of mediafiles in the current namespace
 *
 * @author Chris Arndt <chris@chrisarndt.de> (based on tpl_mediafilelist)
 */
function rb_mediafilelist($columns=4){
    global $conf;
    global $lang;
    global $NS;
    global $AUTH;
    $dir = utf8_encodeFN(str_replace(':', '/', $NS));

    $data = array();
    search($data, $conf['mediadir'], 'search_media', array(), $dir);

    if(!count($data)){
        ptln('<div class="nothing">'.$lang['nothingfound'].'</div>');
        return;
    }

    usort($data, "mediacmp");
    ptln('<table>');
    ptln('<tbody>');
    $i = 0;
    foreach($data as $item) {
        if ($i == 0) { ptln('<tr>', 2); }
        ptln('<td>', 4);

        // prepare deletion button
        if ($AUTH >= AUTH_DELETE) {
            $ask = $lang['del_confirm'].'\\n';
            $ask .= $item['id'];

            $del = '<a href="' . DOKU_BASE . 'lib/exe/media.php?delete='.
              urlencode($item['id']) . '" ' . 'onclick="return confirm(\'' .
              $ask . '\')" onkeypress="return confirm(\'' . $ask . '\')">' .
              '<img src="' . DOKU_BASE . 'lib/images/del.png" alt="' .
            $lang['btn_delete'] . '" ' . 'align="bottom" title="' .
            $lang['btn_delete'] . '" /></a>';
        } else {
            $del = '';
        }

        // show thumbnail for images
        if ($item['isimg']) {
            $w = $item['meta']->getField('File.Width');
            $h = $item['meta']->getField('File.Height');

            // prepare EXIF/IPTC data
            $caption = $item['meta']->getField('IPTC.Headline');

            $meta = '';
            $t = $item['meta']->getField(array('IPTC.Caption',
              'EXIF.UserComment', 'EXIF.TIFFImageDescription',
              'EXIF.TIFFUserComment'));
            if ($t) { $meta .= $t . '<br />'; }

            $t = $item['meta']->getField(array('IPTC.Keywords',
              'IPTC.Category'));
            if($t) { $meta .= '<i>' . $t . '</i><br />'; }

            // image thumbnail
            print '<a href="javascript:mediaSelect(\'' . $item['id'] . '\')"';
            print '  onmouseover="domTT_activate(this, event, \'content\', ';
            print "'" . $meta . "', 'trail', true, 'styleClass', 'imagemeta'";
            if ($caption) {
                print ", 'caption', '" . $caption . "'";
            }
            print ');">';

            if ($w > 120 || $h > 120) {
                $ratio = $item['meta']->getResizeRatio(120);
                $tw = floor($w * $ratio);
                $th = floor($h * $ratio);
            }

            $src = ml($item['id'],array('w'=>$w,'h'=>$h));

            $p = array();
            $p['width'] = $tw;
            $p['height'] = $th;
            $p['alt'] = $item['id'];
            $p['class'] = 'thumb';
            $att = buildAttributes($p);

            print '<img src="' . $src . '" ' . $att . ' />';
            ptln('</a>');
            ptln('<br />', 6);
        }

        // link to select media file
        ptln('<a href="javascript:mediaSelect(\'' . $item['id'] . '\')">' .
          utf8_decodeFN($item['file']) . '</a>', 6);

        if ($item['isimg']) {
            ptln('<br />', 6);
            ptln('(' .$w. '&#215;' .$h. ' ' .filesize_h($item['size']). ')', 6);
        } else {
            ptln('<br />', 6);
            ptln('(' . filesize_h($item['size']) . ')', 6);
        }
        // delete button
        ptln('<br />', 6);
        // edit button
        if ($item['isimg']
          && $item['meta']->getField('File.Mime') == 'image/jpeg') {
            rb_btn_img_meta_edit($item['id']);
        }
        ptln($del, 6);
        // end of cell
        ptln('</td>', 4);
        $i++;
        if ($i == $columns) {
            ptln('</tr>', 2);
            $i = 0;
        }
    }
    if ($i != 0) {
        for (; $i < $columns; $i++) {
            ptln('<td>&nbsp;</td>', 4);
        }
        ptln('</tr>', 2);
    }
    ptln('</tbody>');
    ptln('</table>');
}
?>
