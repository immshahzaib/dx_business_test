<?php

namespace App\Models\Users;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Results extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = "results";
    protected $fillable = [
        "id", "user_id", "question_id", "answer_id", "result", "deleted_by", "deleted_at", "created_at", "updated_at",
    ];

    protected static function getUserResult($userId){
        $correctAnswers = self::query()
            ->where("user_id", $userId)
            ->where("result", "yes")
            ->groupBy("user_id")
            ->count();
        $wrongAnswers = self::query()
            ->where("user_id", $userId)
            ->where("result", "no")
            ->groupBy("user_id")
            ->count();
        $skipAnswers = self::query()
            ->where("user_id", $userId)
            ->where("result", "skip")
            ->groupBy("user_id")
            ->count();
        return [
            "correctAnswers" => $correctAnswers,
            "wrongAnswers" => $wrongAnswers,
            "skipAnswers" => $skipAnswers,
        ];
    }

    protected static function createResult($data){
        return self::create($data);
    }

    protected static function updateResult($object, $data){
        return $object->update($data);
    }

    protected static function deleteResult($object, $userId){
        $params = [
            'deleted_by' => $userId,
        ];
        if($object->delete()) return $object->update($params);
        return [];
    }
}
