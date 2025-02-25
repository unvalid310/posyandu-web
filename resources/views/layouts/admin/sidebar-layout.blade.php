<aside class="main-sidebar sidebar-dark-primary elevation-2">

    {{-- Brand Logo Start --}}
    <a href="{{ route('Admin Home') }}" class="brand-link text-decoration-none">
        <img src="{{ asset('/images/sipandu-logo.png') }}" alt="Posyandu Logo" class="brand-image img-circle elevation-3"
            style="opacity: .8">
        <span class="brand-text fw-bold fs-6">Posyandu</span>
    </a>
    {{-- Brand Logo End --}}

    <!-- Sidebar Menu Start -->
    <div class="sidebar">
        <nav class="mt-2 mb-5 pb-5">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <li class="nav-item" id="list-admin-account">
                    <a href="#" class="nav-link" id="list-admin-account-link">
                        <i class="nav-icon fas fa-user-circle"></i>
                        <p>
                            @if (Auth::guard('admin')->user()->role == 'super admin')
                                Super Admin
                            @endif
                            @if (Auth::guard('admin')->user()->role == 'tenaga kesehatan')
                                Nakes
                            @endif
                            @if (Auth::guard('admin')->user()->role == 'pegawai')
                                @if (Auth::guard('admin')->user()->pegawai->jabatan == 'head admin')
                                    Head Admin
                                @endif
                                @if (Auth::guard('admin')->user()->pegawai->jabatan == 'admin')
                                    Admin
                                @endif
                                @if (Auth::guard('admin')->user()->pegawai->jabatan == 'kader')
                                    Kader
                                @endif
                            @endif
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('profile.admin') }}" id="profile-admin" class="nav-link">
                                <i class="nav-icon fas fa-id-badge"></i>
                                <p>Profile Pribadi</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <form action="{{ route('logout.admin') }}" class="nav-link p-0 m-0">
                                @csrf
                                <button class="nav-link text-danger text-start btn-block">
                                    <i class="nav-icon fas fa-power-off"></i>
                                    <p>Logout</p>
                                </button>
                            </form>
                        </li>
                    </ul>
                </li>
                <div class="dropdown-divider"></div>
                <li class="nav-item">
                    <a href="{{ route('Admin Home') }}" id="admin-dashboard" class="nav-link">
                        <i class="nav-icon fas fa-house-user"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                @if (auth()->guard('admin')->user()->role != 'pegawai')
                    <li class="nav-item">
                        <a href="{{ route('Data Posyandu') }}" id="data-posyandu" class="nav-link">
                            <i class="nav-icon fas fa-hospital-user"></i>
                            <p>Data Posyandu</p>
                        </a>
                    </li>
                @else
                    <li class="nav-item">
                        <a href="{{ route('Detail Posyandu', auth()->guard('admin')->user()->pegawai->id_posyandu) }}"
                            id="data-posyandu" class="nav-link">
                            <i class="nav-icon fas fa-hospital-user"></i>
                            <p>Profile Posyandu</p>
                        </a>
                    </li>
                @endif

                @menu(['Lihat Super Admin', 'Lihat Tenaga Kesehatan', 'Lihat Admin', 'Lihat Kader', 'Lihat Anggota'])
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="account-management">
                        <a href="#" class="nav-link" id="account">
                            <i class="nav-icon fas fa-users-cog"></i>
                            <p>
                                Manajemen Akun
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            @permission('Lihat Super Admin')
                                <li class="nav-item">
                                    <a href="{{ route('Data Super Admin') }}" class="nav-link" id="data-super-admin">
                                        <i class="nav-icon fas fa-user-cog"></i>
                                        <p>Data Super Admin</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Tenaga Kesehatan')
                                <li class="nav-item">
                                    <a href="{{ route('Data Nakes') }}" class="nav-link" id="data-nakes">
                                        <i class="nav-icon fas fa-user-nurse"></i>
                                        <p>Data Nakes</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Head Admin')
                                <li class="nav-item">
                                    <a href="{{ route('Data Head Admin') }}" class="nav-link" id="data-head-admin">
                                        <i class="nav-icon fas fa-user-lock"></i>
                                        <p>Data Head Admin</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Admin')
                                <li class="nav-item">
                                    <a href="{{ route('Data Admin') }}" class="nav-link" id="data-admin">
                                        <i class="nav-icon fas fa-user-shield"></i>
                                        <p>Data Admin</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Kader')
                                <li class="nav-item">
                                    <a href="{{ route('Data Kader') }}" class="nav-link" id="data-kader">
                                        <i class="nav-icon fas fa-user-tag"></i>
                                        <p>Data Kader</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Anggota')
                                <li class="nav-item">
                                    <a href="{{ route('Data Anggota') }}" class="nav-link" id="data-anggota">
                                        <i class="nav-icon fas fa-users"></i>
                                        <p>Anggota Posyandu</p>
                                    </a>
                                </li>
                            @endpermission
                        </ul>
                    </li>
                    </li>
                @endmenu

                @menu(['Konfirmasi Anggota', 'Ganti Jabatan'])
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="account-setting">
                        <a href="#" class="nav-link" id="setting">
                            <i class="nav-icon fas fa-cogs"></i>
                            <p>
                                Pengaturan Akun
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            @permission('Konfirmasi Anggota')
                                <li class="nav-item" id="list-data-user-verify">
                                    <a href="{{ route('Verifikasi Anggota') }}" id="verify-anggota" class="nav-link">
                                        <i class="nav-icon fas fa-user-check"></i>
                                        <p>Konfirmasi Anggota</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Ganti Jabatan')
                                <li class="nav-item">
                                    <a href="{{ route('Ganti Jabatan') }}" id="ganti-jabatan" class="nav-link">
                                        <i class="nav-icon fas fa-people-arrows"></i>
                                        <p>Ganti Jabatan</p>
                                    </a>
                                </li>
                            @endpermission
                        </ul>
                    </li>
                    </li>
                @endmenu

                @if (auth()->guard('admin')->user()->role == 'tenaga kesehatan')
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="list-kesehatan">
                        <a href="#" class="nav-link" id="kesehatan">
                            <i class="nav-icon fas fa-hand-holding-medical"></i>
                            <p>
                                Kesehatan Keluarga
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            <li class="nav-item">
                                <a href="{{ route('Semua Pemeriksaan Anggota') }}" class="nav-link"
                                    id="pemeriksaan-keluarga">
                                    <i class="fas fa-stethoscope nav-icon"></i>
                                    <p>Pemeriksaan</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('Data Kesehatan') }}" class="nav-link"
                                    id="data-kesehatan-keluarga">
                                    <i class="fas fa-file-medical-alt nav-icon"></i>
                                    <p>Data Kesehatan</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    </li>
                @endif

                {{-- Start Menu Imunisasi --}}
                @menu(['Tambah Imunisasi', 'Lihat Imunisasi'])
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="list-imunisasi">
                        <a href="#" class="nav-link" id="imunisasi">
                            <i class="nav-icon fas fa-syringe"></i>
                            <p>
                                Imunisasi
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            @permission('Tambah Imunisasi')
                                <li class="nav-item">
                                    <a href="{{ route('Tambah Imunisasi') }}" class="nav-link" id="tambah-imunisasi">
                                        <i class="fas fa-vials nav-icon"></i>
                                        <p>Tambah Imunisasi</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Imunisasi')
                                <li class="nav-item">
                                    <a href="{{ route('Semua Jenis Imunisasi') }}" class="nav-link" id="jenis-imunisasi">
                                        <i class="fas fa-crutch nav-icon"></i>
                                        <p>Jenis Imunisasi</p>
                                    </a>
                                </li>
                            @endpermission
                        </ul>
                    </li>
                    </li>
                @endmenu
                {{-- End Menu Imunisasi --}}

                {{-- Start Menu Vitamin --}}
                @menu(['Tambah Vitamin', 'Lihat Vitamin'])
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="list-vitamin">
                        <a href="#" class="nav-link" id="vitamin">
                            <i class="nav-icon fas fa-prescription-bottle-alt"></i>
                            <p>
                                Vitamin
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            @permission('Tambah Vitamin')
                                <li class="nav-item">
                                    <a href="{{ route('Tambah Vitamin') }}" class="nav-link" id="tambah-vitamin">
                                        <i class="fas fa-pills nav-icon"></i>
                                        <p>Tambah Vitamin</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Vitamin')
                                <li class="nav-item">
                                    <a href="{{ route('Semua Jenis Vitamin') }}" class="nav-link" id="jenis-vitamin">
                                        <i class="fas fa-capsules nav-icon"></i>
                                        <p>Jenis Vitamin</p>
                                    </a>
                                </li>
                            @endpermission
                        </ul>
                    </li>
                    </li>
                @endmenu
                {{-- End Menu Vitamin --}}

                {{-- Start Menu Kegiatan Posyandu --}}
                @menu(['Lihat Kegiatan', 'Lihat Riwayat Kegiatan'])
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="kegiatan-posyandu">
                        <a href="#" class="nav-link" id="kegiatan">
                            <i class="nav-icon fas fa-briefcase-medical"></i>
                            <p>
                                Kegiatan Posyandu
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            <li class="nav-item">
                                <a href="{{ route('kegiatan.home') }}" class="nav-link" id="tambah-kegiatan">
                                    <i class="nav-icon fas fa-notes-medical"></i>
                                    <p>Kegiatan</p>
                                </a>
                            </li>
                            @permission('Lihat Riwayat Kegiatan')
                                <li class="nav-item">
                                    <a href="{{ route('riwayat_kegiatan.home') }}" class="nav-link" id="riwayat-kegiatan">
                                        <i class="nav-icon fas fa-history"></i>
                                        <p>Riwayat Kegiatan</p>
                                    </a>
                                </li>
                            @endpermission
                        </ul>
                    </li>
                    </li>
                @endmenu
                {{-- End Menu Kegiatan Posyandu --}}

                {{-- Start Menu Informasi --}}
                @menu(['Lihat Berita', 'Lihat Tag Berita', 'Lihat Pengumuman'])
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="informasi">
                        <a href="#" class="nav-link" id="informasi-link">
                            <i class="nav-icon fas fa-info"></i>
                            <p>
                                Informasi
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            @permission('Lihat Berita')
                                <li class="nav-item">
                                    <a href="{{ route('informasi_penting.home') }}" class="nav-link" id="informasi-penting">
                                        <i class="fas fa-newspaper nav-icon"></i>
                                        <p>Berita</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Tag Berita')
                                <li class="nav-item">
                                    <a href="{{ route('Semua Tag') }}" class="nav-link" id="tag">
                                        <i class="fas fa-tags nav-icon"></i>
                                        <p>Tag</p>
                                    </a>
                                </li>
                            @endpermission
                            @permission('Lihat Pengumuman')
                                <li class="nav-item">
                                    <a href="{{ route('pengumuman.home') }}" class="nav-link" id="pengumuman">
                                        <i class="fas fa-bullhorn nav-icon"></i>
                                        <p>Pengumuman</p>
                                    </a>
                                </li>
                            @endpermission
                        </ul>
                    </li>
                    </li>
                @endmenu
                {{-- End Menu Informasi --}}

                <div class="dropdown-divider"></div>

                {{-- Start Menu Hak Akses --}}
                @permission('Lihat Hak Akses')
                    <li class="nav-item">
                        <a href="{{ route('Semua Permission') }}" id="permission" class="nav-link">
                            <i class="nav-icon fas fa-key"></i>
                            <p>Hak Akses</p>
                        </a>
                    </li>
                @endpermission
                {{-- End Menu Hak Akses --}}

                <li class="nav nav-treeview">
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-file-alt"></i>
                        <p>
                            Laporan
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview ms-3">
                        <li class="nav-item">
                            <a href="/admin/laporan/kegiatan" class="nav-link">
                                <i class="fas fa-file-alt nav-icon"></i>
                                <p>Laporan Kegiatan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/admin/laporan/bulanan" class="nav-link">
                                <i class="fas fa-clipboard-check nav-icon"></i>
                                <p>Laporan Bulanan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/admin/laporan/tahunan" class="nav-link">
                                <i class="fas fa-clipboard-check nav-icon"></i>
                                <p>Laporan Tahunan</p>
                            </a>
                        </li>
                    </ul>
                </li>
                </li>
                @if (auth()->guard('admin')->user()->role == 'super admin')
                    <li class="nav nav-treeview">
                    <li class="nav-item" id="setting-bot">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-robot"></i>
                            <p>
                                Setting Bot
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview ms-3">
                            <li class="nav-item">
                                <a href="{{ route('pertanyaan-konsultasi.home') }}" class="nav-link"
                                    id="pertanyaan-konsultasi">
                                    <i class="fas fa-file-alt nav-icon"></i>
                                    <p>Pertanyaan Konsultasi</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('pertanyaan-satu-arah.home') }}" class="nav-link"
                                    id="pertanyaan-statis">
                                    <i class="fas fa-file-alt nav-icon"></i>
                                    <p>Pertanyaan Statis</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    </li>
                @endif
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-info-circle"></i>
                        <p>Tentang</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    {{-- Sidebar Menu End --}}

</aside>
