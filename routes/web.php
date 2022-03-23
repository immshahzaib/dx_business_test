<?php

use App\Http\Controllers\Admin\AnswersController;
use App\Http\Controllers\Admin\QuestionsController;
use App\Http\Controllers\Users\ResultsController;
use App\Http\Controllers\Users\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::resource("question", QuestionsController::class);
Route::resource("answer", AnswersController::class);
Route::resource("test", ResultsController::class);
Route::post("question-test", [ResultsController::class, 'getQuestionForTest']);
Route::post("get-user-result", [ResultsController::class, 'getUserResult']);

Route::post("user", [UserController::class, 'store']);
