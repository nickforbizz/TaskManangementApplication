<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Group
 * 
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|Notification[] $notifications
 * @property Collection|PostCategory[] $post_categories
 * @property Collection|Post[] $posts
 * @property Collection|TaskCategory[] $task_categories
 * @property Collection|Task[] $tasks
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Group extends Model
{
	use SoftDeletes;
	protected $table = 'groups';

	protected $fillable = [
		'name',
		'description'
	];

	public function notifications()
	{
		return $this->hasMany(Notification::class, 'fk_group');
	}

	public function post_categories()
	{
		return $this->hasMany(PostCategory::class, 'fk_group');
	}

	public function posts()
	{
		return $this->hasMany(Post::class, 'fk_group');
	}

	public function task_categories()
	{
		return $this->hasMany(TaskCategory::class, 'fk_group');
	}

	public function tasks()
	{
		return $this->hasMany(Task::class, 'fk_group');
	}

	public function users()
	{
		return $this->belongsToMany(User::class, 'user_group')
					->withPivot('id')
					->withTimestamps();
	}
}
