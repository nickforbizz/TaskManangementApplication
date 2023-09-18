<?php

namespace App\Listeners;

use App\Events\TaskCreated;
use App\Notifications\NewTaskNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendTaskCreatedNotification
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
    public function handle(TaskCreated $event): void
    {
        $user = $event->task->user; // Assuming there's a user associated with the task
        $user->notify(new NewTaskNotification($event->task));
    }
}
