<?php

namespace App\Http\Controllers\cms;

use App\Exports\EntityReportExport;
use App\Http\Controllers\Controller;
use App\Models\Feed;
use App\Models\Post;
use App\Models\Task;
use App\Models\User;
use App\Services\ReportService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;

class ReportController extends Controller
{
    public function index(Request $request, ReportService $reportService)
    {
        $selectedYear = $request->get('year', Carbon::now()->year);

        try {
            $tasks_report = $reportService->getCountByMonth(new Task, $selectedYear);
            $feeds_report = $reportService->getCountByMonth(new Feed, $selectedYear);
            $posts_report = $reportService->getCountByMonth(new Post, $selectedYear);
            $users_report = $reportService->getCountByMonth(new User, $selectedYear);
        } catch (\Throwable $th) {
            throw $th;
        }

        return view('cms.reports.index', [
            'tasksChartData' => $tasks_report['chartData'],
            'tasksYears' => $tasks_report['years'],
            'feedsChartData' => $feeds_report['chartData'],
            'feedsYears' => $feeds_report['years'],
            'postsChartData' => $posts_report['chartData'],
            'postsYears' => $posts_report['years'],
            'usersChartData' => $users_report['chartData'],
            'usersYears' => $users_report['years'],
            'selectedYear' => $selectedYear
        ]);
    }


    public function downloadCsv(Request $request, $type)
    {
        $model = ucwords($type);
        $model = "App\\Models\\$model";
        $year = request('year', Carbon::now()->year);
        $data = $model::select(DB::raw('MONTH(created_at) as month'), DB::raw('YEAR(created_at) as year'), DB::raw('COUNT(*) as count'))
            ->whereYear('created_at', $year)
            ->groupBy('year','month')
            ->get();



        

        $fileName = $type.'_report_' . $year;

        
        // :TODO refactor the function, return custom headers
        
        // dd($data);
        $export = new EntityReportExport($data, $type);

        return Excel::download($export, $fileName . '.xlsx');
    }


    public function generateReport(Request $request, ReportService $reportService)
    {
        $selectedYear = $request->get('year', Carbon::now()->year);
        $type = $request->get('type');

        if ($type == 'task') {
            return $reportService->getCountByMonth(new Task, $selectedYear);
        }

        if ($type == 'feed') {
            return $reportService->getCountByMonth(new Feed, $selectedYear);
        }

        if ($type == 'post') {
            return $reportService->getCountByMonth(new Post, $selectedYear);
        }

        if ($type == 'user') {
            return $reportService->getCountByMonth(new User, $selectedYear);
        }

        return $request;
    }
}
