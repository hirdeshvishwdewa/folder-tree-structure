<?php
require_once "./configs/dbConfig.php";
class DBLoader {
	protected $pdo;
	function __construct(){
		$dsn = "mysql:host=" . db_host . ";dbname=" . db_name . ";charset=" . db_charset;
		$opt = [
		    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
		    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
		    PDO::ATTR_EMULATE_PREPARES   => false,
		];
		$this->pdo = new PDO($dsn, db_user, db_pswd, $opt);
	}

	public function all(){
		$query = 'SELECT * FROM `root` WHERE 1';
		$stmt = $this->pdo->query($query);
		$data = null;
		while ($row = $stmt->fetch()){
		    $data[$row['id']] = $row;
		}
		return $data;
	}
	public function create($options){
		unset($options['new_name']);
		try {
			return $this->pdo->prepare("INSERT INTO `root` (`parent_id`, `name`, `type`, `created`) VALUES (?,?,?,?)")->execute($options) ? $this->pdo->lastInsertId():null;
		} catch (Exception $e) {
			return $e->getMessage();
		}
	}
	
	public function changeName($options){
		$old_name = $options['name'];
		$options['name'] = $_GET['new_name'] ?? $_GET['name'];
		try {
			return $this->pdo->prepare("UPDATE `root` SET `name` = ? WHERE `parent_id` = ? AND `name` = $old_name")->execute($options);
		} catch (Exception $e) {
			return $e->getMessage();	
		}
	}

	public function delete($options){
		$stmt = $this->pdo->prepare("DELETE FROM `root` WHERE `parent_id` = ? AND `name` = ?");
		$stmt->execute($options);
		return $stmt->rowCount();
	}

}