<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

include "../koneksi.php";

$nama      = mysqli_real_escape_string($conn, $_POST['nama'] ?? '');
$merk      = mysqli_real_escape_string($conn, $_POST['merk'] ?? '');
$harga     = mysqli_real_escape_string($conn, $_POST['harga'] ?? '');
$deskripsi = mysqli_real_escape_string($conn, $_POST['deskripsi'] ?? '');
$foto      = mysqli_real_escape_string($conn, $_POST['foto'] ?? '');

if ($nama == '' || $merk == '' || $harga == '') {
  echo json_encode([
    "status" => "error",
    "message" => "data kosong"
  ]);
  exit;
}

$query = mysqli_query($conn, "
  INSERT INTO product (nama, merk, harga, deskripsi, foto)
  VALUES ('$nama', '$merk', '$harga', '$deskripsi', '$foto')
");

if ($query) {
  echo json_encode(["status" => "success"]);
} else {
  echo json_encode([
    "status" => "error",
    "mysql_error" => mysqli_error($conn)
  ]);
}
