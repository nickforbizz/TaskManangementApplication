<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;

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
            'assigned_to' => 'required:users',
            'priority' => 'required',
            'slug' => [
                'nullable',
                Rule::unique('tasks')->ignore($this->task)
            ],
            'created_by' => 'required:users',
            'completion_date' => 'required',
            'active' => 'required',
            'status' => 'required',
            // 'featuredimg' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'unique' => ':attribute is already used',
            'required' => 'The :attribute field is required.',
        ];
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'slug' => Str::slug($this->input('title')),
            'created_by' => Auth::id(),
        ]);
    }

    public function passedValidation()
    {
        $this->merge([
            'created_by' => Auth::id()
        ]);
    }
}
