<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AnswerRequest extends FormRequest
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
            "question_id" => 'required|integer',
            "title" => 'required|string|max:200',
            "is_right" => 'required|string',
        ];
    }

    /**
     * @return array|string[]
     */
    public function messages()
    {
        return [
            "title.required" => "Title is required.",
            "title.max" => "Title length should not greater than 200.",
            "title.unique" => "Title already exist. Try with an other name.",
            "title.string" => "Title type should be text.",
            "is_right.required" => "Is-Right is required.",
            "is_right.string" => "Is-Right type should be text.",
            "question_id.required" => "Question is required.",
            "question_id.integer" => "Question type should be integer.",
        ];
    }
}
