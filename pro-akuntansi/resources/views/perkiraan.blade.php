<!DOCTYPE html>
<html>
<head>
    <title>Data Perkiraan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="p-5" style="background-color: #f8f9fa;">
    <div class="container">
        <div class="card shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Data Perkiraan (Chart of Accounts) - Anya</h4>
                <a href="/accounts/create" class="btn btn-light btn-sm"><i class="fa fa-plus"></i> Tambah Akun Baru</a>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped text-center align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Kode</th>
                            <th>Nama Akun</th>
                            <th>Posisi Normal</th>
                            <th>Debit</th>
                            <th>Kredit</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($accounts as $a)
                        <tr>
                            <td>{{ $a->kode }}</td>
                            <td>{{ $a->nama }}</td>
                            <td><span class="badge bg-info text-dark">{{ $a->jenis }}</span></td>
                            <td class="text-end">{{ str_contains($a->jenis, 'Aktiva') || str_contains($a->jenis, 'Beban') ? number_format($a->saldo_awal, 2) : '-' }}</td>
                            <td class="text-end">{{ str_contains($a->jenis, 'Kewajiban') || str_contains($a->jenis, 'Pendapatan') || str_contains($a->jenis, 'Modal') ? number_format($a->saldo_awal, 2) : '-' }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>