<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Transaksi Jurnal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">
    <div class="container bg-white p-4 rounded shadow-sm" style="max-width: 600px;">
        <h3 class="mb-4 text-danger">Tambah Transaksi Jurnal</h3>

        <form action="{{ url('/journals') }}" method="GET">
            <div class="mb-3">
                <label class="form-label">Tanggal</label>
                <input type="date" class="form-control" name="date" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Kode Transaksi</label>
                <input type="text" class="form-control" name="transaction_code" placeholder="JU-0001" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Deskripsi / Keterangan</label>
                <textarea class="form-control" name="description" rows="3" required></textarea>
            </div>
            <div class="d-flex justify-content-between">
                <a href="{{ url('/journals') }}" class="btn btn-secondary">Kembali</a>
                <button type="submit" class="btn btn-danger">Simpan Transaksi</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>