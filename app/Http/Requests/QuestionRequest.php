<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class QuestionRequest extends FormRequest
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
            "title" => 'required|string|max:200|unique:questions,title,'.$this->route("question").',id',
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
        ];
    }
}
