<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use App\Enums\EntityStatus;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class CustomerFeedback
 * 
 * @property int $id
 * @property int $fk_user
 * @property string $title
 * @property string $content
 * @property string $status
 * @property bool $active
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 * 
 * @property User $user
 *
 * @package App\Models
 */
class CustomerFeedback extends Model
{
	use SoftDeletes, HasFactory;
	protected $table = 'customer_feedback';

	protected $casts = [
		'fk_user' => 'int',
		'active' => 'bool',
		'status' => EntityStatus::class, 
	];

	protected $fillable = [
		'fk_user',
		'title',
		'content',
		'status',
		'active'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'fk_user');
	}
}
