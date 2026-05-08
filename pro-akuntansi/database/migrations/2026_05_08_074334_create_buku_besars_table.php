<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBukuBesarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buku_besars', function (Blueprint $table) {
    $table->id();
    $table->foreignId('perkiraan_id')->constrained('perkiraans');
    $table->date('tanggal');
    $table->string('no_ref', 50)->nullable();
    $table->text('deskripsi')->nullable();
    $table->decimal('debit', 15, 2)->default(0);
    $table->decimal('kredit', 15, 2)->default(0);
    $table->decimal('saldo', 15, 2)->default(0);
    $table->foreignId('jurnal_detail_id')->constrained('jurnal_details');
    $table->enum('posisi', ['Debit', 'Kredit']);
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
        Schema::dropIfExists('buku_besars');
    }
}
