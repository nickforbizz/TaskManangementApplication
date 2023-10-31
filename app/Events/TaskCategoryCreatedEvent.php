<?php

namespace App\Events;

use App\Models\TaskCategory;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class TaskCategoryCreatedEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $task_category;
    
    /**
     * Create a new event instance.
     */
    public function __construct(TaskCategory $task_category)
    {
        $this->task_category = $task_category;
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
