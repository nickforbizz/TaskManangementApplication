<?php

namespace App\Listeners;

use App\Events\UserRegistered;
use App\Models\Feed;
use App\Models\User;
use App\Notifications\NewUserNotification;
use App\Notifications\WelcomeEmailNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Notification;

class SendWelcomeEmail
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
    public function handle(UserRegistered $event): void
    {
        $event->user->notify(new WelcomeEmailNotification());

        // send a notification to admins
        $admins = User::whereHas('roles', function ($query) {
            $query->whereIn('name', ['admin', 'superadmin']);
        })->get();

        Notification::send($admins, new NewUserNotification($event->user));

        // add Feed
        Feed::create([
            'fk_user' => auth()->id(),
            'title' => 'User Registration',
            'content' => 'User '.$event->user->email.' has been registered to the application by '.auth()->user()->email
        ]);
    }
}
