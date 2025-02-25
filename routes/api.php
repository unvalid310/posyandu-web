<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Ibu;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/test', function (Request $request){
    return response()->json(Ibu::all());
});

Route::prefix('mobileuser')->group(function(){
    // auth
    Route::post('/Login', 'User\Auth\Api\ApiLoginController@logins');
    Route::get('/Logout', 'User\Auth\Api\ApiLoginController@logout')->middleware('auth:sanctum');
    Route::post('/register', 'User\Auth\Api\ApiRegisterController@firstRegis');
    Route::post('/register-anak', 'User\Auth\Api\ApiRegisterController@storeAnak');
    Route::post('/register-ibu', 'User\Auth\Api\ApiRegisterController@storeIbu');
    Route::post('/register-lansia', 'User\Auth\Api\ApiRegisterController@storeLansia');

    // regist tahap 2 stuff
    Route::get('/regist-data-posyandu', 'User\Auth\Api\ApiRegisterController@getAllPosyandu');
    Route::post('/register-data-anak', 'User\Auth\Api\ApiRegisterDataDiriController@storeDataAnak');
    Route::post('/register-data-ibu', 'User\Auth\Api\ApiRegisterDataDiriController@storeDataIbu');
    Route::post('/register-data-lansia', 'User\Auth\Api\ApiRegisterDataDiriController@storeDataLansia');

    // posyandu data stuff
    Route::get('/get-posyandu', 'User\Auth\Api\GetData@dataPosyandu')->middleware('auth:sanctum');
    Route::post('/get-posyandu-bolong', 'User\Auth\Api\ApiPosyanduDataController@getPosyandu');
    Route::post('/get-posyandu-kegiatan', 'User\Auth\Api\ApiPosyanduDataController@getPosyanduKegiatan');
    Route::post('/get-posyandu-nakes', 'User\Auth\Api\ApiPosyanduDataController@getTenagaKesehatanPosyandu');
    Route::post('/get-posyandu-pengumuman', 'User\Auth\Api\ApiPosyanduDataController@getPengumuman');

    //user data stuff
    Route::post('/user/get-user-anak', 'User\Auth\Api\ApiUserDataController@getUserAnak');
    Route::post('/user/get-user-ibu', 'User\Auth\Api\ApiUserDataController@getUserIbu');
    Route::post('/user/get-user-lansia', 'User\Auth\Api\ApiUserDataController@getUserLansia');
    Route::post('/user/get-user-keluarga', 'User\Auth\Api\ApiUserDataController@getUserKeluarga');

    //kesehatan stuff
    Route::post('/kesehatan/get-history-vitamin-anak', 'User\Auth\Api\ApiKesehatanDataController@getVitaminHistory');
    Route::post('/kesehatan/get-history-imunisasi-anak', 'User\Auth\Api\ApiKesehatanDataController@getImunisasiHistory');
    Route::post('/kesehatan/get-history-pemeriksaan-anak', 'User\Auth\Api\ApiKesehatanDataController@getPemeriksaanAnakHistory');
    Route::post('/kesehatan/get-keluargaku-anak', 'User\Auth\Api\ApiKesehatanDataController@getKeluargakuAnak');
    Route::post('/kesehatan/get-kesehatan-anak', 'User\Auth\Api\ApiKesehatanDataController@getKesehatanSummaryAnak');
    Route::post('/kesehatan/get-kesehatan-ibu', 'User\Auth\Api\ApiKesehatanDataController@getKesehatanSummaryIbu');
    Route::post('/kesehatan/get-kesehatan-lansia', 'User\Auth\Api\ApiKesehatanDataController@getKesehatanSummaryLansia');

    Route::post('/kesehatan/get-alergi', 'User\Auth\Api\ApiKesehatanDataController@getAlergi');
    Route::post('/kesehatan/get-penyakit-bawaan', 'User\Auth\Api\ApiKesehatanDataController@getPenyakitBawaan');
    Route::post('/kesehatan/get-masalah-kesehatan-lansia', 'User\Auth\Api\ApiKesehatanDataController@getMasalahKesehatanLansia');

    Route::post('/kesehatan/get-history-pemeriksaan-ibu', 'User\Auth\Api\ApiKesehatanDataController@getPemeriksaanIbuHistory');
    Route::post('/kesehatan/get-keluargaku-ibu', 'User\Auth\Api\ApiKesehatanDataController@getKeluargakuIbu');

    Route::post('/kesehatan/get-history-pemeriksaan-ibu', 'User\Auth\Api\ApiKesehatanDataController@getPemeriksaanIbuHistory');
    Route::post('/kesehatan/get-keluargaku-ibu', 'User\Auth\Api\ApiKesehatanDataController@getKeluargakuIbu');

    Route::post('/kesehatan/get-history-pemeriksaan-lansia', 'User\Auth\Api\ApiKesehatanDataController@getPemeriksaanLansiaHistory');
    Route::post('/kesehatan/get-keluargaku-lansia', 'User\Auth\Api\ApiKesehatanDataController@getKeluargakuLansia');

    // informasi stuff
    Route::get('/get-informasi-home', 'User\Auth\Api\ApiInformasiController@getInformasiHome');
    Route::post('/get-informasi', 'User\Auth\Api\ApiInformasiController@getInformasi');
    Route::post('/get-image', 'User\Auth\Api\ApiInformasiController@getImage');


    // other
    Route::post('/get-notifikasi', 'User\Auth\Api\ApiNotifikasiController@getNotifikasi');
    Route::post('/read-notifikasi', 'User\Auth\Api\ApiNotifikasiController@markReadNotifikasi');
    Route::post('/get-unread-notifikasi', 'User\Auth\Api\ApiNotifikasiController@getUnreadNotification');
    Route::get('/get-loginbg-video', 'User\Auth\Api\ApiLoginController@videoBg');
    Route::get('/get-informasi-img/{id}', 'User\Auth\Api\ApiGetImageController@getInformasiImage');
    Route::get('/get-user-img/{id}', 'User\Auth\Api\ApiGetImageController@getUserProfilePict');
    Route::get('/get-pengumuman-img/{id}', 'User\Auth\Api\ApiGetImageController@getPengumumanImage');
});
