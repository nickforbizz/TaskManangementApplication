<?php

namespace App\Listeners;

use App\Events\TaskUpserted;
use App\Models\User;
use App\Notifications\NewTaskNotification;
use App\Notifications\TaskAssigneeNotification;
use App\Notifications\TaskPriorityNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Notification;

class SendTaskUpsertedNotification
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
    public function handle(TaskUpserted $event): void
    {
        $task = $event->task;
        $new_task = $event->new_task;
        $updated_assignee = $event->updated_assignee;
        $updated_priority = $event->updated_priority;
        $admins = User::whereHas('roles', function ($query) {
            $query->whereIn('name', ['admin', 'superadmin']);
        })->get();

        $assignee = User::find($task->assigned_to);
        
        // send a notification to admins
        if ($new_task) {
            Notification::send($admins, new NewTaskNotification($task));
        }
        
        if ($updated_assignee) {
            $event->task->assignee->notify(new TaskAssigneeNotification($task));
            // Notification::send($admins, new NewTaskNotification($task, "Task number {$task->id} has been assigned to {$assignee->email}"));
        }
        
        if ($updated_priority) {
            $assignee->notify(new TaskPriorityNotification($task));
            // Notification::send($admins, new NewTaskNotification($task, "Priority for task number {$task->id} assigned to {$assignee->email} has changed to ".$task->priority->getLabelText()));
        }
    }
}
