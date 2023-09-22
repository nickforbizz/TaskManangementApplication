<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;

class StoreTaskCategoryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $user = auth()->user();
        return $user->hasAnyRole(['admin', 'superadmin']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => [
                'required', 
                'min:2', 
                'max:255',
                Rule::unique('task_categories')
            ],
            'description' => 'nullable',
            'created_by' => 'required:users',
            'slug' => 'unique:task_categories,slug',
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
            'slug' => Str::slug($this->input('name')),
            'created_by' => Auth::id(),
        ]);
    }


    public function passedValidation()
    {
        $this->merge([
            'slug' => Str::slug($this->input('name')),
            'created_by' => Auth::id()
        ]);
    }
}
