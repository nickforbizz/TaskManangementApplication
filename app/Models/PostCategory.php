<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class PostCategory
 * 
 * @property int $id
 * @property int|null $fk_group
 * @property int $created_by
 * @property string $name
 * @property string $slug
 * @property string|null $description
 * @property string $active
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 * @property Group|null $group
 * @property Collection|Post[] $posts
 *
 * @package App\Models
 */
class PostCategory extends Model
{
	use SoftDeletes,  HasFactory;
	protected $table = 'post_categories';

	protected $casts = [
		'fk_group' => 'int',
		'created_by' => 'int'
	];

	protected $fillable = [
		'fk_group',
		'created_by',
		'name',
		'slug',
		'description',
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

	public function posts()
	{
		return $this->hasMany(Post::class, 'category_id');
	}
}
