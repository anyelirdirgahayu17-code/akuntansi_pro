<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Jurnal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- Navbar Merah -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger px-4">
        <a class="navbar-brand fw-bold" href="#">Akuntansi</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active" href="#" data-bs-toggle="dropdown">Transaksi</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="{{ url('/journals') }}">Jurnal Umum</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" data-bs-toggle="dropdown">Data Master</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Data Perkiraan</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" data-bs-toggle="dropdown">Data Master Akademik</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Akademik</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" data-bs-toggle="dropdown">Laporan</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Laporan Keuangan</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" data-bs-toggle="dropdown">Pengaturan</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">User</a></li>
                    </ul>
                </li>
            </ul>
            <div class="dropdown">
                <a class="nav-link dropdown-toggle text-white fw-bold" href="#" data-bs-toggle="dropdown">
                    Anyelir Dirgahayu
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item text-danger" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Konten Utama -->
    <div class="container my-4">
        <h3 class="mb-4">Daftar Transaksi Jurnal</h3>

        <a href="{{ url('/journals/create') }}" class="btn btn-primary mb-3">+ Tambah Transaksi</a>

        <div class="card shadow-sm">
            <div class="card-body p-0">
                <table class="table table-bordered table-striped m-0 align-middle">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 15%;">Tanggal</th>
                            <th style="width: 20%;">Kode</th>
                            <th>Deskripsi</th>
                            <th class="text-center" style="width: 20%;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($journals as $j)
                            <tr>
                                <td>{{ $j->date ? \Carbon\Carbon::parse($j->date)->format('d-M-Y') : '-' }}</td>
                                <td>{{ $j->transaction_code }}</td>
                                <td>{{ $j->description }}</td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-1">
                                        <a href="#" class="btn btn-sm btn-info text-white">Lihat</a>
                                        
                                        <!-- Form Hapus -->
                                        <form action="{{ url('/journals/' . $j->id) }}" method="POST" onsubmit="return confirm('Apakah kamu yakin ingin menghapus data ini?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">Hapus</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-center text-muted py-3">
                                    Belum ada data transaksi jurnal. Silakan klik tombol <b>+ Tambah Transaksi</b>.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Script Bootstrap JS agar Dropdown & Tombol Berjalan -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>