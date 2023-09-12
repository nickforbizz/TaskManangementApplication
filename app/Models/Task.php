<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Task
 * 
 * @property int $id
 * @property string $title
 * @property string $slug
 * @property string $description
 * @property string $priority
 * @property Carbon $due_date
 * @property Carbon $completion_date
 * @property int $assigned_to
 * @property int $created_by
 * @property int $category_id
 * @property string $active
 * @property string $status
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 * @property TaskCategory $task_category
 *
 * @package App\Models
 */
class Task extends Model
{
	use SoftDeletes, HasFactory;
	protected $table = 'tasks';

	protected $casts = [
		'due_date' => 'date',
		'completion_date' => 'date',
		'assigned_to' => 'int',
		'created_by' => 'int',
		'category_id' => 'int',
	];

	protected $fillable = [
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
}
