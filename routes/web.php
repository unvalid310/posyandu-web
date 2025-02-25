<?php

use App\Http\Controllers\Admin\Kegiatan\KegiatanController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


//Landing Page
Route::get('/', 'Landing\LandingController@index')->name('Landing Page');

//Berita di Landing Page User
Route::get('admin/informasi/get-img/{id}', 'Landing\NewsController@getImage')->name('informasi_penting.get_img');
Route::get('/blog', 'Landing\NewsController@index')->name("Berita");
Route::get('/blog/detail/{slug}', 'Landing\NewsController@show')->name("Detail Berita");

//Galeri dari Dokumentasi Kegiatan
Route::get('galeri/get-img/{id}', 'Landing\GalleryController@getImage')->name('Dokumentasi Kegiatan');
Route::get('/galeri', 'Landing\GalleryController@semuaGaleri')->name("Galeri");
Route::get('/galeri/detail/{slug}', 'Landing\GalleryController@detailGaleri')->name("Detail Galeri");

//Penyuluhan
Route::get('/penyuluhan', 'Landing\PenyuluhanController@index')->name('Penyuluhan');
Route::get('/penyuluhan/detail/{slug}', 'Landing\PenyuluhanController@show')->name('Detail Penyuluhan');



//Login Admin dan User
Route::prefix('login')->group(function(){
    Route::prefix('admin')->namespace('Admin\Auth')->group(function(){
        Route::get('/', 'LoginController@showLoginForm')->name('form.admin.login')->middleware('guest');
        Route::post('/submit', 'LoginController@submitLogin')->name('submit.login.admin');
        Route::get('/logout', 'LoginController@logoutAdmin')->name('logout.admin');
        Route::get('/reset/password', 'ForgotPasswordController@showForm')->name('form.reset-password');
        Route::post('/reset/password', 'ForgotPasswordController@postEmail')->name('post.email');
        Route::post('/reset/password/telegram', 'ForgotPasswordController@postTelegram')->name('post.telegram');
        Route::get('/verify/token', 'ResetPasswordController@showForm')->name('form.verify.token');
        Route::post('/verify/token', 'ResetPasswordController@cekOTP')->name('cek.otp.token');
        Route::get('/password/reset/{otp_token}', 'ResetPasswordController@showResetForm')->name('password.reset');
        Route::post('/password/reset', 'ResetPasswordController@passwordUpdate')->name('password.update');
    });

    Route::prefix('user')->namespace('User\Auth')->group(function(){
        Route::get('/', 'LoginController@showForm')->name('form.user.login');
        Route::post('/submit', 'LoginController@submitLogin')->name('submit.user.login');
        Route::get('/logout', 'LoginController@logoutUser')->name('logout.user');
        Route::get('/reset/password', 'ForgotPasswordController@showForm')->name('user.form.reset-password');
        Route::post('/reset/password', 'ForgotPasswordController@postEmail')->name('user.post.email');
        Route::post('/forget-password/request-token/telegram', 'ForgotPasswordController@postTelegram')->name('user.forget.tele');
        Route::get('/verify/token', 'ResetPasswordController@showForm')->name('user.form.verify.token');
        Route::post('/verify/token', 'ResetPasswordController@cekOTP')->name('user.cek.otp.token');
        Route::get('/password/reset/{otp_token}', 'ResetPasswordController@showResetForm')->name('user.password.reset');
        Route::post('/password/reset', 'ResetPasswordController@passwordUpdate')->name('user.password.update');
    });
});

//Refresh Captcha
Route::get('/refresh-captcha', 'Admin\Auth\ChangeCaptcha@refreshCaptcha');



//Registrasi User
Route::prefix('register')->namespace('User\Auth')->group(function() {
    Route::get('/landing', 'RegisController@landingRegis')->name('landing.regis');
    Route::post('/landing', 'RegisController@submitLanding')->name('landing.regis.submit');
    Route::get('/verif', 'RegisController@landingVerif')->name('landing.verif');
    Route::get('/user', 'RegisController@formRegisAwal')->name('register.pertama');
    Route::post('user/anak', 'RegisController@storeAnak')->name('anak.registrasi.submit');
    Route::post('user/ibu', 'RegisController@storeIbu')->name('ibu.registrasi.submit');
    Route::post('user/lansia', 'RegisController@storeLansia')->name('lansia.registrasi.submit');

    Route::prefix('data-diri')->group(function(){
        Route::get('/anak', 'RegisDataDiriController@showRegisFormAnak')->name('anak.data-diri.form');
        Route::get('/ibu', 'RegisDataDiriController@showRegisFormIbu')->name('ibu.data-diri.form');
        Route::get('/lansia', 'RegisDataDiriController@showRegisFormLansia')->name('lansia.data-diri.form');
        Route::post('/anak/store', 'RegisDataDiriController@storeDataAnak')->name('anak.data-diri.submit');
        Route::post('/ibu/store', 'RegisDataDiriController@storeDataIbu')->name('ibu.data-diri.submit');
        Route::post('/lansia/store', 'RegisDataDiriController@storeDataLansia')->name('lansia.data-diri.submit');
    });
});



//Admin
Route::prefix('admin')->namespace('Admin\Auth')->group(function(){
    Route::get('/', 'AdminController@index')->name('Admin Home');
    Route::get('/profile', 'AdminController@profile')->name('profile.admin');
    Route::post('/status/update', 'AccountController@updateStatus')->name('edit.status.admin')->middleware('cek:head admin,admin,kader,tenaga kesehatan,param5');

    Route::get('/get-img', 'AdminController@getProfileImage')->name('profile.admin.get_img');
    Route::prefix('edit')->group(function(){
        Route::post('/profile', 'AdminController@profileUpdate')->name('edit.profile.admin');
        Route::post('/account', 'AdminController@accountUpdate')->name('edit.account');
        Route::post('/account/superadmin', 'AdminController@accountUpdateSuperadmin')->name('edit.account.superadmin');
        Route::post('/password', 'AdminController@passwordUpdate')->name('edit.password');
    });
});



//Management Account
Route::prefix('account')->namespace('Admin\Auth')->group(function(){
    Route::post('/new-user-ibu/store', 'RegisController@storeUserIbu')->name('create.account.ibu');
    Route::post('/new-user-anak/store', 'RegisController@storeUserAnak')->name('create.account.anak');
    Route::post('/new-user-lansia/store', 'RegisController@storeUserLansia')->name('create.account.lansia');
});



