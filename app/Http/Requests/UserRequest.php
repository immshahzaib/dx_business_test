<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
            "name" => 'required|string|max:200|unique:users,name,'.$this->route("user").',id',
        ];
    }

    /**
     * @return array|string[]
     */
    public function messages()
    {
        return [
            "name.required" => "User Name is required.",
            "name.max" => "User Name length should not greater than 200.",
            "name.unique" => "User Name already exist. Try with an other name.",
            "name.string" => "User Name type should be text.",
        ];
    }
}
