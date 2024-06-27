<?php

namespace App\Http\Controllers\Landing;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\InformasiPenting;
use App\Penyuluhan;
use Illuminate\Support\Facades\Hash;

class LandingController extends Controller
{
    public function index()
    {
        $informasi_terbaru = InformasiPenting::where('status', 'Aktif')->orderby('created_at', 'desc')->limit(3)->get();
        $informasi_populer = InformasiPenting::where('status', 'Aktif')->orderby('dilihat', 'desc')->limit(3)->get();
        // dd(Hash::make('12345678'));
        return view('landing.index.landing-page', compact('informasi_terbaru', 'informasi_populer'));
    }
}
