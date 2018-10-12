<?php
// Require PHP >= 7
require_once "./DBLoader.php";

$action = $_GET['action'] ?? 'list';
$options['type'] = $_GET['type'] ?? null;
$options['name'] = $_GET['name'] ?? null;
$options['new_name'] = $_GET['new_name'] ?? null;
$options['parent_id'] = $_GET['parent'] ?? 0;
$options['created'] = date('Y-m-d H:i:s');
/**
 * 
 */
class File extends DBLoader{
	public $action;
	public $options;

	function __construct($action, $options){
		$this->action = $action;
		$this->options = $options;
		parent::__construct();
	}
	
	function list(){
		echo json_encode($this->all());
	}

	function add(){
		echo json_encode($this->create($this->options));
	}
	
	function remove(){
		echo json_encode($this->delete($this->options));
	}
	
	function rename(){
		echo json_encode($this->changeName($this->options));
	}

}

$file = new File($action, $options);

if(in_array($action, ['list','add','remove','rename']))
	$file->$action();
else
	echo json_encode(['msg'=>"action not supported!"]);
