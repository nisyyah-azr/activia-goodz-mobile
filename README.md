# Activia Goodz

- Nama: Nisyyah Azzahra
- NPM: 2406495823


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


# Tugas Individu 8
#### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Perbandingan:
| Method | Deskripsi  | Kasus Penggunaan |
|--------|---------------------|------------------|
| **Navigator.push()** | Menambahkan route baru ke atas stack halaman yang sudah ada. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna. Pengguna masih bisa kembali ke halaman sebelumnya dengan tombol Back. | Digunakan saat pengguna menekan tombol Tambah Produk dari halaman utama agar setelah selesai menambah produk, mereka bisa kembali ke halaman utama dengan mudah. |
| **Navigator.pushReplacement()** | Menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya. Tombol Back tidak akan mengembalikan ke halaman sebelumnya. | Digunakan pada navigasi melalui Drawer, seperti ketika pengguna memilih menu Halaman Utama atau Tambah Produk, karena tidak diperlukan untuk kembali ke halaman sebelumnya.|

Perbedaan utama:
| Aspek | Navigator.push()  | Navigator.pushReplacement() |
|-------|-------------------|-----------------------------|
| **Fungsi** | Menambahkan route baru di atas stack  | Mengganti route saat ini dengan route baru |
| **Stack Behavior** | Route lama tetap ada di bawah route baru | Route lama dihapus dari stack  |
| **Tombol back** | Dapat kembali ke halaman sebelumnya | Tidak dapat kembali ke halaman yang digantikan |
| **Memory** | Menggunakan lebih banyak memory (route lama masih ada) | Lebih efisien (route lama dihapus)
 |

#### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Pemanfaatan Hierarchy Widget:

-  Scaffold - Widget Root
    - Digunakan sebagai struktur dasar di semua halaman (menu.dart dan productentry_form.dart)
    - Menyediakan kerangka Material Design standar
- AppBar - Navigasi Konsisten
    - Setiap halaman memiliki AppBar dengan style yang sama
    - Warna background menggunakan Theme.of(context).colorScheme.primary
    - Text color konsisten (putih) dan font weight bold
-  Drawer -  Navigasi Global
    - Widget LeftDrawer digunakan di semua halaman
    - Memberikan akses navigasi yang konsisten dari mana saja
    - DrawerHeader dengan branding aplikasi yang sama

#### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Kelebihan Layout Widget:
- Padding - Spacing & Readability
  - 
  - Memberikan jarak antar elemen sehingga tidak terlihat sesak
  - Meningkatkan keterbacaan dan estetika UI
  ### Contoh penggunaan
    ```
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Nama Produk",
          labelText: "Nama Produk",
          // ...
        ),
      ),
    ),
    ```

- SingleChildScrollView - Scrollable Content
  - 
  - Mencegah overflow ketika konten melebihi tinggi layar
  - Memungkinkan form panjang tetap accessible di semua ukuran layar
  - Keyboard tidak menutupi input field saat muncul
  ### Contoh penggunaan 
    ```
    body: Form(
      key: _formKey,
      child: SingleChildScrollView(  // Membuat seluruh form scrollable
        child: Column(
          children: [
            // Semua input fields
          ],
        ),
      ),
    ),
    ```

- ListView - Dynamic List
  - 
  - Efisien untuk menampilkan list yang panjang (lazy loading)
  - Built-in scroll behavior
  - Cocok untuk konten dinamis
  ### Contoh penggunaan
    ```
    return Drawer(
      child: ListView(  // Membuat menu drawer scrollable
        children: [
          DrawerHeader(...),
          ListTile(...),
          ListTile(...),
        ],
      ),
    );
    ```

#### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
- Theme Global (main.dart)
  - Mendefinisikan ColorScheme utama menggunakan ColorScheme.fromSwatch()
  - Rencana pewarnaan: 
    - Primary color: Navy 
    - Secondary color: Grey - untuk aksen dan interactive elements
- Konsistensi Warna di AppBar
  - Semua AppBar menggunakan Theme.of(context).colorScheme.primary
  - Memastikan warna yang sama di seluruh aplikasi
- Button Styling Konsisten
  - ElevatedButton menggunakan primary color dari theme
  - Text berwarna putih untuk kontras yang baik
---