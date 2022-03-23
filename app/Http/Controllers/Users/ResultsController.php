<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Http\Controllers\traits\ResponseTrait;
use App\Http\Requests\ResultRequest;
use App\Models\Admin\Answers;
use App\Models\Admin\Questions;
use App\Models\User;
use App\Models\Users\Results;
use Illuminate\Http\Request;

class ResultsController extends Controller
{
    use ResponseTrait;

    public function index()
    {
        //
    }

    public function getQuestionForTest(Request $request){
        $id = $request->get("id");
        $limit = $request->get("limit");
        $getQuestionWithAnswers = Questions::getQuestionForTest($limit, $id);
        return self::customJsonMessage(0, "Success", $getQuestionWithAnswers);
    }

    public function create()
    {
        return view("pages.users.test.create");
    }

    public function getUserResult(Request $request)
    {
        try {
            $params = $request->get( "user_id");
            $createData = Results::getUserResult($params);
            if( $createData ) return self::customJsonMessage(0, "Success", $createData);
            else return self::customJsonMessage(1, "Error", "Answer not saved. Please try again.");
        }
        catch (\Exception $e){
            return self::customJsonMessage(1, "Error", $e->getMessage());
        }

    }

    public function store(ResultRequest $request)
    {
        $validated = $request->validated();
        if($validated) {
            try {
                $params = $request->only( "user_id", "question_id", "answer_id");
                $answerId = $params["answer_id"];
                $questionId = $params["question_id"];
                if($request->get("attend_type") == "answer") {
                    $getRowAnswer = Answers::checkRightAnswer($answerId, $questionId);
                    $params["result"] = $getRowAnswer->is_right;
                } else {
                    $params["result"] = "skip";
                }
                $createData = Results::createResult($params);
                if( $createData ) return self::customJsonMessage(0, "Success", $createData);
                else return self::customJsonMessage(1, "Error", "Answer not saved. Please try again.");
            }
            catch (\Exception $e){
                return self::customJsonMessage(1, "Error", $e->getMessage());
            }
        }
    }

    public function show(Results $results)
    {
        //
    }

    public function edit(Results $results)
    {
        //
    }

    public function update(Request $request, Results $results)
    {
        //
    }

    public function destroy(Results $results)
    {
        //
    }
}
