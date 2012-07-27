<?php
class Kodecrm_Feed_Helper_Data extends Mage_Core_Helper_Abstract
{
	public function kodecrm_feed_create($feedarr) {
		$feedarr = array(
        	'channel' => $feedarr,
		);
		require_once ('Kodecrm/Feed/lib.php');
		$dom = new XmlDomConstruct('1.0', 'utf-8');
		$dom->fromMixed($feedarr);
		$dom->formatOutput = true;
		$feed = $dom->saveXML();
		$feed = str_replace('<channel>','<rss version="2.0"><channel>', $feed);
		$feed = str_replace('</channel>','</channel></rss>', $feed);
		return $feed;
	}

}
