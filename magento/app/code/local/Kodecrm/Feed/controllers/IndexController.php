<?php
class Kodecrm_Feed_IndexController extends Mage_Core_Controller_Front_Action
{
	public function indexAction ()
	{

		if(Mage::getStoreConfig('chat_section/feed_group/status')) {
				
			$collection = Mage::getModel('catalog/product')
			->getCollection()
			->addAttributeToSelect('*');

			$store = Mage::app()->getStore();

			$feedarr = array();
			$feedarr['title'] = $store->getName();
			$feedarr['link']  = $store->getUrl();
			$feedarr['item']  = array();

			$currency_code = Mage::app()->getStore()->getCurrentCurrencyCode();

			foreach ($collection as $product) {
					
				$categories = array();
				$cat_arr = $product->getCategoryCollection()->exportToArray();
					
				foreach($cat_arr as $category) {
					$categories[] = Mage::getModel('catalog/category')
					->load($category['entity_id'])->getName();
				}
					
				$feedarr['item'][] = array(
                    'title' => $product->getName(),
                    'brand' => $product->getAttributeText('manufacturer'),
                    'description' => $product->getDescription(),
                    'pid' => $product->getId(),
                    'link' => ($product->getProductUrl()) ,
                    'image_link' => $product->getImageUrl(),
                    'price' => $product->getPrice(),
                    'currency' => $currency,
                    'availability' => (int) $product->isInStock(),
                    'category' => $categories
				);
			}

			$feed_helper = Mage::helper('feed');

			$feed = $feed_helper->kodecrm_feed_create($feedarr);

			echo $feed;
			exit();
		}

	}
}