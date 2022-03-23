<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Questions extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = "questions";
    protected $fillable = [
        "id", "title", "deleted_by", "deleted_at", "created_at", "updated_at",
    ];

    protected static function getIdAndTitleList(){
        return self::query()
            ->select('id','title')
            ->whereNull("deleted_at")
            ->get();
    }

    protected static function getQuestionForTest($limit, $id){
        return self::query()
            ->select('id','title')
            ->with("answers")
            ->whereNull("deleted_at")
            ->take($limit)
            ->skip($id)
            ->get();
    }

    protected static function createQuestion($data){
        return self::create($data);
    }

    protected static function updateQuestion($id, $data){
        $object = self::find($id);
        return $object->update($data);
    }

    public function answers(){
        return $this->hasMany('App\Models\Admin\Answers', 'question_id', 'id');
    }
}
