<?php

use App\Events\UserRegistered;
use App\Http\Controllers\cms\AssignRoleController;
use App\Http\Controllers\cms\NotificationController;
use App\Http\Controllers\cms\PermissionController;
use App\Http\Controllers\cms\UserController;
use App\Http\Controllers\cms\PostCategoryController;
use App\Http\Controllers\cms\PostController;
use App\Http\Controllers\cms\ReportController;
use App\Http\Controllers\cms\RoleController;
use App\Http\Controllers\cms\SearchController;
use App\Http\Controllers\cms\TaskCategoryController;
use App\Http\Controllers\cms\TaskController;
use App\Http\Controllers\frontend\ViewsController;
use App\Http\Controllers\HomeController;
use App\Models\User;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/test', function () {
    // $admins = Role::whereIn('name', ['admin', 'superadmin'])
    // ->with('users')->get();
    $users = User::whereHas('roles', function ($query) {
        $query->whereIn('name', ['admin', 'superadmin']);
    })->get();
    return $users;
    // return what you want
});



Route::get('/optimize', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('optimize');
    Artisan::call('storage:link');
    // Artisan::call('composer dump-autoload');
    return response()
            ->json('Done > optimizing', 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
});

Route::get('/flush-perms', function () {
    Artisan::call('permission:cache-reset');
    // return what you want
    return response()
            ->json('Done > permission:cache-reset', 200, ['JSON_PRETTY_PRINT' => JSON_PRETTY_PRINT]);
});

Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');


// Route::get('/', function () {
//     return view('welcome');
// });


// Frontend Views
Route::get('/', [ViewsController::class, 'index'])->name('wellcome');
Route::get('/about', [ViewsController::class, 'about'])->name('about');
Route::get('/blog/{id}', [ViewsController::class, 'getPost'])->name('blog');
Route::get('/blogs', [ViewsController::class, 'posts'])->name('blogs');
Route::prefix('web')->group(function () {

});

// Backend/CMS
Route::middleware('cms')->group(function () {

    Route::get('/home', [HomeController::class, 'cms'])->name('home');
    Route::get('/cms', [HomeController::class, 'cms'])->name('cms');
    Route::get('/search', [SearchController::class, 'search'])->name('search');


    // Downloadable Reports
    Route::get('reports/download/csv', [ReportController::class, 'downloadCsv'])->name('reports.download.csv');



    // Resources Routes
    Route::resources([
        'users' => UserController::class,
        'posts' => PostController::class,
        'postCategories' => PostCategoryController::class,
        'tasks' => TaskController::class,
        'taskCategories' => TaskCategoryController::class,
        'roles' => RoleController::class,
        'permissions' => PermissionController::class,
        // 'assignRoles' => AssignRoleController::class,
        'reports' => ReportController::class,
        'notifications' => NotificationController::class,
    ]);

 

    Route::post('/notifications//mark-as-read', [NotificationController::class, 'markNotification'])->name('notifications.markNotification');
});


