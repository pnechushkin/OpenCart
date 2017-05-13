<?php
class ControllerModuleShopmeTagcloud extends Controller {
	public function index() {
		
		$this->load->model('localisation/language');
		$this->load->model('module/shopme_tagcloud');
		
		$title = $this->config->get('shopme_tagcloud_title');
        $data['module_title'] = $title[$this->language->get('code')];
	
		$data['limit'] = $this->config->get('shopme_tagcloud_limit');	
		
		$data['tagcloud'] = $this->model_module_shopme_tagcloud->getRandomTags(array(
			'limit'   => (int)$data['limit']
		));
			
       if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/shopme_tagcloud.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/shopme_tagcloud.tpl', $data);
			} else {
				return $this->load->view('default/template/module/shopme_tagcloud.tpl', $data);
			}
	}
}