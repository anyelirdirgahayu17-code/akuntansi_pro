<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JournalController;

Route::get('/', function () {
    return redirect('/journals');
});

Route::get('/journals', [JournalController::class, 'index'])->name('journals.index');
Route::get('/journals/create', [JournalController::class, 'create'])->name('journals.create');
Route::delete('/journals/{id}', [JournalController::class, 'destroy'])->name('journals.destroy');