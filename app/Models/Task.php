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
 * Class task
 * 
 * @property int $id
 * @property string $title
 * @property string $slug
 * @property string $description
 * @property string $price
 * @property string $quantity
 * @property string $color
 * @property string $size
 * @property string $label
 * @property string $photo
 * @property int $created_by
 * @property int $category_id
 * @property string $active
 * @property string $status
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property TaskCategory $task_category
 * @property User $user
 *
 * @package App\Models
 */
class Task extends Model
{
	use SoftDeletes, HasFactory;
	protected $table = 'tasks';

	protected $casts = [
		'created_by' => 'int',
		'category_id' => 'int'
	];

	protected $fillable = [
		'title',
		'slug',
		'description',
		'price',
		'quantity',
		'color',
		'size',
		'label',
		'photo',
		'created_by',
		'category_id',
		'active',
		'status'
	];

	public function task_category()
	{
		return $this->belongsTo(TaskCategory::class, 'category_id');
	}

	public function user()
	{
		return $this->belongsTo(User::class, 'created_by');
	}
}
