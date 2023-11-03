<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\CustomerFeedback>
 */
class CustomerFeedbackFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $users = User::all();
        $name = $this->faker->word;

        return [
            'title' => $name,
            'content' => $this->faker->sentence,
            'status' => $this->faker->randomElement([1,2,3,4,5]),
            'active' => $this->faker->randomElement([1,0]),
            'fk_user' => $this->faker->randomElement($users)
        ];
    }
}
