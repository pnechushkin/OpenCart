<?php 
class ControllerCommonPopupLogin extends Controller {
	public function index() {
		
		$data['shopme_header_login'] = $this->config->get('shopme_header_login');
		$this->load->language('account/login');
		
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		
		$data['button_login'] = $this->language->get('button_login');

		$this->language->load('module/account');
		
		$this->load->model('account/customer');

		$data['action'] = $this->url->link('account/login', '', 'SSL');
		$data['logout_link'] = $this->url->link('account/logout', '', 'SSL');
		$data['login_link'] = $this->url->link('account/login', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		
		$data['logged'] = $this->customer->isLogged();
		
		// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
			$data['redirect'] = $this->session->data['redirect'];

			unset($this->session->data['redirect']);		  	
		} else {
			$data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}
		
		$data['content_top'] = $this->load->controller('common/content_top');

		$this->response->setOutput($this->load->view('shopme/template/common/popup_login.tpl', $data));
	}
	
}