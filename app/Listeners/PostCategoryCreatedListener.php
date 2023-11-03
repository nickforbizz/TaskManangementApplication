<?php

namespace App\Listeners;

use App\Events\PostCategoryCreatedEvent;
use App\Models\Feed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class PostCategoryCreatedListener
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
    public function handle(PostCategoryCreatedEvent $event): void
    {
        // notification

        // add Feed
        Feed::create([
            'fk_user' => auth()->id(),
            'title' => 'New Post Category: "'.$event->post_category->name.'"',
            'content' => 'Post Category: '.$event->post_category->name.' has been created by '.auth()->user()->email
        ]);
    }
}
