<?php
class ControllerModuleMegamenuOutput extends Controller {
	public function index() {
				
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/megamenu_output.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/megamenu_output.tpl');
		} else {
			return $this->load->view('default/template/module/megamenu_output.tpl');
		}
	}
}