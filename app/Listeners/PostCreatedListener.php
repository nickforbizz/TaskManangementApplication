<?php

namespace App\Listeners;

use App\Events\PostCreatedEvent;
use App\Models\Feed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class PostCreatedListener
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
    public function handle(PostCreatedEvent $event): void
    {
        // notification

        // add Feed
        Feed::create([
            'fk_user' => auth()->id(),
            'title' => 'New Post: "'.$event->post->title.'"',
            'content' => 'Post '.$event->post->title.' has been created by '.auth()->user()->email
        ]);
    }
}
