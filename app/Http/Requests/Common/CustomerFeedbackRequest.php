<?php

namespace App\Http\Requests\Common;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CustomerFeedbackRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $user = auth()->user();
        return $user->hasAnyRole(['superadmin', 'admin']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'title' => [
                'required', 
                'min:2', 
                'max:255',
                Rule::unique('customer_feedback')->ignore($this->customer_feedback ?? null)
            ],
            'content' => 'nullable',
            'fk_user' => 'required:users',
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
            'fk_user' => auth()->id(),
        ]);
    }
}
