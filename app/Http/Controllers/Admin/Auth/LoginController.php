<?php

namespace App\Http\Controllers\Admin\Auth;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{

    public function __construct()
    {
        $this->middleware('guest:admin')->except('logoutAdmin');
    }

    public function showLoginForm(Request $request)
    {
        return view('pages/auth/admin/login-admin');
    }

    public function submitLogin(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:8',
            'captcha' => 'required|captcha'
        ],
        [
            'email.required' => "Email tidak boleh kosong",
            'email.email' => "Masukan email yang sesuai",
            'password.required' => "Password tidak boleh kosong",
            'captcha.required' => "Captha harus diisi",
            'captcha.captcha' => "Captha yang dimasukan salah",
        ]);

        $credential = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if (Auth::guard('admin')->attempt($credential, $request->member)){
            // \dd(true);
            return redirect(route('Admin Home'));
        }

        return redirect()->back()->with('message','Email atau password Anda Salah');
    }

    public function logoutAdmin(Request $request)
    {
       Auth::guard('admin')->logout();
       return redirect(route('form.admin.login'));
    }

}
