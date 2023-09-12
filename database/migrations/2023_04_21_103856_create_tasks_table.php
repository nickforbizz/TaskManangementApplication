<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->text('description');
            $table->string('priority')->default(1)->comment('1.)Low 2.)Medium 3.) High');
            $table->dateTime('due_date')->default (\Carbon\Carbon::now ());
            $table->dateTime('completion_date')->default (\Carbon\Carbon::now ());
            $table->unsignedBigInteger('assigned_to');
            $table->foreign('assigned_to')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedBigInteger('created_by');
            $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedBigInteger('category_id');
            $table->foreign('category_id')->references('id')->on('task_categories')->onDelete('cascade');
            $table->string('active')->default(0);
            $table->string('status')->default(1)->comment('1.)Todo 2.)In Progress 3.) Completed 4.) Revision 5.) Archived ');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
