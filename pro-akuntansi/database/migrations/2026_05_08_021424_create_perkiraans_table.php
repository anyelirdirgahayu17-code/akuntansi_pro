<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePerkiraansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('perkiraans', function (Blueprint $table) {
            $table->id();
            $table->string('kode', 20)->unique();
            $table->string('nama', 100);
            $table->enum('jenis', [
                'Aktiva Lancar', 'Aktiva Tetap', 'Kewajiban Lancar', 
                'Kewajiban Jangka Panjang', 'Ekuitas', 'Pendapatan', 
                'Beban Pokok', 'Beban Operasional', 'Beban Lain-lain'
            ]);
            $table->string('kelompok', 50)->nullable();
            $table->enum('saldo_normal', ['Debit', 'Kredit']);
            $table->boolean('is_header')->default(false);
            $table->boolean('is_active')->default(true);
            $table->decimal('saldo_awal', 15, 2)->default(0);
            $table->text('deskripsi')->nullable();
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
        Schema::dropIfExists('perkiraans');
    }
}
