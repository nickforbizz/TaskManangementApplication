<?php

namespace App\Listeners;

use App\Events\TaskCreatedEvent;
use App\Models\Feed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class TaskCreatedListener
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
    public function handle(TaskCreatedEvent $event): void
    {
        // notification

        // add Feed
        Feed::create([
            'fk_user' => auth()->id(),
            'title' => 'New Task Created',
            'content' => 'Task '.$event->task->title.' has been created by '.auth()->user()->email
        ]);
    }
}
