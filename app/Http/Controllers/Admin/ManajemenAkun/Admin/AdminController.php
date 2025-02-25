<?php

namespace App\Http\Controllers\Admin\ManajemenAkun\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Mover;
use App\Admin;
use App\Permission;
use App\AdminPermission;
use App\Pegawai;
use App\Nakes;
use App\NakesPosyandu;
use App\Posyandu;
use App\Kabupaten;
use App\Kecamatan;
use App\Desa;

class AdminController extends Controller
{
    public function semuaAdmin()
    {
        if (auth()->guard('admin')->user()->role == 'super admin') {
            if (auth()->guard('admin')->user()->superAdmin->area_tugas == 'Provinsi') {

                $admin = Pegawai::where('jabatan', 'admin')->orderBy('nama_pegawai', 'asc')->get();

            } elseif (auth()->guard('admin')->user()->superAdmin->area_tugas == 'Kabupaten') {
                $id_kecamatan = Kecamatan::where('id_kabupaten', auth()->guard('admin')->user()->superAdmin->id_kabupaten)->select('id')->get();
                $id_desa = Desa::whereIn('id_kecamatan', $id_kecamatan->toArray())->select('id')->get();
                $id_posyandu = Posyandu::whereIn('id_desa', $id_desa->toArray())->select('id')->get();

                if ( count($id_posyandu) > 0 ) {
                    $admin = Pegawai::where('jabatan', 'admin')->whereIn('id_posyandu', $id_posyandu->toArray())->orderBy('nama_pegawai', 'asc')->get();
                } else {
                    $admin = NULL;
                }
            } elseif (auth()->guard('admin')->user()->superAdmin->area_tugas == 'Kecamatan') {
                $id_desa = Desa::where('id_kecamatan', auth()->guard('admin')->user()->superAdmin->id_kecamatan)->select('id')->get();
                $id_posyandu = Posyandu::whereIn('id_desa', $id_desa->toArray())->select('id')->get();

                if ( count($id_posyandu) > 0 ) {
                    $admin = Pegawai::where('jabatan', 'admin')->whereIn('id_posyandu', $id_posyandu->toArray())->orderBy('nama_pegawai', 'asc')->get();
                } else {
                    $admin = NULL;
                }
            }
        } elseif (auth()->guard('admin')->user()->role == 'tenaga kesehatan') {
            $nakes = NakesPosyandu::where('id_nakes', auth()->guard('admin')->user()->nakes->id)->select('id_posyandu')->get();
            $admin = Pegawai::where('jabatan', 'admin')->whereIn('id_posyandu', $nakes->toArray())->orderBy('nama_pegawai', 'asc')->get();
        } elseif (auth()->guard('admin')->user()->role == 'pegawai') {
            $admin = Pegawai::where('id_posyandu', auth()->guard('admin')->user()->pegawai->id_posyandu)->where('jabatan', 'admin')->orderBy('id', 'desc')->get();
        }

        return view('admin.manajemen-akun.admin.admin.semua-admin', compact('admin'));
    }

    public function tambahAdmin()
    {
        if (auth()->guard('admin')->user()->role == 'super admin') {
            if (auth()->guard('admin')->user()->superAdmin->area_tugas == 'Provinsi') {
                $posyandu = Posyandu::all();
            } elseif (auth()->guard('admin')->user()->superAdmin->area_tugas == 'Kabupaten') {
                $id_kecamatan = Kecamatan::where('id_kabupaten', auth()->guard('admin')->user()->superAdmin->id_kabupaten)->select('id')->get();
                $id_desa = Desa::whereIn('id_kecamatan', $id_kecamatan->toArray())->select('id')->get();
                $posyandu = Posyandu::whereIn('id_desa', $id_desa->toArray())->get();
            } elseif (auth()->guard('admin')->user()->superAdmin->area_tugas == 'Kecamatan') {
                $id_desa = Desa::where('id_kecamatan', auth()->guard('admin')->user()->superAdmin->id_kecamatan)->select('id')->get();
                $posyandu = Posyandu::whereIn('id_desa', $id_desa->toArray())->get();
            }
        } elseif (auth()->guard('admin')->user()->role == 'tenaga kesehatan') {
            $nakes = NakesPosyandu::where('id_nakes', auth()->guard('admin')->user()->nakes->id)->select('id_posyandu')->get();
            $posyandu = Posyandu::whereIn('id', $nakes->toArray())->get();
        } elseif (auth()->guard('admin')->user()->role == 'pegawai') {
            $posyandu = Posyandu::where('id', auth()->guard('admin')->user()->pegawai->id_posyandu)->get();
        }

        return view('admin.manajemen-akun.admin.admin.tambah-admin',compact('posyandu'));
    }

