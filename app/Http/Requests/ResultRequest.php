<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ResultRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            "user_id" => 'required|integer',
            "question_id" => 'required|integer',
            "answer_id" => 'required|integer',
        ];
    }

    /**
     * @return array|string[]
     */
    public function messages()
    {
        return [
            "user_id.required" => "User ID is required.",
            "user_id.integer" => "User ID type should be integer.",
            "question_id.required" => "Question is required.",
            "question_id.integer" => "Question type should be integer.",
            "answer_id.required" => "Answer is required.",
            "answer_id.integer" => "Answer type should be integer.",
        ];
    }
}
