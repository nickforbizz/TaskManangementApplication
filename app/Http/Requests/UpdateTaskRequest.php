<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateTaskRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $user = auth()->user();
        return $user->hasAnyRole(['admin', 'superadmin']) ||  $this->created_by == auth()->id();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|min:2',
            'description' => 'required|min:5',
            'category_id' => 'required',
            'due_date' => 'required',
            'completion_date' => 'required',
            'assigned_to' => 'required:users',
            'assigned_to' => 'required:users',
            'priority' => 'required',
            // 'featuredimg' => 'required',
            'slug' => [
                'nullable',
                Rule::unique('tasks')->ignore($this->task)
            ]
        ];
    }

    public function messages()
    {
        return [
            'unique' => ':attribute is already used',
            'required' => 'The :attribute field is required.',
        ];
    }
}
