<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

include "../koneksi.php";

$id = $_POST['id'];

mysqli_query($koneksi, "DELETE FROM product WHERE id='$id'");

echo json_encode([
  "status" => true,
  "message" => "Data berhasil dihapus"
]);

$query = mysqli_query($conn, "DELETE FROM product WHERE id='$id'");

if ($query) {
  echo json_encode(["status" => "success"]);
} else {
  echo json_encode([
    "status" => "error",
    "mysql_error" => mysqli_error($conn)
  ]);
}
