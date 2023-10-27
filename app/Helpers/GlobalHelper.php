<?php
 namespace App\Helpers;

use Illuminate\Http\Request;

 class GlobalHelper{



    public static function saveImage($image, $path, $option){
        try {
            if($image != null) {
                $image_path = $image->store($path, $option);
                return $image_path;
            } else {
                return null;
            }
        } catch (\Exception $e) {
            echo 'Image Helper saveImage ' .$e->getMessage();
        }
    }


    /**
     * dataWithFilters function
     *
     * @param  Request $request
     * @param  [type]  $data
     * @return object
     */
    public static function dataWithFilters(Request $request, $data) {
        // Use the withTrashed method to include soft-deleted records
        $data = $data->withTrashed();

        // Filter soft-deleted items
        if ($request->has('trash_filter')) {
            if ((int) $request->trash_filter === 1) {
                $data->whereNull('deleted_at');
            } elseif ((int) $request->trash_filter === 2) {
                $data->whereNotNull('deleted_at');
            }
        }

        return $data;
    }

}