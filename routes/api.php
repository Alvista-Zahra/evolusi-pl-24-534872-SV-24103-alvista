<?php

use App\Models\Task;
use Illuminate\Support\Facades\Route;

Route::get('/tasks', function () {
    return response()->json(
        Task::orderBy('created_at', 'desc')->get()
    );
});