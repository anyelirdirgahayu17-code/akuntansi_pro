<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class JournalController extends Controller
{
    public function index(Request $request)
    {
        // 1. Otomatis buat tabel di database jika belum ada
        if (!Schema::hasTable('journal_entries')) {
            Schema::create('journal_entries', function ($table) {
                $table->id();
                $table->string('transaction_code')->nullable();
                $table->date('date')->nullable();
                $table->text('description')->nullable();
                $table->string('type')->default('Umum');
                $table->timestamps();
            });
        }

        // 2. Simpan data baru jika form dikirimkan
        if ($request->filled('transaction_code')) {
            DB::table('journal_entries')->insert([
                'date'             => $request->date,
                'transaction_code' => $request->transaction_code,
                'description'      => $request->description,
                'type'             => 'Umum',
                'created_at'       => now(),
                'updated_at'       => now(),
            ]);

            return redirect('/journals');
        }

        // 3. Ambil data dari database untuk ditampilkan di tabel
        $journals = DB::table('journal_entries')->get();

        return view('journal', compact('journals'));
    }

    public function create()
    {
        return view('journal_create');
    }

    public function destroy($id)
    {
        // Hapus data berdasarkan ID
        DB::table('journal_entries')->where('id', $id)->delete();

        return redirect('/journals');
    }
}