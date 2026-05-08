<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFakturPembeliansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faktur_pembelians', function (Blueprint $table) {
    $table->id();
    $table->string('no_faktur', 20)->unique();
    $table->date('tanggal');
    $table->foreignId('pemasok_id')->constrained('pemasoks');
    $table->decimal('subtotal', 15, 2)->default(0);
    $table->decimal('diskon', 15, 2)->default(0);
    $table->decimal('ppn', 15, 2)->default(0);
    $table->decimal('total', 15, 2)->default(0);
    $table->enum('status', ['Draft', 'Final', 'Void']);
    $table->enum('status_bayar', ['Belum Lunas', 'Sebagian', 'Lunas']);
    $table->date('jatuh_tempo');
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
        Schema::dropIfExists('faktur_pembelians');
    }
}
