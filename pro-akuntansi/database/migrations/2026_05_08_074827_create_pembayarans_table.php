<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePembayaransTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pembayarans', function (Blueprint $table) {
    $table->id();
    $table->string('no_pembayaran', 20)->unique();
    $table->date('tanggal');
    $table->enum('tipe', ['Masuk', 'Keluar']);
    $table->enum('sumber', ['Penjualan', 'Pembelian', 'Lainnya']);
    $table->unsignedBigInteger('sumber_id')->nullable();
    $table->string('sumber_type', 50)->nullable();
    $table->foreignId('pelanggan_id')->nullable()->constrained('pelanggans');
    $table->foreignId('pemasok_id')->nullable()->constrained('pemasoks');
    $table->decimal('jumlah', 15, 2)->default(0);
    $table->enum('metode', ['Tunai', 'Transfer', 'Cek']);
    $table->string('no_referensi', 50)->nullable();
    $table->text('keterangan')->nullable();
    $table->foreignId('jurnal_id')->nullable()->constrained('jurnal_umums');
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
        Schema::dropIfExists('pembayarans');
    }
}
