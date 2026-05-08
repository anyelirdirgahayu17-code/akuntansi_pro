<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLaporanKeuangansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('laporan_keuangans', function (Blueprint $table) {
    $table->id();
    $table->enum('tipe', ['Neraca', 'Laba Rugi', 'Arus Kas', 'Perubahan Modal']);
    $table->integer('periode_bulan');
    $table->integer('periode_tahun');
    $table->json('data'); // Untuk menyimpan data laporan yang kompleks
    $table->datetime('generated_at');
    $table->foreignId('generated_by')->constrained('users');
    $table->timestamps();
});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('laporan_keuangans');
    }
}
