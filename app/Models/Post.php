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
 * Class Post
 * 
 * @property int $id
 * @property int|null $fk_group
 * @property string $title
 * @property string $slug
 * @property string $content
 * @property string $featured_img
 * @property int $created_by
 * @property int $category_id
 * @property string $active
 * @property string $status
 * @property string|null $deleted_at
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property PostCategory $post_category
 * @property User $user
 * @property Group|null $group
 * @property Collection|Comment[] $comments
 *
 * @package App\Models
 */
class Post extends Model
{
	use SoftDeletes;
	protected $table = 'posts';

	protected $casts = [
		'fk_group' => 'int',
		'created_by' => 'int',
		'category_id' => 'int'
	];

	protected $fillable = [
		'fk_group',
		'title',
		'slug',
		'content',
		'featured_img',
		'created_by',
		'category_id',
		'active',
		'status'
	];

	public function post_category()
	{
		return $this->belongsTo(PostCategory::class, 'category_id');
	}

	public function user()
	{
		return $this->belongsTo(User::class, 'created_by');
	}

	public function group()
	{
		return $this->belongsTo(Group::class, 'fk_group');
	}

	public function comments()
	{
		return $this->hasMany(Comment::class);
	}
}