//Dashboard User
    // Route::prefix('user')->namespace('User\Auth')->group(function(){
    //     Route::get('/anak', 'UserController@anakhome')->name('anak.home')->middleware(['userAkses:0','user:anak']);
    //     Route::get('/ibu', 'UserController@ibuhome')->name('ibu.home')->middleware(['userAkses:1','user:ibu']);
    //     Route::get('/lansia', 'UserController@lansiahome')->name('lansia.home')->middleware(['userAkses:2','user:lansia']);

    //     Route::get('/anak/tambah-keluarga', 'TambahKeluargaController@formAnak')->name('Tambah Keluarga Anak');
    //     Route::get('/ibu/tambah-keluarga', 'TambahKeluargaController@formIbu')->name('Tambah Keluarga Ibu');
    //     Route::get('/lansia/tambah-keluarga', 'TambahKeluargaController@formLansia')->name('Tambah Keluarga Lansia');

    //     Route::post('/ibu/store', 'TambahKeluargaController@storeIbu')->name('ibu.store');
    //     Route::post('/anak/store', 'TambahKeluargaController@storeAnak')->name('anak.store');
    //     Route::post('/lansia/store', 'TambahKeluargaController@storeLansia')->name('lansia.store');

    //     Route::prefix('profile')->group(function(){
    //         Route::get('/anak', 'EditProfileController@anak')->name('anak.profile');
    //         Route::get('/ibu', 'EditProfileController@ibu')->name('ibu.profile');
    //         Route::get('/lansia', 'EditProfileController@lansia')->name('lansia.profile');
    //     });
    //     Route::prefix('edit')->group(function(){
    //         Route::post('/profile', 'EditProfileController@updateProfile')->name('edit.profile.user');
    //         Route::post('/password', 'EditProfileController@updatePassword')->name('edit.password.user');
    //         Route::post('/personal/user', 'EditProfileController@updatePersonalAnak')->name('edit.account.anak');
    //         Route::post('/personal/ibu', 'EditProfileController@updatePersonalIbu')->name('edit.account.ibu');
    //         Route::post('/personal/lansia', 'EditProfileController@updatePersonalLansia')->name('edit.account.lansia');
    //     });
// });



//CRUD Data Posyandu
Route::get('/admin/posyandu/all', 'Admin\MasterData\DataPosyanduController@listPosyandu')->name("Data Posyandu")->middleware("cek:super admin,tenaga kesehatan,param3,param4,param5");
Route::get('/admin/posyandu/new', 'Admin\MasterData\DataPosyanduController@addPosyandu')->name("Add Posyandu")->middleware("cek:super admin,param2,param3,param4,param5");
Route::post('/admin/posyandu/add', 'Admin\MasterData\DataPosyanduController@storePosyandu')->name("New Posyandu")->middleware("cek:super admin,param3,param4,param5");
Route::get('/admin/posyandu/detail/{posyandu}', 'Admin\MasterData\DataPosyanduController@detailPosyandu')->name("Detail Posyandu")->middleware("cek:super admin,tenaga kesehatan,head admin,admin,kader");
Route::get('/admin/posyandu/edit/{posyandu}', 'Admin\MasterData\DataPosyanduController@editPosyandu')->name("Edit Posyandu")->middleware("cek:super admin,head admin,admin,param4,param5");
Route::post('/admin/posyandu/update/{posyandu}', 'Admin\MasterData\DataPosyanduController@updatePosyandu')->name("Update Posyandu")->middleware("cek:super admin,param2,param3,param4,param5");



//CRUD Profile Posyandu
Route::get('/admin/profile-posyandu/profile', 'Admin\MasterData\ProfilePosyanduController@profilePosyandu')->name("Profile Posyandu")->middleware("cek:head admin,admin,kader,tenaga kesehatan,param5");
Route::get('/admin/profile-posyandu/edit/{posyandu}', 'Admin\MasterData\ProfilePosyanduController@editProfilePosyandu')->name("Edit Profile Posyandu")->middleware("cek:head admin,admin,param3,param4,param5");
Route::post('/admin/profile-posyandu/update/{posyandu}', 'Admin\MasterData\ProfilePosyanduController@updateProfilePosyandu')->name("Update Profile Posyandu")->middleware("cek:head admin,admin,param3,param4,param5");



//Konsultasi
Route::get('nakes/konsultasi', 'Admin\KesehatanKeluarga\KonsultasiController@tambahKonsultasi')->name("Tambah Konsultasi")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
Route::get('nakes/konsultasi/ibu/{ibu}', 'Admin\KesehatanKeluarga\KonsultasiController@konsultasiIbu')->name("Konsultasi Ibu")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
Route::get('nakes/konsultasi/anak/{anak}', 'Admin\KesehatanKeluarga\KonsultasiController@konsultasiAnak')->name("Konsultasi Anak")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
Route::get('nakes/konsultasi/lansia/{lansia}', 'Admin\KesehatanKeluarga\KonsultasiController@konsultasiLansia')->name("Konsultasi Lansia")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");

//Tambah Konsultasi
Route::get('/get-img/data-anggota/konsultasi/{id}', 'Admin\KesehatanKeluarga\KonsultasiController@getImage')->name('Get Image Anggota Konsultasi')->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
Route::get('nakes/konsultasi-ibu/{ibu}', 'Admin\KesehatanKeluarga\KonsultasiController@storeKonsultasiIbu')->name("Tambah Konsultasi Ibu")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
Route::get('nakes/konsultasi-anak/{anak}', 'Admin\KesehatanKeluarga\KonsultasiController@storeKonsultasiAnak')->name("Tambah Konsultasi Anak")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
Route::get('nakes/konsultasi-lansia/{lansia}', 'Admin\KesehatanKeluarga\KonsultasiController@storeKonsultasiLansia')->name("Tambah Konsultasi Lansia")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");



Route::get('mobile/data-kesehatan/graph-anak-1/{anak}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanControllerMobile@kesehatanAnakMob1')->name('mobile-anak-1');
Route::get('mobile/data-kesehatan/graph-anak-2/{anak}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanControllerMobile@kesehatanAnakMob2')->name('mobile-anak-2');
Route::get('mobile/data-kesehatan/graph-anak-3/{anak}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanControllerMobile@kesehatanAnakMob3')->name('mobile-anak-3');
Route::get('mobile/data-kesehatan/graph-anak-4/{anak}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanControllerMobile@kesehatanAnakMob4')->name('mobile-anak-4');
Route::get('mobile/data-kesehatan/graph-ibu/{ibu}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanControllerMobile@kesehatanIbuMob')->name('mobile-ibu');