    public function simpanAdmin(Request $request)
    {
        $this->validate($request,[
            'name' => "required|regex:/^[a-z ,.'-]+$/i|min:2|max:50",
            'email' => "required|email|unique:tb_admin,email",
            'tempat_lahir' => "required|regex:/^[a-z ]+$/i|min:3|max:50",
            'tgl_lahir' => "required|date",
            'gender' => "required",
            'nik' => "required|numeric|unique:tb_pegawai,nik|digits:16",
            'file'=> 'required|image|mimes:jpeg,png,jpg|max:2048',
            'alamat' => "required|regex:/^[a-z0-9 ,.'-]+$/i|min:5",
            'jabatan' => "required",
            'tlpn' => "nullable|numeric|unique:tb_pegawai,nomor_telepon|digits_between:11,15",
            'lokasi_posyandu' => "required",
            'telegram' => "nullable|max:25|unique:tb_pegawai,username_telegram",
            'password' => 'required|min:8',
        ],
        [
            'name.required' => "Nama lengkap wajib diisi",
            'name.regex' => "Format nama tidak sesuai",
            'name.min' => "Nama lengkap minimal berjumlah 2 karakter",
            'name.max' => "Nama lengkap maksimal berjumlah 50 karakter",
            'email.required' => "Email wajib diisi",
            'email.email' => "Masukan format email yang sesuai",
            'email.unique' => "Email sudah digunakan",
            'tempat_lahir.required' => "Tampat lahir wajib diisi",
            'tempat_lahir.regex' => "Format tempat lahir tidak sesuai",
            'tempat_lahir.min' => "Tempat lahir minimal berjumlah 3 karakter",
            'tempat_lahir.min' => "Tempat lahir maksimal berjumlah 50 karakter",
            'tgl_lahir.required' => "Tanggal lahir wajib diisi",
            'tgl_lahir.date' => "Tanggal lahir harus berformat tanggal",
            'gender.required' => "Jenis kelamin wajib diisi",
            'nik.required' => "NIK wajib diisi",
            'nik.numeric' => "NIK harus berupa angka",
            'nik.unique' => "NIK sudah digunakan",
            'nik.digits' => "NIK harus berjumlah 16 karakter",
            'file.required' => "Upload Scan KTP Wajib diisi",
            'file.image' => "Gambar yang di unggah harus berupa jpeg png atau jpg ",
            'file.mimes' => "Format gambar harus jpeg, png atau jpg",
            'file.size' => "Gambar maksimal berukuran 2 Mb",
            'alamat.required' => "Alamat wajib diisi",
            'alamat.regex' => "Format alamat tidak sesuai",
            'alamat.regex' => "Alamat minimal berjumlah 2 karakter",
            'jabatan.required' => "Jabatan wajib diiisi",
            'tlpn.required' => "Nomor telepon wajib diisi",
            'tlpn.numeric' => "Nomor telepon harus berupa angka",
            'tlpn.digits_between' => "Nomor telepon harus berjumlah 11 sampai 15 karakter",
            'tlpn.unique' => "Nomor telepon sudah pernah digunakan",
            'lokasi_posyandu.required' => "Posyandu tempat bertugas wajib diisi",
            'telegram.max' => "Username telegram maksimal berjumlah 25 karakter",
            'telegram.unique' => "Username telegram pernah digunakan",
            'password.required' => "Password wajib diisi",
            'password.min' => "Password minimal 8 karakter",
        ]);

        $umur = Carbon::parse($request->tgl_lahir)->age;

        if ($umur < 19) {
            return redirect()->back()->with(['error' => 'Tidak Dapat Menambahkan Akun. Usia Tidak Mencukupi']);
        } else {

            // Ubah format tanggal //
            $tgl_lahir_indo = $request->tgl_lahir;
            $tgl_lahir_eng = explode("-", $tgl_lahir_indo);
            $tahun = $tgl_lahir_eng[2];
            $bulan = $tgl_lahir_eng[1];
            $tgl = $tgl_lahir_eng[0];
            $tgl_lahir = $tahun.$bulan.$tgl;

            $filename = Mover::slugFile($request->file('file'), 'images/upload/ktp/');

            if ($filename) {
                $admin = Admin::create([
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'profile_image' => '/images/upload/Profile/default.jpg',
                    'is_verified' => 1,
                    'role' => 'pegawai',
                ]);
            } else {
                return redirect()->back()->with(['failed' => 'Akun Gagal Ditambahkan']);
            }

            if ($admin) {
                $pegawai = Pegawai::create([
                    'id_posyandu' => $request->lokasi_posyandu,
                    'id_admin' => $admin->id,
                    'nama_pegawai' => $request->name,
                    'tempat_lahir' => $request->tempat_lahir,
                    'tanggal_lahir' => $tgl_lahir,
                    'jenis_kelamin' => $request->gender,
                    'alamat' => $request->alamat,
                    'jabatan' => $request->jabatan,
                    'nomor_telepon' => $request->tlpn,
                    'status' => 'tidak tersedia',
                    'username_telegram' => '',
                    'nik' => $request->nik,
                    'file_ktp' => $filename,
                ]);
            } else {
                return redirect()->back()->with(['failed' => 'Akun Gagal Ditambahkan']);
            }

            $nama_permission = ['Lihat Super Admin, Lihat Tenaga Kesehatan', 'Lihat Head Admin', 'Lihat Admin', 'Lihat Kader', 'Tambah Kader', 'Ubah Kader', 'Nonaktifkan Kader', 'Konfirmasi Anggota', 'Lihat Anggota', 'Nonaktifkan Anggota', 'Tambah Anggota', 'Ubah Anggota', 'Lihat Imunisasi', 'Lihat Vitamin', 'Batalkan Kegiatan', 'Broadcast Kegiatan', 'Hapus Dokumentasi Kegiatan', 'Lihat Kegiatan', 'Lihat Riwayat Kegiatan', 'Tambah Dokumentasi Kegiatan', 'Tambah Kegiatan', 'Ubah Dokumentasi Kegaitan', 'Ubah Kegiatan', 'Lihat Dokumentasi Kegiatan', 'Hapus Berita', 'Lihat Berita', 'Lihat Tag Berita', 'Tambah Berita', 'Ubah Berita', 'Ubah Status Publikasi Berita'];

            $permission = Permission::whereIn('nama_permission', $nama_permission)->get();

            foreach ($permission as $data) {
                $id_permission[] = $data->id;
            }

            foreach ($id_permission as $data => $value) {
                $admin_permission = AdminPermission::create([
                    'id_admin' => $admin->id,
                    'id_permission' => $id_permission[$data],
                ]);
            }

            if ($filename && $admin && $pegawai && $admin_permission) {
                return redirect()->back()->with(['success' => 'Akun Admin Berhasil Ditambahkan']);
            } else {
                return redirect()->back()->with(['failed' => 'Data Admin Akun Gagal Ditambahkan']);
            }
        }
    }

