# Activia Goodz

- Nama: Nisyyah Azzahra
- NPM: 2406495823
## Tautan PWS
... (gada ya(?))


# Tugas Individu 7
#### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah struktur hierarki yang merepresentasikan susunan widget-widget dalam aplikasi Flutter. Setiap aplikasi Flutter dibangun dari widget-widget yang tersusun dalam bentuk pohon, di mana setiap widget dapat memiliki widget induk (parent) dan widget anak (child). Setiap widget bisa memiliki satu atau lebih child widget. Kemudian, informasi mengalir dari atas ke bawah (top-down) dalam tree.

Hubngan parent-child menentukan bagaimana elemen saling berinteraksi:
- Parent widget membungkus dan mengatur tata letak atau perilaku child widget.
- Child widget menerima/ mewarisi konteks dan properti dari parent untuk membangun tampilannya.

Contoh sederhana:
```
Scaffold(
  appBar: AppBar(title: Text("Activia Goodz")),
  body: Center(
    child: Text("Selamat datang!"),
  ),
);
```

Di sini, Scaffold adalah parent dari AppBar dan Center, sedangkan Center adalah parent dari Text.

---

#### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
| Widget | Fungsi |
|--------|---------|
| **MaterialApp** | Widget root yang menyediakan konfigurasi tema dan navigasi aplikasi. |
| **Scaffold** | Menyediakan struktur dasar halaman seperti AppBar, Body, dan FloatingActionButton. |
| **AppBar** | Bar di bagian atas halaman yang menampilkan judul aplikasi. |
| **Padding** | Memberikan jarak/ruang di sekitar widget child-nya. |
| **Column** | Menyusun widget anak secara vertikal. |
| **Row** | Menyusun widget anak secara horizontal. |
| **Text** | Menampilkan teks pada layar. |
| **Icon** | Menampilkan ikon yang mewakili fungsi tombol atau fitur. |
| **Card** | Menampilkan elemen dengan tampilan seperti kartu. |
| **Container** | Widget pembungkus yang dapat dikustomisasi ukuran dan padding-nya. |
| **SizedBox** | Memberikan jarak/ruang kosong dengan ukuran tertentu. |
| **Center** | Menempatkan widget child di tengah. |
| **InkWell** | Menambahkan efek sentuhan dan aksi onTap untuk interaksi pengguna. |
| **SnackBar** | Menampilkan pesan singkat di bagian bawah layar saat aksi tertentu dilakukan. |
| **GridView.count** | Menampilkan daftar tombol atau kartu dalam bentuk grid. |
| **Theme.of(context)** | Mengambil data tema aktif dari konteks aplikasi agar gaya visual konsisten. |

---

#### Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp adalah widget yang menyediakan berbagai konfigurasi untuk aplikasi dengan gaya **Material Design** milik Google.  
Fungsinya antara lain:
- Menyediakan struktur global aplikasi (tema, navigasi, dan route).  
- Mengatur tampilan awal melalui properti home.  
- Mengaktifkan fitur seperti ScaffoldMessenger, Navigator, dan Theme.  

**Alasan sering digunakan sebagai root widget:**
- Konsistensi desain: Menerapkan Material Design secara konsisten di seluruh aplikasi
- Konfigurasi terpusat: Semua pengaturan tema dan navigasi dapat diatur di satu tempat
- Fitur built-in: Menyediakan banyak fitur siap pakai seperti Navigator, Theme, Localizations
- Best practice: Merupakan standar dalam pengembangan aplikasi Flutter
- Kompatibilitas: Memastikan aplikasi berjalan baik di berbagai platform

---

#### Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
 **StatelessWidget** Tidak memiliki state (data internal yang berubah). UI tetap selama runtime.  Digunakan untuk tampilan statis seperti teks, ikon, atau tombol tetap. 

**StatefulWidget**  Memiliki state yang dapat berubah dan dapat memicu *rebuild*.  Digunakan untuk UI yang berubah karena interaksi pengguna, seperti form, counter, atau toggle. 

Contoh:
- StatelessWidget: halaman utama yang hanya menampilkan informasi tetap.  
- StatefulWidget: form input produk atau fitur login yang membutuhkan pembaruan tampilan.

**Kapan menggunakan masing-masing:**
*Gunakan StatelessWidget ketika:*
UI tidak berubah berdasarkan interaksi user
Hanya menampilkan data statis
Contoh: Text, Icon, Container dengan konten tetap

*Gunakan StatefulWidget ketika:*
UI perlu berubah berdasarkan interaksi user
Menangani form input, animasi, atau data yang berubah
Contoh: Checkbox, TextField, Counter

Dalam proyek ini, menggunakan StatelessWidget karena hanya menampilkan data statis (InfoCard dan ItemCard).

---

#### Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan lokasi suatu widget dalam widget tree. Setiap widget memiliki BuildContext-nya sendiri.
 
Penting karena:
- Akses ke Widget Tree: Memungkinkan widget mengakses widget lain dalam tree
- Tema dan Data: Mengakses tema aplikasi dan inherited widgets
- Navigasi: Digunakan untuk berpindah antar halaman
- Show Dialog/SnackBar: Menampilkan dialog atau snackbar

Dalam metode build(), context digunakan untuk membangun tampilan sesuai dengan posisi widget tersebut.

Contoh:
```
@override
Widget build(BuildContext context) {
  // Mengakses tema
  Theme.of(context).colorScheme.primary
  
  // Menampilkan SnackBar
  ScaffoldMessenger.of(context).showSnackBar(...)
  
  // Mengakses ukuran layar
  MediaQuery.of(context).size.width
}
```
BuildContext diteruskan sebagai parameter pada method build() dan digunakan untuk mengakses informasi dari widget tree di atasnya.

---

#### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

- **Hot Reload** Memuat ulang kode yang telah diubah langsung ke dalam aplikasi tanpa menghentikan proses utama. State aplikasi **tetap tersimpan**. Sangat cepat (biasanya < 1 detik). Mempertahankan data dan posisi aplikasi saat ini. Cocok untuk perubahan UI dan logika kecil. Tidak menjalankan ulang method main().


- **Hot Restart**  Menjalankan ulang seluruh aplikasi dari awal (memanggil main() lagi).  State **hilang**, aplikasi dimulai ulang. Lebih lambat dari hot reload. Diperlukan untuk perubahan besar seperti inisialisasi global atau perubahan dependencies.

---

