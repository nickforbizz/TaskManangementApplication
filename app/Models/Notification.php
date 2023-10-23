<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Notification
 * 
 * @property string $id
 * @property int|null $fk_group
 * @property string $type
 * @property string $notifiable_type
 * @property int $notifiable_id
 * @property string $data
 * @property Carbon|null $read_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Group|null $group
 *
 * @package App\Models
 */
class Notification extends Model
{
	protected $table = 'notifications';
	public $incrementing = false;

	protected $casts = [
		'fk_group' => 'int',
		'notifiable_id' => 'int',
		'read_at' => 'date'
	];

	protected $fillable = [
		'fk_group',
		'type',
		'notifiable_type',
		'notifiable_id',
		'data',
		'read_at'
	];

	public function group()
	{
		return $this->belongsTo(Group::class, 'fk_group');
	}
}
