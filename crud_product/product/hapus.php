<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

include "../koneksi.php"; // koneksi di $conn

$id = $_POST['id'] ?? 0;

// Pastikan id valid
$id = intval($id);

$query = mysqli_query($conn, "DELETE FROM product WHERE id='$id'");

if ($query) {
    echo json_encode([
        "status" => "success",
        "message" => "Data berhasil dihapus"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Gagal menghapus data",
        "mysql_error" => mysqli_error($conn)
    ]);
}

mysqli_close($conn);
?>

// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Methods: POST");
// header("Content-Type: application/json");

// include "../koneksi.php";

// $id = $_POST['id'] ?? 0;

// mysqli_query($koneksi, "DELETE FROM product WHERE id='$id'");

// echo json_encode([
//   "status" => true,
//   "message" => "Data berhasil dihapus"
// ]);

// $query = mysqli_query($conn, "DELETE FROM product WHERE id='$id'");

// if ($query) {
//   echo json_encode(["status" => "success"]);
// } else {
//   echo json_encode([
//     "status" => "error",
//     "mysql_error" => mysqli_error($conn)
//   ]);
// }
