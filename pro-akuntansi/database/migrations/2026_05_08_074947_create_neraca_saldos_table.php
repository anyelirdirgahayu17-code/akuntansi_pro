<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNeracaSaldosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('neraca_saldos', function (Blueprint $table) {
    $table->id();
    $table->integer('periode_bulan');
    $table->integer('periode_tahun');
    $table->foreignId('perkiraan_id')->constrained('perkiraans');
    $table->decimal('saldo_debit', 15, 2)->default(0);
    $table->decimal('saldo_kredit', 15, 2)->default(0);
    $table->timestamps();

    // Sesuai instruksi Bapak, tambahkan indeks unik
    $table->unique(['periode_bulan', 'periode_tahun', 'perkiraan_id'], 'idx_neraca_unique');
});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('neraca_saldos');
    }
}
