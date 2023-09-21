<?php

namespace App\Events;

use App\Models\Task;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class TaskUpserted
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $task;
    public $new_task;
    public $updated_assignee;
    public $updated_priority;
    public $updated_status;

    /**
     * Create event instance for TaskUpserted
     *
     * @param  Task   $task
     * @param  [bool] $new_task
     * @param  [type] $updated_assignee
     * @param  [type] $updated_priority
     * @param  [type] $updated_status
     */
    public function __construct(Task $task, $new_task, $updated_assignee, $updated_priority, $updated_status)
    {
        $this->task = $task;
        $this->new_task = $new_task;
        $this->updated_assignee = $updated_assignee;
        $this->updated_priority = $updated_priority;
        $this->updated_status = $updated_status;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    public function broadcastOn(): array
    {
        return [
            new PrivateChannel('channel-name'),
        ];
    }
}
