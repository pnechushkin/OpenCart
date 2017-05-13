<?php
class ControllerModuleShopmeFacebook extends Controller {
	public function index() {
		
		$title = $this->config->get('shopme_facebook_title');
		if(empty($title[$this->language->get('code')])) {
			$data['module_title'] = false;
		} else if (isset($title[$this->language->get('code')])) {
			$data['module_title'] = html_entity_decode($title[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
		}
		$data['facebook_script'] = html_entity_decode($this->config->get('shopme_facebook_script'), ENT_QUOTES, 'UTF-8');
		$data['facebook_html'] = html_entity_decode($this->config->get('shopme_facebook_html'), ENT_QUOTES, 'UTF-8');
			
       if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/shopme_facebook.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/shopme_facebook.tpl', $data);
			} else {
				return $this->load->view('default/template/module/shopme_facebook.tpl', $data);
			}
	}
}