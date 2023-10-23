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
 * Class TaskCategory
 * 
 * @property int $id
 * @property int|null $fk_group
 * @property string $name
 * @property string $slug
 * @property string|null $description
 * @property int $created_by
 * @property string $active
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 * @property Group|null $group
 * @property Collection|Task[] $tasks
 *
 * @package App\Models
 */
class TaskCategory extends Model
{
	use SoftDeletes;
	protected $table = 'task_categories';

	protected $casts = [
		'fk_group' => 'int',
		'created_by' => 'int'
	];

	protected $fillable = [
		'fk_group',
		'name',
		'slug',
		'description',
		'created_by',
		'active'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'created_by');
	}

	public function group()
	{
		return $this->belongsTo(Group::class, 'fk_group');
	}

	public function tasks()
	{
		return $this->hasMany(Task::class, 'category_id');
	}
}
