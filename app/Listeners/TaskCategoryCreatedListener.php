<?php

namespace App\Listeners;

use App\Events\TaskCategoryCreatedEvent;
use App\Models\Feed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class TaskCategoryCreatedListener
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(TaskCategoryCreatedEvent $event): void
    {
        // notification

        // add Feed
        Feed::create([
            'fk_user' => auth()->id(),
            'title' => 'New Task Category Created',
            'content' => 'Task Category: '.$event->task_category->name.' has been created by '.auth()->user()->email
        ]);
    }
}
