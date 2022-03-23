<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Answers extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = "answers";
    protected $fillable = [
        "id", "question_id", "title", "is_right", "deleted_by", "deleted_at", "created_at", "updated_at",
    ];

    protected static function checkRightAnswer($id, $questionId){
        return self::query()
            ->select("id", "question_id", "title", "is_right")
            ->where("id", $id)
            ->where("question_id", $questionId)
            ->whereNull("deleted_at")
            ->first();
    }

    protected static function createAnswer($data){
        return self::create($data);
    }

    protected static function updateAnswer($object, $data){
        return $object->update($data);
    }
}