    public function detailAdmin(Pegawai $pegawai)
    {
        return view('admin.manajemen-akun.admin.admin.detail-admin', compact('pegawai'));
    }

    public function updateAdmin(Request $request, Pegawai $pegawai)
    {
        if ($pegawai->nik == $request->nik) {
            $request->validate([
                'nama' => "required|regex:/^[a-z ,.'-]+$/i|min:2|max:50",
                'nik' => "required|numeric|digits:16",
                'tempat_lahir' => "required|min:3|max:50",
                'tgl_lahir' => "required|date",
            ],
            [
                'nama.required' => "Nama wajib diisi",
                'nama.regex' => "Format penulisan nama tidak sesuai",
                'nama.min' => "Nama minimal berjumlah 3 karakter",
                'nama.max' => "Nama maksimal berjumlah 50 karakter",
                'nik.required' => "NIK wajib diisi",
                'nik.regex' => "NIK harus berupa angka",
                'nik.digits' => "NIK harus berjumlah 16 karakter",
                'nik.unique' => "NIK sudah pernah digunakan",
                'tempat_lahir.required' => "Tempat lahir wajib diisi",
                'tempat_lahir.min' => "Penulisan tempat lahir miniminal berjumlah 3 karakter",
                'tempat_lahir.max' => "Penulisan tempat lahir maksimal berjumlah 50 karakter",
                'tgl_lahir.required' => "Tanggal lahir wajib diisi",
                'tgl_lahir.date' => "Tanggal lahir harus berupa tanggal",
            ]);
        } else {
            $request->validate([
                'nama' => "required|regex:/^[a-z ,.'-]+$/i|min:2|max:50",
                'nik' => "required|numeric|digits:16|unique:tb_pegawai,nik",
                'tempat_lahir' => "required|min:3|max:50",
                'tgl_lahir' => "required|date",
            ],
            [
                'nama.required' => "Nama wajib diisi",
                'nama.regex' => "Format penulisan nama tidak sesuai",
                'nama.min' => "Nama minimal berjumlah 3 karakter",
                'nama.max' => "Nama maksimal berjumlah 50 karakter",
                'nik.required' => "NIK wajib diisi",
                'nik.regex' => "NIK harus berupa angka",
                'nik.digits' => "NIK harus berjumlah 16 karakter",
                'nik.unique' => "NIK tidak dapat digunakan",
                'tempat_lahir.required' => "Tempat lahir wajib diisi",
                'tempat_lahir.min' => "Penulisan tempat lahir miniminal berjumlah 3 karakter",
                'tempat_lahir.max' => "Penulisan tempat lahir maksimal berjumlah 50 karakter",
                'tgl_lahir.required' => "Tanggal lahir wajib diisi",
                'tgl_lahir.date' => "Tanggal lahir harus berupa tanggal",
            ]);
        }

        $umur = Carbon::parse($request->tgl_lahir)->age;

        if ($umur < 19) {
            return redirect()->back()->with(['error' => 'Tidak Dapat Memperbaharui Akun. Usia Tidak Mencukupi']);
        } else {

            // Ubah format tanggal //
            $tgl_lahir_indo = $request->tgl_lahir;
            $tgl_lahir_eng = explode("-", $tgl_lahir_indo);
            $tahun = $tgl_lahir_eng[2];
            $bulan = $tgl_lahir_eng[1];
            $tgl = $tgl_lahir_eng[0];
            $tgl_lahir = $tahun.$bulan.$tgl;

            $update_head_admin = Pegawai::where('id', $pegawai->id)->update([
                'nama_pegawai' => $request->nama,
                'nik' => $request->nik,
                'tempat_lahir' => $request->tempat_lahir,
                'tanggal_lahir' => $tgl_lahir,
            ]);

            if ($update_head_admin) {
                return redirect()->back()->with(['success' => 'Profil Admin Berhasil Diperbaharui']);
            } else {
                return redirect()->back()->with(['failed' => 'Profile Admin Gagal Diperbaharui']);
            }
        }
    }
}
