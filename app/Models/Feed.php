<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Feed
 * 
 * @property int $id
 * @property int $fk_user
 * @property string $title
 * @property string $content
 * @property bool $active
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property User $user
 *
 * @package App\Models
 */
class Feed extends Model
{
	use SoftDeletes;
	protected $table = 'feeds';

	protected $casts = [
		'fk_user' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'fk_user',
		'title',
		'content',
		'active'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'fk_user');
	}
}
