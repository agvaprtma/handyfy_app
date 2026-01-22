<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

include "../koneksi.php";

$id        = $_POST['id'];
$nama      = mysqli_real_escape_string($conn, $_POST['nama']);
$merk      = mysqli_real_escape_string($conn, $_POST['merk']);
$harga     = mysqli_real_escape_string($conn, $_POST['harga']);
$deskripsi = mysqli_real_escape_string($conn, $_POST['deskripsi']);
$foto      = mysqli_real_escape_string($conn, $_POST['foto']);

$query = mysqli_query($conn, "
  UPDATE product SET
    nama='$nama',
    merk='$merk',
    harga='$harga',
    deskripsi='$deskripsi',
    foto='$foto'
  WHERE id='$id'
");

echo json_encode([
  "status" => $query ? "success" : "failed"
]);

$query = mysqli_query($conn, "
  UPDATE product SET
    nama='$nama',
    merk='$merk',
    harga='$harga',
    deskripsi='$deskripsi'
  WHERE id='$id'
");

if ($query) {
  echo json_encode(["status" => "success"]);
} else {
  echo json_encode([
    "status" => "error",
    "mysql_error" => mysqli_error($conn)
  ]);
}
