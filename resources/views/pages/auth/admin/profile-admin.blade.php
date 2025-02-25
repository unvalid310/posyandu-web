@extends('layouts/admin/admin-layout')

@section('title', 'My Profile')

@push('css')
    <style>
        .image {
            width: 150px;
            height: 150px;
            overflow: hidden;
        }

        .image img {
            object-fit: cover;
            width: 150px;
            height: 150px;
        }
    </style>
@endpush

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h3 col-lg-auto text-center text-md-start">Data Profile</h1>
        <div class="col-auto ml-auto text-right mt-n1">
            <nav aria-label="breadcrumb text-center">
                <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                    <li class="breadcrumb-item"><a class="text-decoration-none" href="{{ route('Admin Home') }}">Posyandu</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Data Profile</li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="container-fluid px-0">
        <div class="row">
            @if ($errors->any())
                <div class="alert alert-danger text-center" role="alert">
                    <span>Terdapat kesalahan dalam penginputan data. Periksa kembali input data sebelumnya!</span>
                </div>
            @endif
            <div class="col-md-5">
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <div class="image mx-auto d-block rounded">
                                <img class="profile-user-img img-fluid img-circle mx-auto d-block"
                                    src="{{ route('profile.admin.get_img') }}?{{ date('YmdHis') }}" alt="Profile Admin"
                                    width="150" height="150">
                            </div>
                        </div>
                        @if (Auth::guard('admin')->user()->role == 'super admin')
                            <h3 class="profile-username text-center">
                                {{ Auth::guard('admin')->user()->superAdmin->nama_super_admin }}</h3>
                        @endif
                        @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                            <h3 class="profile-username text-center">{{ Auth::guard('admin')->user()->nakes->nama_nakes }}
                            </h3>
                        @endif
                        @if (Auth::guard('admin')->user()->role == 'pegawai')
                            <h3 class="profile-username text-center">
                                {{ Auth::guard('admin')->user()->pegawai->nama_pegawai }}</h3>
                        @endif
                        <p class="text-muted text-center">{{ Auth::guard('admin')->user()->email }}</p>
                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b class="fw-bold">Jabatan</b>
                                @if (Auth::guard('admin')->user()->role == 'super admin')
                                    <a class="float-right text-decoration-none link-dark">Super Admin</a>
                                @endif
                                @if (Auth::guard('admin')->user()->role == 'pegawai')
                                    @if (Auth::guard('admin')->user()->pegawai->jabatan == 'head admin')
                                        <a class="float-right text-decoration-none link-dark">Head Admin</a>
                                    @endif
                                    @if (Auth::guard('admin')->user()->pegawai->jabatan == 'admin')
                                        <a class="float-right text-decoration-none link-dark">Administrator</a>
                                    @endif
                                    @if (Auth::guard('admin')->user()->pegawai->jabatan == 'kader')
                                        <a class="float-right text-decoration-none link-dark">Kader Posyandu</a>
                                    @endif
                                @endif
                                @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                    <a class="float-right text-decoration-none link-dark">Tenaga Kesehatan</a>
                                @endif
                            </li>
                            <li class="list-group-item">
                                <b class="fw-bold">Tempat Tugas</b>
                                @if (Auth::guard('admin')->user()->role == 'super admin')
                                    <a
                                        class="float-right text-decoration-none link-dark">{{ Auth::guard('admin')->user()->superAdmin->kecamatan->nama_kecamatan }}</a>
                                @endif
                                @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                    <a class="float-right text-decoration-none link-dark">
                                        @foreach ($nakesPosyandu->where('id_nakes', Auth::guard('admin')->user()->nakes->id) as $data)
                                            {{ $data->posyandu->nama_posyandu }}.
                                        @endforeach
                                    </a>
                                @endif
                                @if (Auth::guard('admin')->user()->role == 'pegawai')
                                    <a
                                        class="float-right text-decoration-none link-dark">{{ Auth::guard('admin')->user()->pegawai->posyandu->nama_posyandu }}</a>
                                @endif
                            </li>
                            {{-- @if (Auth::guard('admin')->user()->nakes->jabatan == 'tenaga kesehatan')
                                <li class="list-group-item">
                                    <b class="fw-bold">Konsultasi</b>
                                    @if (Auth::guard('admin')->user()->pegawai->status == 'tidak tersedia')
                                        <a href="" class="float-right text-decoration-none link-primary" data-bs-toggle="modal" data-bs-target="#statusKonsultasi">Tidak Tersedia</a>
                                    @endif
                                    @if (Auth::guard('admin')->user()->pegawai->status == 'tersedia')
                                        <a href="" class="float-right text-decoration-none link-primary" data-bs-toggle="modal" data-bs-target="#statusKonsultasi">Tersedia</a>
                                    @endif
                                    @include('modal/admin/status-konsultasi')
                                </li>
                            @endif --}}
                            <li class="list-group-item">
                                <b class="fw-bold">Terdaftar Sejak</b>
                                <a
                                    class="float-right text-decoration-none link-dark">{{ date('d M Y', strtotime(Auth::guard('admin')->user()->created_at)) }}</a>
                            </li>
                        </ul>
                        <form action="{{ route('logout.admin') }}">
                            @csrf
                            <button href="" class="btn btn-outline-danger btn-block">
                                <b>Logout</b>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link active" href="#account-admin" data-toggle="tab">Akun</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="#personal" data-toggle="tab">Personal</a></li>
                            <li class="nav-item"><a class="nav-link" href="#edit-profile" data-toggle="tab">Edit</a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane active" id="account-admin">
                                @if (Auth::guard('admin')->user()->role == 'super admin')
                                    <form action="{{ route('edit.account.superadmin') }}" method="POST"
                                        class="form-horizontal">
                                        @csrf
                                        <div class="form-group row">
                                            <label for="inputEmail" class="col-sm-2 col-form-label">E-Mail<span
                                                    class="text-danger">*</span></label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="email" type="email"
                                                    class="form-control @error('email') is-invalid @enderror"
                                                    id="inputEmail" placeholder="Alamat E-Mail"
                                                    value="{{ old('email', Auth::guard('admin')->user()->email) }}"
                                                    autocomplete="off">
                                                @error('email')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputTele" class="col-sm-2 col-form-label">Telegram</label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="telegram" type="text"
                                                    class="form-control @error('telegram') is-invalid @enderror"
                                                    id="inputTele" placeholder="Username Telegram"
                                                    value="{{ old('telegram', Auth::guard('admin')->user()->superAdmin->username_telegram) }}"
                                                    autocomplete="off">
                                                @error('telegram')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputTelp" class="col-sm-2 col-form-label">Nomor Telp</label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="no_tlpn" type="text"
                                                    class="form-control @error('no_tlpn') is-invalid @enderror"
                                                    id="inputTelp" placeholder="Nomor Telepon"
                                                    value="{{ old('no_tlpn', Auth::guard('admin')->user()->superAdmin->nomor_telepon) }}"
                                                    autocomplete="off">
                                                @error('no_tlpn')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-12 d-grid">
                                                <button type="submit" class="btn btn-outline-success my-1">Simpan
                                                    Data</button>
                                            </div>
                                        </div>
                                    </form>
                                @endif
                                @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                    <form action="{{ route('edit.account') }}" method="POST" class="form-horizontal">
                                        @csrf
                                        <div class="form-group row">
                                            <label for="inputEmail" class="col-sm-2 col-form-label">E-Mail<span
                                                    class="text-danger">*</span></label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="email" type="email"
                                                    class="form-control @error('email') is-invalid @enderror"
                                                    id="inputEmail" placeholder="Alamat E-Mail"
                                                    value="{{ old('email', Auth::guard('admin')->user()->email) }}"
                                                    autocomplete="off">
                                                @error('email')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputTele" class="col-sm-2 col-form-label">Telegram</label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="telegram" type="text"
                                                    class="form-control @error('telegram') is-invalid @enderror"
                                                    id="inputTele" placeholder="Username Telegram"
                                                    value="{{ old('telegram', Auth::guard('admin')->user()->nakes->username_telegram) }}"
                                                    autocomplete="off">
                                                @error('telegram')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputTelp" class="col-sm-2 col-form-label">Nomor Telp</label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="no_tlpn" type="text"
                                                    class="form-control @error('no_tlpn') is-invalid @enderror"
                                                    id="inputTelp" placeholder="Nomor Telepon"
                                                    value="{{ old('no_tlpn', Auth::guard('admin')->user()->nakes->nomor_telepon) }}"
                                                    autocomplete="off">
                                                @error('no_tlpn')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-12 d-grid">
                                                <button type="submit" class="btn btn-outline-success my-1">Simpan
                                                    Data</button>
                                            </div>
                                        </div>
                                    </form>
                                @endif
                                @if (Auth::guard('admin')->user()->role == 'pegawai')
                                    <form action="{{ route('edit.account') }}" method="POST" class="form-horizontal">
                                        @csrf
                                        <div class="form-group row">
                                            <label for="inputEmail" class="col-sm-2 col-form-label">E-Mail<span
                                                    class="text-danger">*</span></label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="email" type="email"
                                                    class="form-control @error('email') is-invalid @enderror"
                                                    id="inputEmail" placeholder="Alamat E-Mail"
                                                    value="{{ old('email', Auth::guard('admin')->user()->email) }}"
                                                    autocomplete="off">
                                                @error('email')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputTele" class="col-sm-2 col-form-label">Telegram</label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="telegram" type="text"
                                                    class="form-control @error('telegram') is-invalid @enderror"
                                                    id="inputTele" placeholder="Username Telegram"
                                                    value="{{ old('telegram', Auth::guard('admin')->user()->pegawai->username_telegram) }}"
                                                    autocomplete="off">
                                                @error('telegram')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputTelp" class="col-sm-2 col-form-label">Nomor Telp</label>
                                            <div class="col-sm-10 my-auto">
                                                <input name="no_tlpn" type="text"
                                                    class="form-control @error('no_tlpn') is-invalid @enderror"
                                                    id="inputTelp" placeholder="Nomor Telepon"
                                                    value="{{ old('no_tlpn', Auth::guard('admin')->user()->pegawai->nomor_telepon) }}"
                                                    autocomplete="off">
                                                @error('no_tlpn')
                                                    <div class="invalid-feedback text-start">
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-12 d-grid">
                                                <button type="submit" class="btn btn-outline-success my-1">Simpan
                                                    Data</button>
                                            </div>
                                        </div>
                                    </form>
                                @endif
                            </div>
                            <div class="tab-pane" id="personal">
                                <div class="form-group row">
                                    <label for="inputNama" class="col-sm-2 col-form-label">Nama</label>
                                    <div class="col-sm-10 my-auto">
                                        @if (Auth::guard('admin')->user()->role == 'super admin')
                                            <input type="email" class="form-control" id="inputNama" placeholder="Nama"
                                                disabled readonly
                                                value="{{ Auth::guard('admin')->user()->superAdmin->nama_super_admin }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                            <input type="email" class="form-control" id="inputNama" placeholder="Nama"
                                                disabled readonly
                                                value="{{ Auth::guard('admin')->user()->nakes->nama_nakes }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'pegawai')
                                            <input type="email" class="form-control" id="inputNama" placeholder="Nama"
                                                disabled readonly
                                                value="{{ Auth::guard('admin')->user()->pegawai->nama_pegawai }}">
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputNIK" class="col-sm-2 col-form-label">NIK</label>
                                    <div class="col-sm-10 my-auto">
                                        @if (Auth::guard('admin')->user()->role == 'super admin')
                                            <input type="text" class="form-control" id="inputNIK" placeholder="NIK"
                                                disabled readonly
                                                value="{{ Auth::guard('admin')->user()->superAdmin->nik }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                            <input type="text" class="form-control" id="inputNIK" placeholder="NIK"
                                                disabled readonly value="{{ Auth::guard('admin')->user()->nakes->nik }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'pegawai')
                                            <input type="text" class="form-control" id="inputNIK" placeholder="NIK"
                                                disabled readonly
                                                value="{{ Auth::guard('admin')->user()->pegawai->nik }}">
                                        @endif
                                    </div>
                                </div>
                                @if (Auth::guard('admin')->user()->role == 'super admin')
                                    <div class="form-group row">
                                        <label for="inputNIK" class="col-sm-2 col-form-label">NIP</label>
                                        <div class="col-sm-10 my-auto">
                                            <input type="text" class="form-control" id="inputNIK" placeholder="NIK"
                                                disabled readonly
                                                value="{{ Auth::guard('admin')->user()->superAdmin->nip }}">
                                        </div>
                                    </div>
                                @endif
                                <div class="form-group row">
                                    <label for="inputTempatLahir" class="col-sm-2 col-form-label">Tempat Lahir</label>
                                    <div class="col-sm-10 my-auto">
                                        @if (Auth::guard('admin')->user()->role == 'super admin')
                                            <input type="text" class="form-control" id="inputTempatLahir"
                                                placeholder="Tempat Lahir" disabled readonly
                                                value="{{ Auth::guard('admin')->user()->superAdmin->tempat_lahir }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                            <input type="text" class="form-control" id="inputTempatLahir"
                                                placeholder="Tempat Lahir" disabled readonly
                                                value="{{ Auth::guard('admin')->user()->nakes->tempat_lahir }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'pegawai')
                                            <input type="text" class="form-control" id="inputTempatLahir"
                                                placeholder="Tempat Lahir" disabled readonly
                                                value="{{ Auth::guard('admin')->user()->pegawai->tempat_lahir }}">
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputTglLahir" class="col-sm-2 col-form-label">Tanggal Lahir</label>
                                    <div class="col-sm-10 my-auto">
                                        @if (Auth::guard('admin')->user()->role == 'super admin')
                                            <input type="text" class="form-control" id="inputTglLahir"
                                                placeholder="Tanggal Lahir" disabled readonly
                                                value="{{ date('d M Y', strtotime(Auth::guard('admin')->user()->superAdmin->tanggal_lahir)) }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                            <input type="text" class="form-control" id="inputTglLahir"
                                                placeholder="Tanggal Lahir" disabled readonly
                                                value="{{ date('d M Y', strtotime(Auth::guard('admin')->user()->nakes->tanggal_lahir)) }}">
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'pegawai')
                                            <input type="text" class="form-control" id="inputTglLahir"
                                                placeholder="Tanggal Lahir" disabled readonly
                                                value="{{ date('d M Y', strtotime(Auth::guard('admin')->user()->pegawai->tanggal_lahir)) }}">
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row my-auto">
                                    <label for="inputAlamat" class="col-sm-2 col-form-label">Alamat</label>
                                    <div class="col-sm-10">
                                        @if (Auth::guard('admin')->user()->role == 'super admin')
                                            <textarea class="form-control" id="inputAlamat" placeholder="Alamat Lengkap" disabled readonly>{{ Auth::guard('admin')->user()->superAdmin->alamat }}</textarea>
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                            <textarea class="form-control" id="inputAlamat" placeholder="Alamat Lengkap" disabled readonly>{{ Auth::guard('admin')->user()->nakes->alamat }}</textarea>
                                        @endif
                                        @if (Auth::guard('admin')->user()->role == 'pegawai')
                                            <textarea class="form-control" id="inputAlamat" placeholder="Alamat Lengkap" disabled readonly>{{ Auth::guard('admin')->user()->pegawai->alamat }}</textarea>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="edit-profile">
                                <form action="{{ route('edit.profile.admin') }}" enctype="multipart/form-data"
                                    method="post">
                                    @csrf
                                    <label class="fs-4 fw-bold text-center d-grid">Ubah Foto Profile</label>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label for="inputTelp" class="col-sm-3 col-form-label">Foto Profile<span
                                                    class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="custom-file">
                                                    <input type="file" name="file" autocomplete="off"
                                                        class="custom-file-input @error('file') is-invalid @enderror"
                                                        id="inputTelp"autocomplete="off">
                                                    <label class="custom-file-label" for="exampleInputFile">Pilih foto
                                                        profile</label>
                                                    @error('file')
                                                        <div class="invalid-feedback text-start">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-right mb-2">
                                            <span class="text-danger">* Data Wajib diisi</span>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-12 text-end">
                                                <button id="test" type="submit"
                                                    class="btn btn-sm btn-outline-success my-1">Simpan Foto
                                                    Profile</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="border border-bottom border-primary my-4"></div>
                                <form action="{{ route('edit.password') }}" class="form-horizontal" method="POST">
                                    <label class="fs-4 fw-bold text-center d-grid mb-4">Ubah Password</label>
                                    @csrf
                                    <div class="form-group row">
                                        <label for="inputTelp" class="col-sm-3 col-form-label">Password Lama<span
                                                class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="password" name="password_lama" autocomplete="off"
                                                class="form-control @error('password_lama') is-invalid @enderror"
                                                id="inputTelp" placeholder="Password Lama" autocomplete="off">
                                            @error('password_lama')
                                                <div class="invalid-feedback text-start">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputTelp" class="col-sm-3 col-form-label">Password Baru<span
                                                class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="password" name="password" autocomplete="off"
                                                class="form-control @error('password') is-invalid @enderror"
                                                id="inputTelp" placeholder="Password Baru" autocomplete="off">
                                            @error('password')
                                                <div class="invalid-feedback text-start">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row pb-0 mb-0">
                                        <label for="inputTelp" class="col-sm-3 col-form-label">Konfirmasi Password
                                            Baru<span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="password" name="password_confirmation" autocomplete="off"
                                                class="form-control @error('password_confirmation') is-invalid @enderror"
                                                value="{{ old('password_confirmation') }}" id="inputTelp"
                                                placeholder="Konfirmasi Password" autocomplete="off">
                                            @error('password_confirmation')
                                                <div class="invalid-feedback text-start">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="text-right mb-2">
                                        <span class="text-danger">* Data Wajib diisi</span>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-12 text-end">
                                            <button id="test" type="submit"
                                                class="btn btn-sm btn-outline-success my-1">Simpan Password</button>
                                        </div>
                                    </div>
                                </form>
                                {{-- @include('modal/admin/change-profile') --}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script src="{{ url('base-template/plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="{{ url('base-template/plugins/moment/moment.min.js') }}"></script>
    <script src="{{ url('base-template/plugins/inputmask/jquery.inputmask.min.js') }}"></script>
    <script src="{{ url('base-template/plugins/bs-custom-file-input/bs-custom-file-input.min.js') }}"></script>

    <script>
        $(document).ready(function() {
            $('#list-admin-account').addClass('menu-is-opening menu-open');
            $('#list-admin-account-link').addClass('active');
            $('#profile-admin').addClass('active');
        });
        // Custom Input Date
        $(function() {
            bsCustomFileInput.init();
            $('.select2').select2()
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
            $('#datemask').inputmask('dd/mm/yyyy', {
                'placeholder': 'dd/mm/yyyy'
            })
            $('[data-mask]').inputmask()
        })
    </script>

    @if ($message = Session::get('failed'))
        <script>
            $(document).ready(function() {
                alertDanger('{{ $message }}');
            });
        </script>
    @endif

    @if ($message = Session::get('error'))
        <script>
            $(document).ready(function() {
                alertError('{{ $message }}');
            });
        </script>
    @endif

    @if ($message = Session::get('success'))
        <script>
            $(document).ready(function() {
                alertSuccess('{{ $message }}');
            });
        </script>
    @endif
@endpush
