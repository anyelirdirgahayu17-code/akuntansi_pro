<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSaldoAkunsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::create('saldo_akuns', function (Blueprint $table) {
    $table->id();
    $table->foreignId('perkiraan_id')->constrained('perkiraans');
    $table->integer('tahun');
    $table->integer('bulan');
    $table->decimal('saldo_awal', 15, 2)->default(0);
    $table->decimal('debit', 15, 2)->default(0);
    $table->decimal('kredit', 15, 2)->default(0);
    $table->decimal('saldo_akhir', 15, 2)->default(0);
    $table->timestamps();

    // Menambahkan indeks unik supaya satu akun cuma punya satu catatan per bulan/tahun
    $table->unique(['perkiraan_id', 'tahun', 'bulan']);
});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('saldo_akuns');
    }
}
