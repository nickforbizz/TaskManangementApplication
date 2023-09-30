<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TaskAttachment
 * 
 * @property int $id
 * @property int $task_id
 * @property string $file_name
 * @property string $name
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Task $task
 *
 * @package App\Models
 */
class TaskAttachment extends Model
{
	protected $table = 'task_attachments';

	protected $casts = [
		'task_id' => 'int'
	];

	protected $fillable = [
		'task_id',
		'file_name',
		'name',
	];

	public function task()
	{
		return $this->belongsTo(Task::class);
	}
}
