<?php

namespace App\Http\Controllers;

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

        return view('cms.index', compact('data'));
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
