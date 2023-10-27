<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use App\Enums\TaskPriority;
use App\Enums\TaskStatus;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Task
 * 
 * @property int $id
 * @property int|null $fk_group
 * @property string $title
 * @property string $slug
 * @property string $description
 * @property int $priority
 * @property Carbon $due_date
 * @property Carbon $completion_date
 * @property int $assigned_to
 * @property int $created_by
 * @property int $category_id
 * @property bool $active
 * @property string $status
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 * @property TaskCategory $task_category
 * @property Group|null $group
 * @property Collection|TaskAttachment[] $task_attachments
 *
 * @package App\Models
 */
class Task extends Model
{
	use SoftDeletes;
	protected $table = 'tasks';

	protected $casts = [
		'fk_group' => 'int',
		'due_date' => 'date',
		'completion_date' => 'date',
		'assigned_to' => 'int',
		'created_by' => 'int',
		'category_id' => 'int',
		'active' => 'bool',
		'status' => TaskStatus::class,
		'priority' => TaskPriority::class,
	];

	protected $fillable = [
		'fk_group',
		'title',
		'slug',
		'description',
		'priority',
		'due_date',
		'completion_date',
		'assigned_to',
		'created_by',
		'category_id',
		'active',
		'status'
	];



	public function user()
	{
		return $this->belongsTo(User::class, 'created_by');
	}

	public function task_category()
	{
		return $this->belongsTo(TaskCategory::class, 'category_id');
	}

	public function group()
	{
		return $this->belongsTo(Group::class, 'fk_group');
	}

	public function task_attachments()
	{
		return $this->hasMany(TaskAttachment::class);
	}
}
