<?php

namespace Database\Seeders;

use App\Models\CustomerFeedback;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CustomerFeedbackSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        CustomerFeedback::factory()->count(235)->create();
    }
}