//Laporan
Route::prefix('admin')->middleware("cek:super admin,head admin,admin,kader,tenaga kesehatan")->namespace('Admin\Laporan')->group(function() {

    Route::get('/laporan/kegiatan' , 'LaporanController@laporankegiatan')->name('laporan.kegiatan');
    Route::get('/laporan/bulanan' , 'LaporanController@laporanbulanan')->name('laporan.bulanan');
    Route::get('/laporan/tahunan' , 'LaporanController@laporantahunan')->name('laporan.tahunan');

    // Ajax Laporan
    Route::prefix('ajax')->group( function () {
      Route::post('/laporan/kegiatan' , 'LaporanController@ajaxchartkegiatan');
      Route::post('/laporan/bulanan' , 'LaporanController@ajaxchartbulanan');
      Route::post('/laporan/tahunan' , 'LaporanController@ajaxcharttahunan');
      Route::get('/posyandu' , 'LaporanController@ajaxposyandu');
      Route::get('/filter/{type}' , 'LaporanController@ajaxfilter');
      Route::get('/filter/l/{type}' , 'LaporanController@filter');
      Route::post('/default/kegiatan' , 'LaporanController@loadchartkegiatan');
      Route::post('/default/bulanan' , 'LaporanController@loadchartbulanan');
      Route::post('/default/tahunan' , 'LaporanController@loadcharttahunan');
      Route::post('/table/kegiatan' , 'LaporanController@tabelfilterkegiatan');
      Route::post('/default/table/kegiatan' , 'LaporanController@loadtablekegiatan');
      Route::post('/table/bulanan' , 'LaporanController@tabelfilterbulanan');
      Route::post('/default/table/bulanan' , 'LaporanController@loadtablebulanan');
      Route::post('/table/tahunan' , 'LaporanController@tabelfiltertahunan');
      Route::post('/default/table/tahunan' , 'LaporanController@loadtabletahunan');
      Route::get('/tabel/filter' , 'LaporanController@filtertabel');
      Route::post('/tabel/filter/generate' , 'LaporanController@filtertabelgenerate');
    });
  });


  // File Update ----
  //Riwayat Kesehatan Anggota Keluarga User
  Route::prefix('keluarga')->namespace('User\Auth')->group(function(){
      Route::get('/anak', 'RiwayatKeluargaController@keluargaAnak')->name('Keluarga Anak');
      Route::get('/ibu', 'RiwayatKeluargaController@keluargaIbu')->name('Keluarga Ibu');
      Route::get('/lansia', 'RiwayatKeluargaController@keluargaLansia')->name('Keluarga Lansia');
      Route::prefix('riwayat')->group(function(){
          Route::get('/detail/anak', 'RiwayatKeluargaController@riwayatKeluargaAnak')->name('Riwayat Keluarga Anak');
          Route::get('/detail/ibu', 'RiwayatKeluargaController@riwayatKeluargaIbu')->name('Riwayat Keluarga Ibu');
          Route::get('/detail/lansia', 'RiwayatKeluargaController@riwayatKeluargaLansia')->name('Riwayat Keluarga Lansia');
      });
  });
// ------



