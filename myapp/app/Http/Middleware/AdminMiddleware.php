<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Check if user is authenticated and has role == 1 (Admin)
        if ($request->user() && $request->user()->role == 1) {
            return $next($request);
        }

        // Return 403 Forbidden if not admin
        return response()->json([
            'success' => false,
            'message' => 'Unauthorized action. Admin access required.',
            'status' => 403
        ], 403);
    }
}
