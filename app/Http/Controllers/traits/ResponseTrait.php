<?php


namespace App\Http\Controllers\traits;


trait ResponseTrait
{
    protected static function customJsonMessage($code, $status, $data){
        $msgArray = [
            "code"      => $code,
            "status"    => $status,
            "data"      => $data,
        ];
        return response()->json($msgArray);
    }
}