// Start Route Menu Manajemen Akun

    //Global Route Manajemen Akun
    Route::post('manajemen-akun/admin/disable/{admin}', 'Admin\ManajemenAkun\Admin\DisableAccountController@disableAccount')->name("Disable Admin Account");
    Route::post('manajemen-akun/anggota/disable/{user}', 'Admin\ManajemenAkun\Anggota\DisableAccountController@disableAccount')->name("Disable Anggota Account");
    Route::get('manajemen-akun/admin/profile-image/{admin}', 'Admin\ManajemenAkun\Admin\GetImageController@getProfileImage')->name('Get Profile Image Admin');
    Route::get('manajemen-akun/anggota/kk-image/{kk}', 'Admin\ManajemenAkun\Anggota\GetImageController@getKkAnggota')->name('Get KK Anggota');
    Route::get('manajemen-akun/anggota/profile-image/{user}', 'Admin\ManajemenAkun\Anggota\GetImageController@getProfileImage')->name('Get Profile Image Anggota');

    // Super Admin
    Route::get('manajemen-akun/super-admin', 'Admin\ManajemenAkun\Admin\SuperAdminController@semuaSuperAdmin')->name("Data Super Admin")->middleware("permission:Lihat Super Admin");
    Route::get('manajemen-akun/super-admin/tambah', 'Admin\ManajemenAkun\Admin\SuperAdminController@tambahSuperAdmin')->name("Tambah Super Admin")->middleware("permission:Tambah Super Admin");
    Route::post('manajemen-akun/super-admin/simpan', 'Admin\ManajemenAkun\Admin\SuperAdminController@simpanSuperAdmin')->name("Simpan Super Admin")->middleware("permission:Tambah Super Admin");
    Route::get('manajemen-akun/super-admin/file-ktp/{superAdmin}', 'Admin\ManajemenAkun\Admin\GetImageController@getImageKTPSuperAdmin')->name('Get KTP Super Admin')->middleware("permission:Ubah Super Admin");
    Route::get('manajemen-akun/super-admin/detail/{superAdmin}', 'Admin\ManajemenAkun\Admin\SuperAdminController@detailSuperAdmin')->name("Detail Super Admin")->middleware("permission:Ubah Super Admin");
    Route::post('manajemen-akun/super-admin/simpan/{superAdmin}', 'Admin\ManajemenAkun\Admin\SuperAdminController@updateSuperAdmin')->name("Update Profile Super Admin")->middleware("permission:Ubah Super Admin");

    // Tenaga Kesehatan
    Route::get('manajemen-akun/nakes', 'Admin\ManajemenAkun\Admin\NakesController@semuaNakes')->name("Data Nakes")->middleware("permission:Lihat Tenaga Kesehatan");
    Route::get('manajemen-akun/nakes/tambah', 'Admin\ManajemenAkun\Admin\NakesController@tambahNakes')->name('Tambah Nakes')->middleware("permission:Tambah Tenaga Kesehatan");
    Route::post('manajemen-akun/nakes/simpan', 'Admin\ManajemenAkun\Admin\NakesController@simpanNakes')->name('Simpan Nakes')->middleware("permission:Tambah Tenaga Kesehatan");
    Route::get('manajemen-akun/nakes/file-ktp/{nakes}', 'Admin\ManajemenAkun\Admin\GetImageController@getImageKTPNakes')->name('Get KTP Nakes')->middleware("permission:Ubah Tenaga Kesehatan");
    Route::get('manajemen-akun/nakes/detail/{nakes}', 'Admin\ManajemenAkun\Admin\NakesController@detailNakes')->name("Detail Nakes")->middleware("permission:Ubah Tenaga Kesehatan");
    Route::post('manajemen-akun/nakes/update/{nakes}', 'Admin\ManajemenAkun\Admin\NakesController@updateNakes')->name("Update Profile Nakes")->middleware("permission:Ubah Tenaga Kesehatan");

    // Head Admin
    Route::get('manajemen-akun/head-admin', 'Admin\ManajemenAkun\Admin\HeadAdminController@semuaHeadAdmin')->name("Data Head Admin")->middleware("permission:Lihat Head Admin");
    Route::get('manajemen-akun/head-admin/tambah', 'Admin\ManajemenAkun\Admin\HeadAdminController@tambahHeadAdmin')->name("Tambah Head Admin")->middleware("permission:Tambah Head Admin");
    Route::post('manajemen-akun/head-admin/simpan', 'Admin\ManajemenAkun\Admin\HeadAdminController@simpanHeadAdmin')->name("Simpan Head Admin")->middleware("permission:Tambah Head Admin");
    Route::get('manajemen-akun/head-admin/file-ktp/{pegawai}', 'Admin\ManajemenAkun\Admin\GetImageController@getImageKTPHeadAdmin')->name('Get KTP Head Admin')->middleware("permission:Ubah Head Admin");
    Route::get('manajemen-akun/head-admin/detail/{pegawai}', 'Admin\ManajemenAkun\Admin\HeadAdminController@detailHeadAdmin')->name("Detail Head Admin")->middleware("permission:Ubah Head Admin");
    Route::post('manajemen-akun/head-admin/update/{pegawai}', 'Admin\ManajemenAkun\Admin\HeadAdminController@updateHeadAdmin')->name("Update Head Admin")->middleware("permission:Ubah Head Admin");

    // Admin
    Route::get('manajemen-akun/admin', 'Admin\ManajemenAkun\Admin\AdminController@semuaAdmin')->name("Data Admin")->middleware("permission:Lihat Admin");
    Route::get('manajemen-akun/admin/tambah', 'Admin\ManajemenAkun\Admin\AdminController@tambahAdmin')->name("Tambah Admin")->middleware("permission:Tambah Admin");
    Route::post('manajemen-akun/admin/simpan', 'Admin\ManajemenAkun\Admin\AdminController@simpanAdmin')->name("Simpan Admin")->middleware("permission:Tambah Admin");
    Route::get('manajemen-akun/admin/file-ktp/{pegawai}', 'Admin\ManajemenAkun\Admin\GetImageController@getImageKTPAdmin')->name('Get KTP Kader')->middleware("permission:Ubah Admin");
    Route::get('manajemen-akun/admin/detail/{pegawai}', 'Admin\ManajemenAkun\Admin\AdminController@detailAdmin')->name("Detail Admin")->middleware("permission:Ubah Admin");
    Route::post('manajemen-akun/admin/update/{pegawai}', 'Admin\ManajemenAkun\Admin\AdminController@updateAdmin')->name("Update Admin")->middleware("permission:Ubah Admin");

    // Kader
    Route::get('manajemen-akun/kader', 'Admin\ManajemenAkun\Admin\KaderController@semuaKader')->name("Data Kader")->middleware("permission:Lihat Kader");
    Route::get('manajemen-akun/kader/tambah', 'Admin\ManajemenAkun\Admin\KaderController@tambahKader')->name("Tambah Kader")->middleware("permission:Tambah Kader");
    Route::post('manajemen-akun/kader/simpan', 'Admin\ManajemenAkun\Admin\KaderController@simpanKader')->name("Simpan Kader")->middleware("permission:Tambah Kader");
    Route::get('manajemen-akun/kader/file-ktp/{pegawai}', 'Admin\ManajemenAkun\Admin\GetImageController@getImageKTPKader')->name('Get KTP Admin')->middleware("permission:Ubah Kader");
    Route::get('manajemen-akun/kader/detail/{pegawai}', 'Admin\ManajemenAkun\Admin\KaderController@detailKader')->name("Detail Kader")->middleware("permission:Ubah Kader");
    Route::post('manajemen-akun/kader/update/{pegawai}', 'Admin\ManajemenAkun\Admin\KaderController@updateKader')->name("Update Kader")->middleware("permission:Ubah Kader");

    // Data Anggota
    Route::get('manajemen-akun/anggota', 'Admin\ManajemenAkun\Anggota\SemuaAnggotaController@semuaAnggota')->name("Data Anggota")->middleware("permission:Lihat Anggota");
    Route::get('manajemen-akun/anggota/tambah', 'Admin\ManajemenAkun\Anggota\SemuaAnggotaController@tambahAnggota')->name("Tambah Anggota")->middleware("permission:Tambah Anggota");

    // Ibu Hamil
    Route::post('manajemen-akun/bumil/simpan', 'Admin\ManajemenAkun\Anggota\BumilController@simpanBumil')->name("Simpan Anggota Bumil")->middleware("permission:Tambah Anggota");
    Route::get('manajemen-akun/bumil/detail/{ibu}', 'Admin\ManajemenAkun\Anggota\BumilController@detailBumil')->name("Detail Anggota Bumil")->middleware("permission:Ubah Anggota");
    Route::post('manajemen-akun/bumil/update/{ibu}', 'Admin\ManajemenAkun\Anggota\BumilController@updateBumil')->name("Update Anggota Bumil")->middleware("permission:Ubah Anggota");

    // Anak
    Route::post('manajemen-akun/anak/simpan', 'Admin\ManajemenAkun\Anggota\AnakController@simpanAnak')->name("Simpan Anggota Anak")->middleware("permission:Tambah Anggota");
    Route::get('manajemen-akun/anak/detail/{anak}', 'Admin\ManajemenAkun\Anggota\AnakController@detailAnak')->name("Detail Anggota Anak")->middleware("permission:Ubah Anggota");
    Route::post('manajemen-akun/anak/update/{anak}', 'Admin\ManajemenAkun\Anggota\AnakController@updateAnak')->name("Update Anggota Anak")->middleware("permission:Ubah Anggota");

    // Lansia
    Route::post('manajemen-akun/lansia/simpan', 'Admin\ManajemenAkun\Anggota\LansiaController@simpanLansia')->name("Simpan Anggota Lansia")->middleware("permission:Tambah Anggota");
    Route::get('manajemen-akun/lansia/detail/{lansia}', 'Admin\ManajemenAkun\Anggota\LansiaController@detailLansia')->name("Detail Anggota Lansia")->middleware("permission:Ubah Anggota");
    Route::post('manajemen-akun/lansia/update/{lansia}', 'Admin\ManajemenAkun\Anggota\LansiaController@updateLansia')->name("Update Anggota Lansia")->middleware("permission:Ubah Anggota");
    Route::post('manajemen-akun/lansia/pj/tambah/{lansia}', 'Admin\ManajemenAkun\Anggota\LansiaController@tambahPjLansia')->name("Tambah PJ Lansia")->middleware("permission:Ubah Anggota");
    Route::post('manajemen-akun/lansia/pj/update/{pjLansia}', 'Admin\ManajemenAkun\Anggota\LansiaController@updatePjLansia')->name("Update PJ Lansia")->middleware("permission:Ubah Anggota");

