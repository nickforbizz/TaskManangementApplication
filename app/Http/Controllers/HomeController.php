<?php

namespace App\Http\Controllers;

use App\Models\CustomerFeedback;
use App\Models\Feed;
use App\Models\Post;
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
            ->get();

        $feeds = Feed::orderBy('created_at', 'desc')
            ->with('user')
            ->take(6)->get();

        $feedbacks = CustomerFeedback::orderBy('created_at', 'desc')
            ->with('user')
            ->take(5)->get();
        // dd($feeds); 

        // counts
        $total_active_users = User::where('active', 1)->count();
        $total_users = User::count();

        $total_active_tasks = Task::where('active', 1)->count();
        $total_completed_tasks = Task::where('active', 1)->where('status', 3)->count();
        $user_tasks = $tasks->count();
        $tasks = $tasks->take(4);

        $total_active_posts = Post::where('active', 1)->count();
        $user_posts = Post::where('active', 1)->where('created_by', auth()->id())->count();

        return view(
            'cms.index',
            compact(
                'data',
                'tasks',
                'feeds',
                'feedbacks',
                'total_active_users',
                'total_users',
                'total_active_tasks',
                'total_completed_tasks',
                'user_tasks',
                'total_active_posts',
                'user_posts'
            )
        );
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
