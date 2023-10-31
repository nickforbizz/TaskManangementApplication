<?php

namespace App\Events;

use App\Models\PostCategory;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class PostCategoryCreatedEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $post_category;
    
    /**
     * Create a new event instance.
     */
    public function __construct(PostCategory $post_category)
    {
        $this->post_category = $post_category;
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