// End Route Menu Manajemen Akun



// Start Route Menu Pengaturan Akun

    // Data Verifikasi Anggota
    Route::get('pengaturan-akun/verifikasi-anggota', 'Admin\PengaturanAkun\KonfirmasiAnggota\SemuaVerifikasiController@verifikasiAnggota')->name('Verifikasi Anggota')->middleware("permission:Konfirmasi Anggota");
    Route::get('pengaturan-akun/getKk/{id}', 'Admin\PengaturanAkun\KonfirmasiAnggota\GetKkAnggotaController@getKk')->name('Get KK')->middleware("permission:Konfirmasi Anggota");

    // Detail Verifikasi Anggota
    Route::get('pengaturan-akun/verifikasi-bumil/detail/{user}', 'Admin\PengaturanAkun\KonfirmasiAnggota\VerifikasiAnggotaController@detailVerifikasiBumil')->name('Detail Verifikasi Bumil')->middleware("permission:Konfirmasi Anggota");
    Route::get('pengaturan-akun/verifikasi-anak/detail/{user}', 'Admin\PengaturanAkun\KonfirmasiAnggota\VerifikasiAnggotaController@detailVerifikasiAnak')->name('Detail Verifikasi Anak')->middleware("permission:Konfirmasi Anggota");
    Route::get('pengaturan-akun/verifikasi-lansia/detail/{user}', 'Admin\PengaturanAkun\KonfirmasiAnggota\VerifikasiAnggotaController@detailVerifikasiLansia')->name('Detail Verifikasi Lansia')->middleware("permission:Konfirmasi Anggota");

    //Konfirmasi User
    Route::post('pengaturan-akun/verifikasi-anggota/konfirmasi-terima/{user}', 'Admin\PengaturanAkun\KonfirmasiAnggota\KonfirmasiAnggotaController@terimaAnggota')->name('Terima Anggota')->middleware("permission:Konfirmasi Anggota");
    Route::post('pengaturan-akun/verifikasi-anggota/konfirmasi-tolak/{user}', 'Admin\PengaturanAkun\KonfirmasiAnggota\KonfirmasiAnggotaController@tolakAnggota')->name('Tolak Anggota')->middleware("permission:Konfirmasi Anggota");

    // Ganti jabatan
    Route::get('pengaturan-akun/ganti-jabatan', 'Admin\PengaturanAkun\GantiJabatan\GantiJabatanController@gantiJabatan')->name('Ganti Jabatan')->middleware("permission:Ganti Jabatan");
    Route::post('pengaturan-akun/ganti-jabatan/update', 'Admin\PengaturanAkun\GantiJabatan\GantiJabatanController@updateJabatan')->name('Update Jabatan')->middleware("permission:Ganti Jabatan");

// End Route Menu Pengaturan Akun



