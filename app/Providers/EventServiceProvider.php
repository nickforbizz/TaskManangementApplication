<?php

namespace App\Providers;

use App\Events\PostCategoryCreatedEvent;
use App\Events\PostCreatedEvent;
use App\Events\TaskCategoryCreatedEvent;
use App\Events\TaskCreatedEvent;
use App\Listeners\PostCategoryCreatedListener;
use App\Listeners\PostCreatedListener;
use App\Listeners\SendWelcomeEmail;
use App\Listeners\TaskCategoryCreatedListener;
use App\Listeners\TaskCreatedListener;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [SendEmailVerificationNotification::class],
        UserRegistered::class =>  [SendWelcomeEmail::class],
        PostCategoryCreatedEvent::class =>  [PostCategoryCreatedListener::class],
        PostCreatedEvent::class =>  [PostCreatedListener::class],
        TaskCategoryCreatedEvent::class =>  [TaskCategoryCreatedListener::class],
        TaskCreatedEvent::class =>  [TaskCreatedListener::class],
    ];

    /**
     * Register any events for your application.
     */
    public function boot(): void
    {
        // Event::listen(
        //     UserRegistered::class,
        //     [SendWelcomeEmail::class, 'handle']
        // );
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     */
    public function shouldDiscoverEvents(): bool
    {
        return true;
    }
}
