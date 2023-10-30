<?php

namespace App\Http\Controllers;

use App\Models\Feed;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        Cache::put('name', auth()->user(), 1000);
        dd(
            Cache::get('name')
        );
        return view('home');
    }


    /**
     * Show the application cms.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function cms()
    {
        $data = $this->userStatistics();
        $tasks = Task::orderBy('created_at', 'desc')
                        ->with('task_category')->where('assigned_to', auth()->id())
                        ->orWhere('created_by', auth()->id())
                        ->take(4)->get();
        $feeds = Feed::orderBy('created_at', 'desc')
                        ->with('user')
                        ->take(6)->get();
                        // dd($feeds);
        return view('cms.index', compact('data', 'tasks', 'feeds'));
    }

    /**
     * Get User Statistics
     *
     * @return void
     */
    protected function userStatistics()
    {
        $data = User::select(DB::raw('DATE(created_at) as date'), DB::raw('count(*) as user_count'))
            ->groupBy('date')
            ->get();

        return $data;
    }
}
