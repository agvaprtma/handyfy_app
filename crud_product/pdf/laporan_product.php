<?php
require_once '../tcpdf/tcpdf.php';
include "../koneksi.php";


$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetCreator('CRUD Product');
$pdf->SetAuthor('Admin');
$pdf->SetTitle('Laporan Product');
$pdf->SetMargins(10, 10, 10);
$pdf->SetAutoPageBreak(true, 10);
$pdf->AddPage();


$pdf->SetFont('helvetica', 'B', 14);
$pdf->Cell(190, 8, 'LAPORAN DATA PRODUCT HANDPHONE', 0, 1, 'C');
$pdf->Ln(2);


$pdf->SetFont('helvetica', 'B', 9);


$w_no   = 10;
$w_foto = 28;
$w_nama = 38;
$w_merk = 28;
$w_harga = 28;
$w_desc = 58;


$pdf->SetFillColor(230, 230, 230);

$pdf->Cell($w_no,   8, 'No', 1, 0, 'C', true);
$pdf->Cell($w_foto, 8, 'Foto', 1, 0, 'C', true);
$pdf->Cell($w_nama, 8, 'Nama', 1, 0, 'C', true);
$pdf->Cell($w_merk, 8, 'Merk', 1, 0, 'C', true);
$pdf->Cell($w_harga, 8, 'Harga', 1, 0, 'C', true);
$pdf->Cell($w_desc, 8, 'Deskripsi', 1, 1, 'C', true);


$pdf->SetFont('helvetica', '', 9);

$query = mysqli_query($conn, "SELECT * FROM product ORDER BY id DESC");
$no = 1;

while ($row = mysqli_fetch_assoc($query)) {


  $lineHeight = 5;

  $h_nama = $pdf->getStringHeight($w_nama, $row['nama']);
  $h_merk = $pdf->getStringHeight($w_merk, $row['merk']);
  $h_desc = $pdf->getStringHeight($w_desc, $row['deskripsi']);


  $rowHeight = max($h_nama, $h_merk, $h_desc, 22);


  if ($pdf->GetY() + $rowHeight > $pdf->getPageHeight() - 15) {
    $pdf->AddPage();


    $pdf->SetFont('helvetica', 'B', 9);
    $pdf->SetFillColor(230, 230, 230);
    $pdf->Cell($w_no,   8, 'No', 1, 0, 'C', true);
    $pdf->Cell($w_foto, 8, 'Foto', 1, 0, 'C', true);
    $pdf->Cell($w_nama, 8, 'Nama', 1, 0, 'C', true);
    $pdf->Cell($w_merk, 8, 'Merk', 1, 0, 'C', true);
    $pdf->Cell($w_harga, 8, 'Harga', 1, 0, 'C', true);
    $pdf->Cell($w_desc, 8, 'Deskripsi', 1, 1, 'C', true);
    $pdf->SetFont('helvetica', '', 9);
  }

  $y = $pdf->GetY();


  $pdf->MultiCell($w_no, $rowHeight, $no++, 1, 'C', false, 0);


  $x_foto = $pdf->GetX();
  $y_foto = $pdf->GetY();
  $pdf->Cell($w_foto, $rowHeight, '', 1, 0, 'C');

  $fotoPath = __DIR__ . '/../foto/' . $row['foto'];
  if (!empty($row['foto']) && file_exists($fotoPath)) {
    $pdf->Image(realpath($fotoPath), $x_foto + 4, $y_foto + 3, 18, 18);
  }


  $pdf->MultiCell($w_nama, $rowHeight, $row['nama'], 1, 'L', false, 0);


  $pdf->MultiCell($w_merk, $rowHeight, $row['merk'], 1, 'L', false, 0);


  $harga = 'Rp ' . number_format($row['harga'], 0, ',', '.');
  $pdf->MultiCell($w_harga, $rowHeight, $harga, 1, 'L', false, 0);


  $pdf->MultiCell($w_desc, $rowHeight, $row['deskripsi'], 1, 'L', false, 1);
}


$pdf->setFooterFont(['helvetica', '', 8]);
$pdf->setPrintFooter(true);


$pdf->Output('laporan_product.pdf', 'I');
