<?php

namespace App\Exports;

use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class EntityReportExport implements FromCollection, WithHeadings, WithTitle
{
    protected $data, $type;

    public function __construct($data, $type)
    {
        $this->data = $data;
        $this->type = $type;
    }

    public function collection()
    {
        $chartData = [];
        foreach ($this->data as $row) {
            $month = Carbon::create(null, $row->month)->format('F');
            $chartData[$month . '-'. $row->year] = $row->count;
        }
        return collect($this->data)->map(function ($item) {
            $item->month = Carbon::create(null, $item->month)->format('F');
            return $item;
        });
    }

    public function headings(): array
    {
        return [
            'Month',
            'Year',
            'Count',
        ];
    }

    public function title(): string
    {
        return ucwords($this->type).' Report';
    }
}

