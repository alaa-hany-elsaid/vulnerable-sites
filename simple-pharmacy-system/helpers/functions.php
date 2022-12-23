<?php 
require_once "mysql.php";
function clients($limit = 10)
{	
	global $con;
	return $con->query("select * from clients limit $limit ");

}
function medicines($limit = 10 )
{	
	global $con;
	
	return $con->query("select * from medicines limit $limit");

}
function adminName()
{	
	global $con;
	
	$array = $con->query("select * from users where id='$_SESSION[userId]'");
	$row = $array->fetch_assoc();
	return $row['name'];
}
function getAdminName($id)
{	
	global $con;
	
	$array = $con->query("select * from users where id='$id'");
	$row = $array->fetch_assoc();
	return $row['name'];
}
function getAllCat()
{	
	global $con;
	
	$array = $con->query("select * from categories");
	while($row = $array->fetch_assoc())
	{
		echo "<option value='$row[id]'>$row[name]</option>";
	}
	
}

 ?>