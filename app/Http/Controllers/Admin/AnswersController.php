<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\traits\ResponseTrait;
use App\Http\Requests\AnswerRequest;
use App\Models\Admin\Answers;
use Illuminate\Http\Request;

class AnswersController extends Controller
{
    use ResponseTrait;

    public function index()
    {
        //
    }


    public function create()
    {
        return view("pages.admin.answers.create");
    }


    public function store(AnswerRequest $request)
    {
        $validated = $request->validated();
        if($validated) {
            try {
                $params = $request->only( "question_id", "title", "is_right");
                $createData = Answers::createAnswer($params);
                if( $createData ) return self::customJsonMessage(0, "Success", "Answer successfully created!..");
                else return self::customJsonMessage(1, "Error", "Answer not created. Please contact Administrator.");
            }
            catch (\Exception $e){
                return self::customJsonMessage(1, "Error", $e->getMessage());
            }
        }
    }


    public function show(Answers $answers)
    {
        //
    }


    public function edit(Answers $answers)
    {
        //
    }


    public function update(Request $request, Answers $answers)
    {
        //
    }


    public function destroy(Answers $answers)
    {
        //
    }
}