// Start Route Menu Kesehatan Keluarga

    Route::middleware("cek:tenaga kesehatan,param2,param3,param4,param5")->group( function(){

        // Semua Data Pemeriksaan Kesehatan Anggota
        Route::get('kesehatan-keluarga/pemeriksaan', 'Admin\KesehatanKeluarga\Pemeriksaan\SemuaPemeriksaanController@semuaPemeriksaanAnggota')->name("Semua Pemeriksaan Anggota");
        Route::get('kesehatan-keluarg/anggota/get-img/{user}', 'Admin\KesehatanKeluarga\Pemeriksaan\GetImageAnggotaController@getProfileImage')->name('Get Image Anggota Pemeriksaan');

        // Pemeriksaan Anggota
        Route::get('kesehatan-keluarga/pemeriksaan/bumil/{ibu}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanBumilController@pemeriksaanBumil')->name("Pemeriksaan Bumil");
        Route::get('kesehatan-keluarga/pemeriksaan/anak/{anak}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanAnakController@pemeriksaanAnak')->name("Pemeriksaan Anak");
        Route::get('kesehatan-keluarga/pemeriksaan/lansia/{lansia}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanLansiaController@pemeriksaanLansia')->name("Pemeriksaan Lansia");

        // Alergi Anggota
        Route::post('kesehatan-keluarga/alergi/simpan/{user}', 'Admin\KesehatanKeluarga\Pemeriksaan\AlergiController@simpanAlergi')->name("Simpan Alergi");

        // Penyakit Bawaan Anggota
        Route::post('kesehatan-keluarga/penyakit-bawaan/simpan/{user}', 'Admin\KesehatanKeluarga\Pemeriksaan\PenyakitBawaanController@simpanPenyakitBawaan')->name("Simpan Penyakit Bawaan");

        // Pemeriksaan Bumil
        Route::post('kesehatan-keluarga/pemeriksaan-ibu/simpan-persalinan/{ibu}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanBumilController@simpanDataPersalinan')->name("Simpan Persalinan Bumil");
        Route::post('kesehatan-keluarga/pemeriksaan-ibu/simpan-pemeriksaan/{ibu}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanBumilController@simpanDataPemeriksaanBumil')->name("Simpan Pemeriksaan Bumil");
        Route::post('kesehatan-keluarga/pemeriksaan-ibu/simpan-imunisasi/{ibu}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanBumilController@simpanImunisasiBumil')->name('Simpan Imunisasi Bumil');
        Route::post('kesehatan-keluarga/pemeriksaan-ibu/simpan-vitamin/{ibu}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanBumilController@simpanVitaminBumil')->name('Simpan Vitamin Bumil');

        // Pemeriksaan Anak
        Route::post('kesehatan-keluarga/pemeriksaan-anak/simpan-data-kelahiran/{anak}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanAnakController@simpanDataKelahiranAnak')->name("Simpan Data Kelahiran Anak");
        Route::post('kesehatan-keluarga/pemeriksaan-anak/simpan-pemeriksaan/{anak}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanAnakController@simpanPemeriksaanAnak')->name("Simpan Pemeriksaan Anak");
        Route::post('kesehatan-keluarga/pemeriksaan-anak/simpan-imunisasi/{anak}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanAnakController@simpanImunisasiAnak')->name('Simpan Imunisasi Anak');
        Route::post('kesehatan-keluarga/pemeriksaan-anak/simpan-vitamin/{anak}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanAnakController@simpanVitaminAnak')->name('Simpan Vitamin Anak');

        // Lansia
        Route::post('kesehatan-keluarga/pemeriksaan-lansia/simpan-pemeriksaan/{lansia}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanLansiaController@simpanPemeriksaanLansia')->name("Simpan Pemeriksaan Lansia");
        Route::post('kesehatan-keluarga/pemeriksaan-lansia/simpan-imunisasi/{lansia}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanLansiaController@simpanImunisasiLansia')->name('Simpan Imunisasi Lansia');
        Route::post('kesehatan-keluarga/pemeriksaan-lansia/simpan-vitamin/{lansia}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanLansiaController@simpanVitaminLansia')->name('Simpan Vitamin Lansia');
        Route::post('pemeriksaan-keluarga/pemeriksaan-lansia/simpan-riwayat-penyakit/{lansia}', 'Admin\KesehatanKeluarga\Pemeriksaan\PemeriksaanLansiaController@simpanRiwayatPenyakit')->name("Simpan Riwayat Penyakit");

        //Data & Riwayat Kesehatan
        Route::get('kesehatan-keluarga/pemeriksaan/data-kesehatan', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanController@dataKesehatan')->name("Data Kesehatan")->middleware("cek:tenaga kesehatan,param2,param3,param4,param5");
        Route::get('kesehatan-keluarga/pemeriksaan/data-kesehatan/kesehatan-ibu/{ibu}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanController@kesehatanIbu')->name("Data Kesehatan Ibu");
        Route::get('kesehatan-keluarga/pemeriksaan/data-kesehatan/kesehatan-anak/{anak}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanController@kesehatanAnak')->name("Data Kesehatan Anak");
        Route::get('kesehatan-keluarga/pemeriksaan/data-kesehatan/kesehatan-lansia/{lansia}', 'Admin\KesehatanKeluarga\DataRiwayatKesehatanController@kesehatanLansia')->name("Data Kesehatan Lansia");

    });

// End Route Menu Kesehatan Keluarga



// Start Route Menu Imunisasi

    //Imunisasi
    Route::get('nakes/imunisasi/jenis-imunisasi', 'Admin\Imunisasi\ImunisasiController@semuaJenisImunisasi')->name("Semua Jenis Imunisasi")->middleware("permission:Lihat Imunisasi");
    Route::get('nakes/imunisasi/tambah-imunisasi', 'Admin\Imunisasi\ImunisasiController@tambahImunisasi')->name("Tambah Imunisasi")->middleware("permission:Tambah Imunisasi");
    Route::post('nakes/imunisasi/tambah', 'Admin\Imunisasi\ImunisasiController@storeImunisasi')->name("Store Imunisasi")->middleware("permission:Tambah Imunisasi");
    Route::get('nakes/imunisasi/detail/{imunisasi}', 'Admin\Imunisasi\ImunisasiController@detailImunisasi')->name("Detail Imunisasi")->middleware("permission:Ubah Imunisasi");
    Route::post('nakes/imunisasi/update/{imunisasi}', 'Admin\Imunisasi\ImunisasiController@updateImunisasi')->name("Update Imunisasi")->middleware("permission:Ubah Imunisasi");
    Route::post('nakes/imunisasi/delete/{imunisasi}', 'Admin\Imunisasi\ImunisasiController@hapusImunisasi')->name("Hapus Imunisasi")->middleware("permission:Hapus Imunisasi");

// End Route Menu Imunisasi



// Start Route Menu Vitamin

    //Vitamin
    Route::get('nakes/vitamin/jenis-vitamin', 'Admin\Vitamin\VitaminController@semuaJenisVitamin')->name("Semua Jenis Vitamin")->middleware("permission:Lihat Vitamin");
    Route::get('nakes/vitamin/tambah-vitamin', 'Admin\Vitamin\VitaminController@tambahVitamin')->name("Tambah Vitamin")->middleware("permission:Tambah Vitamin");
    Route::post('nakes/vitamin/tambah', 'Admin\Vitamin\VitaminController@storeVitamin')->name("Store Vitamin")->middleware("permission:Tambah Vitamin");
    Route::get('nakes/vitamin/detail-vitamin/{vitamin}', 'Admin\Vitamin\VitaminController@detailVitamin')->name("Detail Vitamin")->middleware("permission:Ubah Vitamin");
    Route::post('nakes/vitamin/update/{vitamin}', 'Admin\Vitamin\VitaminController@updateVitamin')->name("Update Vitamin")->middleware("permission:Ubah Vitamin");
    Route::post('nakes/vitamin/delete/{vitamin}', 'Admin\Vitamin\VitaminController@hapusVitamin')->name("Hapus Vitamin")->middleware("permission:Hapus Vitamin");

// End Route Menu Vitamin



// Start Route Menu Kegiatan Posyandu

    //Kegiatan
    Route::get('admin/kegiatan', 'Admin\Kegiatan\Kegiatan\KegiatanController@index')->name('kegiatan.home')->middleware("permission:Lihat Kegiatan");
    Route::get('admin/kegiatan/tambah', 'Admin\Kegiatan\Kegiatan\KegiatanController@create')->name('kegiatan.create')->middleware("permission:Tambah Kegiatan");
    Route::post('admin/kegiatan/simpan', 'Admin\Kegiatan\Kegiatan\KegiatanController@store')->name('kegiatan.store')->middleware("permission:Tambah Kegiatan");
    Route::get('admin/kegiatan/detail/{id}', 'Admin\Kegiatan\Kegiatan\KegiatanController@show')->name('kegiatan.show')->middleware("permission:Ubah Kegiatan");
    Route::post('admin/kegiatan/ubah/{id}', 'Admin\Kegiatan\Kegiatan\KegiatanController@update')->name('kegiatan.update')->middleware("permission:Ubah Kegiatan");
    Route::post('admin/kegiatan/hapus/{kegiatan}', 'Admin\Kegiatan\Kegiatan\KegiatanController@delete')->name('kegiatan.delete')->middleware("permission:Batalkan Kegiatan");
    Route::get('admin/kegiatan/broadcast/{id}', 'Admin\Kegiatan\Kegiatan\KegiatanController@broadcast')->name('kegiatan.broadcast')->middleware("permission:Broadcast Kegiatan");

    //Riwayat Kegiatan
    Route::get('admin/riwayat-kegiatan', 'Admin\Kegiatan\Riwayat\RiwayatKegiatanController@index')->name('riwayat_kegiatan.home')->middleware("permission:Lihat Riwayat Kegiatan");
    Route::get('admin/riwayat-kegiatan/detail/{id}', 'Admin\Kegiatan\Riwayat\RiwayatKegiatanController@show')->name('riwayat_kegiatan.show')->middleware("permission:Lihat Dokumentasi Kegiatan");
    Route::post('admin/riwayat-kegiatan/publikasi/status/{kegiatan}', 'Admin\Kegiatan\Riwayat\RiwayatKegiatanController@statusPublikasi')->name('Publikasi Dokumentasi')->middleware("permission:Ubah Status Publikasi Kegiatan");

    // Dokumentasi Kegiatan
    Route::get('admin/riwayat-kegiatan/dokumentasi/tambah/{id}', 'Admin\Kegiatan\Riwayat\DokumentasiKegiatanController@createDokumentasi')->name('dokumentasi.create')->middleware("permission:Tambah Dokumentasi Kegiatan");
    Route::post('admin/riwayat-kegiatan/dokumentasi/simpan/{kegiatan}', 'Admin\Kegiatan\Riwayat\DokumentasiKegiatanController@storeDokumentasi')->name('dokumentasi.store')->middleware("permission:Tambah Dokumentasi Kegiatan");
    Route::get('admin/riwayat-kegiatan/dokumentasi/detail/{id}', 'Admin\Kegiatan\Riwayat\DokumentasiKegiatanController@showDokumentasi')->name('dokumentasi.show')->middleware("permission:Ubah Dokumentasi Kegiatan");
    Route::post('admin/riwayat-kegiatan/dokumentasi/ubah/{id}', 'Admin\Kegiatan\Riwayat\DokumentasiKegiatanController@updateDokumentasi')->name('dokumentasi.update')->middleware("permission:Ubah Dokumentasi Kegiatan");
    Route::post('admin/riwayat-kegiatan/dokumentasi/hapus/{id}', 'Admin\Kegiatan\Riwayat\DokumentasiKegiatanController@deleteDokumentasi')->name('dokumentasi.delete')->middleware("permission:Hapus Dokumentasi Kegiatan");
    Route::get('admin/riwayat-kegiatan/dokumentasi/get-img/{id}', 'Admin\Kegiatan\Riwayat\DokumentasiKegiatanController@showImgDokumentasi')->name('dokumentasi.get_img');

// End Menu Kegiatan Posyandu



// Start Route Menu Informasi

    // Berita
    Route::get('admin/informasi/home', 'Admin\Informasi\Berita\BeritaController@index')->name('informasi_penting.home')->middleware("permission:Lihat Berita");
    Route::get('admin/informasi/create', 'Admin\Informasi\Berita\BeritaController@create')->name('informasi_penting.create')->middleware("permission:Tambah Berita");
    Route::post('admin/informasi/store', 'Admin\Informasi\Berita\BeritaController@store')->name('informasi_penting.store')->middleware("permission:Tambah Berita");
    Route::get('admin/informasi/show/{id}', 'Admin\Informasi\Berita\BeritaController@show')->name('informasi_penting.show')->middleware("permission:Ubah Berita");
    Route::post('admin/informasi/update/{id}', 'Admin\Informasi\Berita\BeritaController@update')->name('informasi_penting.update')->middleware("permission:Ubah Berita");
    Route::post('admin/informasi/berita/status/{informasiPenting}', 'Admin\Informasi\Berita\BeritaController@statusBerita')->name('Status Berita')->middleware("permission:Ubah Status Publikasi Berita");


    // Tag Berita
    Route::get('admin/informasi/tag', 'Admin\Informasi\Tag\TagController@semuaTag')->name('Semua Tag')->middleware("permission:Lihat Tag Berita");
    Route::post('admin/informasi/tag/simpan', 'Admin\Informasi\Tag\TagController@simpanTag')->name('Simpan Tag')->middleware("permission:Tambah Tag Berita");
    Route::post('admin/informasi/tag/hapus/{tag}', 'Admin\Informasi\Tag\TagController@hapusTag')->name('Hapus Tag')->middleware("permission:Hapus Tag Berita");


    // Pengumuman
    Route::get('/admin/pengumuman', 'Admin\Informasi\Pengumuman\PengumumanController@index')->name('pengumuman.home')->middleware("permission:Lihat Pengumuman");
    Route::get('/admin/pengumuman/create', 'Admin\Informasi\Pengumuman\PengumumanController@create')->name('pengumuman.create')->middleware("permission:Tambah Pengumuman");
    Route::post('/admin/pengumuman/store', 'Admin\Informasi\Pengumuman\PengumumanController@store')->name('pengumuman.store')->middleware("permission:Tambah Pengumuman");
    Route::get('/admin/pengumuman/show/{id}', 'Admin\Informasi\Pengumuman\PengumumanController@show')->name('pengumuman.show')->middleware("permission:Ubah Pengumuman");
    Route::post('/admin/pengumuman/update/{pengumuman}', 'Admin\Informasi\Pengumuman\PengumumanController@update')->name('pengumuman.update')->middleware("permission:Ubah Pengumuman");
    Route::post('/admin/pengumuman/delete/{id}', 'Admin\Informasi\Pengumuman\PengumumanController@delete')->name('pengumuman.delete')->middleware("permission:Hapus Pengumuman");
    Route::get('/admin/pengumuman/get-img/{id}', 'Admin\Informasi\Pengumuman\PengumumanController@getImage')->name('pengumuman.get_img');

// End Route Menu Informasi



// Start Route Menu Hak Akses

    // Hak Akses
    Route::get('admin/hak-akses/', 'Admin\Permission\PermissionController@semuaPermission')->name("Semua Permission")->middleware("permission:Lihat Hak Akses");
    Route::get('admin/hak-akses/inisiasi/{permission}', 'Admin\Permission\PermissionController@initialPermission')->name("Initial Permission")->middleware("permission:Lihat Hak Akses");
    Route::post('admin/hak-akses/simpan/{permission}', 'Admin\Permission\PermissionController@simpanPermission')->name("Simpan Permission")->middleware("permission:Tambah Hak Akses");
    Route::post('admin/hak-akses/hapus/{adminPermission}', 'Admin\Permission\PermissionController@hapusAkses')->name("Hapus Akses")->middleware("permission:Ubah Hak Akses");

// End Route Menu Hak Akses



//SIG Posyandu
Route::get('/admin/informasi/persebaran-posyandu/home', 'SIGPosyanduController@index')->name('sig-posyandu.home')->middleware('auth:admin');
Route::get('/admin/informasi/sig-posyandu/polos', 'SIGPosyanduController@sigPolosan')->name('sig-posyandu.polos');
Route::get('/admin/informasi/persebaran-posyandu/get-data', 'SIGPosyanduController@getData')->name('sig-posyandu.get_data');
Route::get('/api/kk/show-file/{no_kk}', 'User\Auth\RegisController@showKKFile')->name('kk.show_file');

//Penyuluhan
// Route::get('/admin/penyuluhan/home', 'PenyuluhanController@index')->name('penyuluhan.home')->middleware('auth:admin')->middleware("cek:super admin,head admin,admin,kader,param5");
// Route::get('/admin/penyuluhan/create', 'PenyuluhanController@create')->name('penyuluhan.create')->middleware('auth:admin')->middleware("cek:super admin,head admin,admin,kader,param5");
// Route::post('/admin/penyuluhan/store', 'PenyuluhanController@store')->name('penyuluhan.store')->middleware('auth:admin')->middleware("cek:super admin,head admin,admin,kader,param5");
// Route::get('/admin/penyuluhan/show/{id}', 'PenyuluhanController@show')->name('penyuluhan.show')->middleware('auth:admin')->middleware("cek:super admin,head admin,admin,kader,param5");
// Route::post('/admin/penyuluhan/update/{id}', 'PenyuluhanController@update')->name('penyuluhan.update')->middleware('auth:admin')->middleware("cek:super admin,head admin,admin,kader,param5");
// Route::get('/admin/penyuluhan/get-img/{id}', 'PenyuluhanController@getImage')->name('penyuluhan.get_img');
// Route::post('/admin/penyuluhan/delete', 'PenyuluhanController@delete')->name('penyuluhan.delete')->middleware('auth:admin')->middleware("cek:super admin,head admin,admin,kader,param5");



//Command Bot
Route::get('/admin/command-bot/pertanyaan-konsultasi/home', 'BotCommandController@index')->name('pertanyaan-konsultasi.home');
Route::get('/admin/command-bot/pertanyaan-konsultasi/create', 'BotCommandController@create')->name('pertanyaan-konsultasi.create');
Route::post('/admin/command-bot/pertanyaan-konsultasi/store', 'BotCommandController@store')->name('pertanyaan-konsultasi.store');
Route::get('/admin/command-bot/pertanyaan-konsultasi/show/{id}', 'BotCommandController@show')->name('pertanyaan-konsultasi.show');
Route::get('/admin/command-bot/pertanyaan-konsultasi/kosongkan/{id}', 'BotCommandController@kosongkanParent')->name('pertanyaan-konsultasi.kosongkan');
Route::post('/admin/command-bot/pertanyaan-konsultasi/update/{id}', 'BotCommandController@update')->name('pertanyaan-konsultasi.update');
Route::post('/admin/command-bot/pertanyaan-konsultasi/add-parent', 'BotCommandController@addParent')->name('pertanyaan-konsultasi.add-parent');
Route::post('/admin/command-bot/pertanyaan-konsultasi/delete', 'BotCommandController@delete')->name('pertanyaan-konsultasi.delete');

//Command Statis
Route::get('/admin/command-bot/pertanyaan-satu-arah/home', 'BotCommandControllerStatic@index')->name('pertanyaan-satu-arah.home');
Route::get('/admin/command-bot/pertanyaan-satu-arah/edit/{id}', 'BotCommandControllerStatic@edit')->name('pertanyaan-satu-arah.edit');
Route::post('/admin/command-bot/pertanyaan-satu-arah/update/{id}', 'BotCommandControllerStatic@update')->name('pertanyaan-satu-arah.update');
Route::get('/admin/command-bot/pertanyaan-satu-arah/child/home/{id}', 'BotCommandControllerStatic@indexChild')->name('pertanyaan-satu-arah.child.home');
Route::get('/admin/command-bot/pertanyaan-satu-arah/child/edit/{id}', 'BotCommandControllerStatic@editChild')->name('pertanyaan-satu-arah.child.edit');

//Konsultasi Bot
Route::get('/admin/konsultasi-bot/home', 'KonsultasiBotController@index')->name('konsultasi-bot.home');
Route::get('/admin/konsultasi-bot/show/{id}', 'KonsultasiBotController@show')->name('konsultasi-bot.show');
Route::get('/admin/konsultasi-bot/download/{id}', 'KonsultasiBotController@downloadKonsultasi')->name('konsultasi-bot.download');
Route::get('/admin/konsultasi-bot/send-to-user/{id}', 'KonsultasiBotController@sendHasilToUser')->name('konsultasi-bot.sent-to-user');
Route::post('/admin/konsultasi-bot/update-konsultasi', 'KonsultasiBotController@updateDiagnosa')->name('konsultasi-bot.update');

// Ajax Dependent Select
Route::get('/kecamatan/{id}', 'AjaxSearchLocation@kecamatan');
Route::get('/desa/{id}', 'AjaxSearchLocation@desa');
Route::get('/banjar/{id}', 'AjaxSearchLocation@banjar');
