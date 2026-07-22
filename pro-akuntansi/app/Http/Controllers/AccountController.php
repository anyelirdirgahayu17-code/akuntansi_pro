<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AccountController extends Controller
{
    public function index() {
        $accounts = DB::table('perkiraans')->get();
        return view('perkiraan', ['accounts' => $accounts]);
    }

    public function create() {
        return view('tambah_akun');
    }

    public function store(Request $request) {
        DB::table('perkiraans')->insert([
            'kode' => $request->kode,
            'nama' => $request->nama,
            'jenis' => $request->jenis,
            'saldo_awal' => $request->saldo_awal
        ]);
        return redirect('/accounts');
    }
}