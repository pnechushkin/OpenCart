<?php
class ControllerModuleShopmeFacebook extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('module/shopme_facebook');

		$this->load->model('setting/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('shopme_facebook', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/shopme_facebook', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/shopme_facebook', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['shopme_facebook_title'])) {
			$data['shopme_facebook_title'] = $this->request->post['shopme_facebook_title'];
		} else {
			$data['shopme_facebook_title'] = $this->config->get('shopme_facebook_title');
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['shopme_facebook_script'])) {
			$data['shopme_facebook_script'] = $this->request->post['shopme_facebook_script'];
		} else {
			$data['shopme_facebook_script'] = $this->config->get('shopme_facebook_script');
		}
		
		if (isset($this->request->post['shopme_facebook_html'])) {
			$data['shopme_facebook_html'] = $this->request->post['shopme_facebook_html'];
		} else {
			$data['shopme_facebook_html'] = $this->config->get('shopme_facebook_html');
		}

		if (isset($this->request->post['shopme_facebook_status'])) {
			$data['shopme_facebook_status'] = $this->request->post['shopme_facebook_status'];
		} else {
			$data['shopme_facebook_status'] = $this->config->get('shopme_facebook_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/shopme_facebook.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/shopme_facebook')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}