<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Http\Controllers\traits\ResponseTrait;
use App\Http\Requests\QuestionRequest;
use App\Http\Requests\UserRequest;
use App\Models\Admin\Questions;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    use ResponseTrait;

    public function store(UserRequest $request)
    {
        $validated = $request->validated();
        if($validated) {
            try {
                $params = $request->only( "name");
                $createData = User::createUser($params);
                if( $createData ) return self::customJsonMessage(0, "Success", $createData);
                else return self::customJsonMessage(1, "Error", "User not created. Please contact Administrator.");
            }
            catch (\Exception $e){
                return self::customJsonMessage(1, "Error", $e->getMessage());
            }
        }
    }
}
