<!DOCTYPE html>
<html>
<head>
    <title>Tambah Akun</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-5">
    <div class="container" style="max-width: 500px;">
        <div class="card shadow">
            <div class="card-header bg-success text-white"><h4>Tambah Akun Baru</h4></div>
            <div class="card-body">
                <form action="/accounts/store" method="POST">
                    @csrf
                    <div class="mb-3"><label>Kode</label><input type="text" name="kode" class="form-control" required></div>
                    <div class="mb-3"><label>Nama Akun</label><input type="text" name="nama" class="form-control" required></div>
                    <div class="mb-3"><label>Jenis</label>
                        <select name="jenis" class="form-control">
                            <option value="Aktiva Lancar">Aktiva Lancar</option>
                            <option value="Kewajiban">Kewajiban</option>
                            <option value="Pendapatan">Pendapatan</option>
                        </select>
                    </div>
                    <div class="mb-3"><label>Saldo Awal</label><input type="number" name="saldo_awal" class="form-control" value="0"></div>
                    <button type="submit" class="btn btn-primary w-100">Simpan Akun</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>