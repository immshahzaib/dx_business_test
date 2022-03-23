<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\traits\ResponseTrait;
use App\Http\Requests\QuestionRequest;
use App\Models\Admin\Questions;
use Illuminate\Http\Request;

class QuestionsController extends Controller
{
    use ResponseTrait;

    public function index()
    {
        $questions = Questions::getIdAndTitleList();
        return self::customJsonMessage(0, "Success", $questions);
    }


    public function create()
    {
        return view("pages.admin.question.create");
    }


    public function store(QuestionRequest $request)
    {
        $validated = $request->validated();
        if($validated) {
            try {
                $params = $request->only( "title");
                $createData = Questions::createQuestion($params);
                if( $createData ) return self::customJsonMessage(0, "Success", "Question successfully created!..");
                else return self::customJsonMessage(1, "Error", "Question not created. Please contact Administrator.");
            }
            catch (\Exception $e){
                return self::customJsonMessage(1, "Error", $e->getMessage());
            }
        }
    }


    public function show($id)
    {
        //
    }


    public function edit($id)
    {
        //
    }


    public function update(QuestionRequest $request, $id)
    {
        //
    }


    public function destroy($id)
    {
        //
    }
}
