<?php

namespace App\Http\Controllers\User\Auth\Api;

use App\KK;
use App\User;
use App\Anak;
use App\Ibu;
use App\Lansia;
use App\Kabupaten;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class ApiRegisterController extends Controller
{
    /*
    Flag role user
        0, anak
        1, bumil
        2, lansia
    */

    public function firstRegis(Request $request)
    {
        $noKK = $request->no_kk;
        $selectKK = KK::where('no_kk', $noKK)->first();
        if($selectKK != null){
            $idKK = $selectKK->id;
            return response()->json([
                'status_code' => 200,
                'idKK' => $idKK,
                'noKK' => $selectKK->no_kk
            ]);

        }else{
            $idKK = null;
            return response()->json([
                'status_code' => 200,
                'idKK' => null,
            ]);
        }
    }

    public function storeAnak(Request $request)
    {
        $cekUser = User::where('email', $request->email)->count();
        if($cekUser > 0) {
            return response()->json([
                'status_register' => 'email sama',
                'status_code' => 200
            ]);
        }
        else {
            if($request->idKK != null){
                $user = User::create([
                    'id_kk' => $request->idKK,
                    'id_chat_tele' => null,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => "/images/upload/Profile/deafult.jpg",
                    'is_verified' => 1,
                    'role' => '0'
                ]);

                $anak = $user->anak()->create([
                    'id_posyandu' => $request->banjar,
                    'nama_anak' => $request->nama,
                ]);

                return response()->json([
                    'status_register' => 'sukses',
                    'status_code' => 200
                ]);

            }else{
                $path ='/images/upload/KK/'.time().'-'.$request->file->getClientOriginalName();
                $imageName = time().'-'.$request->file->getClientOriginalName();

                $request->file->move(public_path('images/upload/KK'),$imageName);

                $kk = KK::create([
                    'no_kk' =>  $request->noKK,
                    'file_kk' => $path,
                ]);

                $user = new User;
                $user = $kk->user()->create([
                    'id_chat_tele' => null,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => "/images/upload/Profile/deafult.jpg",
                    'is_verified' => 1,
                    'role' => '0'
                ]);

                $anak = $user->anak()->create([
                    'id_posyandu' => $request->banjar,
                    'nama_anak' => $request->nama,
                ]);

                return response()->json([
                    'status_register' => 'sukses',
                    'status_code' => 200
                ]);
            }
        }
    }

    public function storeIbu(Request $request)
    {
        $cekUser = User::where('email', $request->email)->count();
        if($cekUser > 0) {
            return response()->json([
                'status_register' => 'email sama',
                'status_code' => 200
            ]);
        }
        else {
            if($request->idKK != null){
                $user = User::create([
                    'id_kk' => $request->idKK,
                    'id_chat_tele' => null,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => "/images/upload/Profile/deafult.jpg",
                    'is_verified' => 1,
                    'role' => '1'
                ]);

                $anak = $user->ibu()->create([
                    'id_posyandu' => $request->banjar,
                    'nama_ibu_hamil' => $request->nama,
                ]);

                return response()->json([
                    'status_register' => 'sukses',
                    'status_code' => 200
                ]);

            }else{
                $path ='/images/upload/KK/'.time().'-'.$request->file->getClientOriginalName();
                $imageName = time().'-'.$request->file->getClientOriginalName();

                $request->file->move(public_path('images/upload/KK'),$imageName);

                $kk = KK::create([
                    'no_kk' =>  $request->noKK,
                    'file_kk' => $path,
                ]);

                $user = new User;
                $user = $kk->user()->create([
                    'id_chat_tele' => null,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => "/images/upload/Profile/deafult.jpg",
                    'is_verified' => 1,
                    'role' => '1'
                ]);

                $anak = $user->ibu()->create([
                    'id_posyandu' => $request->banjar,
                    'nama_ibu_hamil' => $request->nama,
                ]);

                return response()->json([
                    'status_register' => 'sukses',
                    'status_code' => 200
                ]);
            }
        }
    }

    public function storeLansia(Request $request)
    {
        $cekUser = User::where('email', $request->email)->count();
        if($cekUser > 0) {
            return response()->json([
                'status_register' => 'email sama',
                'status_code' => 200
            ]);
        }
        else {
            if($request->idKK != null){
                $user = User::create([
                    'id_kk' => $request->idKK,
                    'id_chat_tele' => null,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => "/images/upload/Profile/deafult.jpg",
                    'is_verified' => 1,
                    'role' => '2'
                ]);

                $anak = $user->lansia()->create([
                    'id_posyandu' => $request->banjar,
                    'nama_lansia' => $request->nama,
                ]);

                return response()->json([
                    'status_register' => 'sukses',
                    'status_code' => 200
                ]);

            }else{
                $path ='/images/upload/KK/'.time().'-'.$request->file->getClientOriginalName();
                $imageName = time().'-'.$request->file->getClientOriginalName();

                $request->file->move(public_path('images/upload/KK'),$imageName);

                $kk = KK::create([
                    'no_kk' =>  $request->noKK,
                    'file_kk' => $path,
                ]);

                $user = new User;
                $user = $kk->user()->create([
                    'id_chat_tele' => null,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => "/images/upload/Profile/deafult.jpg",
                    'is_verified' => 1,
                    'role' => '2'
                ]);

                $anak = $user->lansia()->create([
                    'id_posyandu' => $request->banjar,
                    'nama_lansia' => $request->nama,
                ]);

                return response()->json([
                    'status_register' => 'sukses',
                    'status_code' => 200
                ]);
            }
        }
    }

    public function getAllPosyandu(Request $request) {
        $data = Kabupaten::query()
            ->with(['kecamatan' => function($qkecamatan) {
                $qkecamatan->with(['desa' => function($qdesa) {
                    $qdesa->with(['posyandu']);
                }]);
            },
        ])->get();

        return response()->json([
            'status_code' => 200,
            'data' => $data
        ]);
    }
}
