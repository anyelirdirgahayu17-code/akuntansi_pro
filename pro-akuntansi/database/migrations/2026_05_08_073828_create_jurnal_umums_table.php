<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJurnalUmumsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
    
    Schema::create('jurnal_umums', function (Blueprint $table) {
    $table->id();
    $table->string('no_jurnal', 20)->unique();
    $table->date('tanggal');
    $table->text('deskripsi');
    $table->enum('tipe', ['Umum', 'Penyesuaian', 'Penutup']);
    $table->enum('status', ['Draft', 'Posted']);
    $table->foreignId('created_by')->constrained('users'); // Ini menghubungkan ke tabel user kamu
    $table->timestamp('posted_at')->nullable();
    $table->text('keterangan')->nullable();
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
        Schema::dropIfExists('jurnal_umums');
    }
}
