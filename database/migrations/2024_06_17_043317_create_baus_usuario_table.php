<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('baus_usuario', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('user_id');
        $table->unsignedInteger('bau_id');
        $table->boolean('aberto')->default(false);
        $table->timestamps();

        $table->foreign('user_id')->references('id')->on('users');
    });
}

};
