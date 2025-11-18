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

# Tugas Individu 9
#### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
**Keuntungan Menggunakan Model:**
- **Type Safety**: Model memberikan tipe data yang jelas untuk setiap field, sehingga compiler Dart dapat mendeteksi error tipe data sebelum runtime
- **Null Safety**: Dengan model, kita bisa menentukan field mana yang nullable dan non-nullable, mencegah null pointer exceptions
- **Autocomplete & IntelliSense**: IDE dapat memberikan saran kode yang lebih baik karena mengetahui struktur objek
- **Maintainability**: Lebih mudah untuk memaintain kode karena perubahan struktur data terpusat di satu tempat
- **Dokumentasi Implicit**: Model berfungsi sebagai dokumentasi struktur data yang digunakan

**Konsekuensi Tanpa Model (Langsung Menggunakan Map<String, dynamic>):**
- **Tidak Ada Validasi Tipe**: Error tipe data baru terdeteksi saat runtime, bukan compile time
- **Rawan Typo**: Salah mengetik nama key (misal: `map['usrname']` vs `map['username']`) tidak akan terdeteksi hingga runtime
- **Null Safety Lemah**: Sulit mengontrol field mana yang boleh null, berpotensi crash aplikasi
- **Kode Sulit Dibaca**: Akses data dengan string literal (`data['field']`) kurang jelas dibanding `object.field`
- **Refactoring Sulit**: Jika struktur data berubah, harus mencari dan mengubah semua tempat yang mengakses data tersebut secara manual
- **Tidak Ada Validasi Data**: Tidak bisa memvalidasi format atau constraint data secara otomatis


#### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
**Package `http`:**
- Library standar Dart untuk melakukan HTTP requests (GET, POST, PUT, DELETE, dll.)
- Bersifat stateless - setiap request independen tanpa menyimpan state
- Cocok untuk request sederhana yang tidak memerlukan session management
- Contoh penggunaan: `http.get()`, `http.post()`

**Package `CookieRequest` (dari pbp_django_auth):**
- Library khusus untuk integrasi Flutter dengan Django authentication
- Bersifat stateful - menyimpan cookies dan session data
- Mengelola autentikasi secara otomatis (menyimpan dan mengirim cookies di setiap request)
- Menangani CSRF tokens untuk keamanan
- Menyediakan method untuk login, logout, dan request yang ter-autentikasi

**Perbedaan Peran:**

| Aspek | http | CookieRequest |
|-------|------|---------------|
| **State Management** | Stateless | Stateful (menyimpan session) |
| **Cookie Handling** | Manual | Otomatis |
| **Authentication** | Harus dikelola manual | Built-in support |
| **Use Case** | Request sederhana, API publik | Aplikasi dengan autentikasi Django |
| **CSRF Protection** | Harus ditambahkan manual | Otomatis |

---

#### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
**1. Konsistensi Session**
- Satu instance memastikan semua komponen menggunakan session yang sama
- Cookies dan authentication state tetap konsisten di seluruh aplikasi
- User tidak perlu login berulang kali di setiap halaman

**2. Efisiensi Memori**
- Menghindari pembuatan multiple instances yang redundan
- Satu instance cukup untuk mengelola semua HTTP requests

**3. Sinkronisasi State**
- Status login/logout otomatis tersinkronisasi di semua komponen
- Perubahan authentication state langsung terefleksikan di semua halaman

**4. Centralized Management**
- Mudah untuk tracking dan debugging network requests
- Pengaturan cookies terpusat di satu tempat

**Implementasi dengan Provider:**
```dart
Provider.of(context, listen: false)
```
Pattern ini (Dependency Injection via Provider) memastikan semua widget memiliki akses ke instance `CookieRequest` yang sama.


#### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
**A. Menambahkan `10.0.2.2` pada ALLOWED_HOSTS**
```python
ALLOWED_HOSTS = ['localhost', '127.0.0.1', '10.0.2.2']
```
- `10.0.2.2` adalah IP khusus untuk mengakses localhost dari Android Emulator
- Android Emulator berjalan di virtual device yang memiliki network stack sendiri
- `10.0.2.2` di emulator akan di-route ke `127.0.0.1` (localhost) di host machine

**Konsekuensi jika tidak ditambahkan:** 
- Android app tidak bisa connect ke Django development server
- Error: "Bad Request (400)" atau connection refused

**B. Mengaktifkan CORS (Cross-Origin Resource Sharing)**
```python
INSTALLED_APPS = [
    ...
    'corsheaders',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    ...
]

CORS_ALLOW_ALL_ORIGINS = True  # Untuk development
CORS_ALLOW_CREDENTIALS = True
```
- CORS diperlukan karena Flutter app dan Django server berbeda origin (domain/port)
- Browser/platform security memblok request lintas origin tanpa CORS
- `CORS_ALLOW_CREDENTIALS` penting untuk mengirim cookies

**Konsekuensi jika tidak diaktifkan:**
- Request dari Flutter akan diblok oleh CORS policy
- Error di console: "CORS policy: No 'Access-Control-Allow-Origin' header"

**C. Pengaturan SameSite Cookie**
```python
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
CSRF_COOKIE_SECURE = True  # Untuk production dengan HTTPS
SESSION_COOKIE_SECURE = True
```
- `SameSite='None'` mengizinkan cookies dikirim dalam request lintas origin
- `Secure=True` memastikan cookies hanya dikirim via HTTPS (penting untuk production)

**Konsekuensi jika tidak dikonfigurasi:**
- Cookies tidak akan dikirim/diterima dengan benar
- Session dan CSRF token tidak berfungsi
- User tidak bisa maintain login state

**D. Izin Akses Internet di Android (AndroidManifest.xml)**
- Permission wajib agar aplikasi Android bisa melakukan network requests
- Tanpa ini, aplikasi tidak bisa mengakses internet sama sekali

**Konsekuensi jika tidak ditambahkan:**
- Semua network requests akan gagal secara silent
- Aplikasi tidak bisa berkomunikasi dengan backend

**E. Konfigurasi Network Security (untuk HTTP di Development)**
```xml
<!-- android/app/src/main/res/xml/network_security_config.xml -->

    
        10.0.2.2
    

```
- Diperlukan untuk mengizinkan HTTP (non-HTTPS) di Android 9+
- Secara default, Android memblok cleartext traffic


#### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
**Flow Lengkap:**
```
1. INPUT DI FLUTTER
   ↓
   User mengisi form → Data disimpan di TextEditingController/State
   
2. VALIDASI CLIENT-SIDE
   ↓
   Flutter memvalidasi input (required fields, format, dll)
   
3. KONVERSI KE JSON
   ↓
   Data dari form dikonversi menjadi Map<String, dynamic> atau JSON string
   
4. HTTP REQUEST
   ↓
   CookieRequest.post() mengirim data ke Django endpoint
   - Method: POST
   - Headers: Content-Type: application/json
   - Body: JSON data
   - Cookies: Session & CSRF token (otomatis)
   
5. DJANGO MENERIMA REQUEST
   ↓
   - Middleware memproses request (CORS, Session, CSRF)
   - View function menerima request.POST atau request.body
   - Django memparse JSON data
   
6. VALIDASI & PEMROSESAN DI DJANGO
   ↓
   - Validasi data (Django forms/serializers)
   - Business logic processing
   - Simpan ke database (Model.objects.create())
   
7. DJANGO RESPONSE
   ↓
   - Serialize data yang akan dikembalikan
   - Return JsonResponse dengan status code
   - Format: {"status": "success", "data": {...}}
   
8. FLUTTER MENERIMA RESPONSE
   ↓
   - Parse JSON response
   - Convert ke Model Dart (fromJson)
   
9. UPDATE UI STATE
   ↓
   - setState() atau Provider untuk update state
   - Widget rebuild dengan data baru
   
10. TAMPIL DI UI
    ↓
    Widget menampilkan data menggunakan model objects
```

**Contoh Kode:**
```dart
// FLUTTER - Input & Kirim Data
final response = await request.post(
  'http://10.0.2.2:8000/api/create-product/',
  jsonEncode({
    'name': _nameController.text,
    'price': _priceController.text,
    'description': _descriptionController.text,
  }),
);

// Parse response
if (response['status'] == 'success') {
  // Update UI atau navigate
  Navigator.pop(context);
}
```
```python
# DJANGO - Terima & Proses Data
@csrf_exempt
@require_http_methods(["POST"])
def create_product(request):
    data = json.loads(request.body)
    
    # Validasi & simpan
    product = Product.objects.create(
        name=data['name'],
        price=data['price'],
        description=data['description'],
        user=request.user
    )
    
    return JsonResponse({
        'status': 'success',
        'data': {
            'id': product.id,
            'name': product.name,
        }
    })
```

#### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
#### **A. REGISTER**

**Flow Register:**
```
1. INPUT DI FLUTTER
   User mengisi form register (username, password, confirm password)
   
2. KIRIM KE DJANGO
   ↓
   CookieRequest.post('http://10.0.2.2:8000/auth/register/', data)
   - Data: username, password1, password2
   
3. PROSES DI DJANGO
   ↓
   - Validasi username belum dipakai
   - Validasi password match & memenuhi requirements
   - Create user: User.objects.create_user()
   - Hash password secara otomatis
   
4. RESPONSE KE FLUTTER
   ↓
   - Success: {"status": true, "message": "Registration successful"}
   - Fail: {"status": false, "message": "Error message"}
   
5. FLUTTER HANDLING
   ↓
   - Jika success: Navigate ke login page
   - Jika fail: Tampilkan error message
```

**Kode Flutter:**
```dart
final response = await request.post(
  'http://10.0.2.2:8000/auth/register/',
  jsonEncode({
    'username': username,
    'password1': password1,
    'password2': password2,
  }),
);

if (response['status']) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}
```

**Kode Django:**
```python
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        user = User.objects.create_user(
            username=username,
            password=password1
        )
        user.save()
        
        return JsonResponse({
            "status": True,
            "message": "User created successfully!"
        }, status=200)
```

---

#### **B. LOGIN**

**Flow Login:**
```
1. INPUT DI FLUTTER
   User mengisi username & password
   
2. KIRIM KE DJANGO
   ↓
   CookieRequest.login('http://10.0.2.2:8000/auth/login/', data)
   
3. AUTENTIKASI DI DJANGO
   ↓
   - django.contrib.auth.authenticate(username, password)
   - Verify password hash match
   - Jika valid: django.contrib.auth.login(request, user)
   
4. CREATE SESSION
   ↓
   - Django membuat session di database/cache
   - Generate session ID
   - Set session cookie (sessionid)
   - Set CSRF token cookie
   
5. RESPONSE KE FLUTTER
   ↓
   - Success: {"status": true, "username": "...", "message": "Login successful"}
   - Cookies: sessionid, csrftoken (disimpan otomatis oleh CookieRequest)
   
6. FLUTTER HANDLING
   ↓
   - CookieRequest menyimpan cookies
   - Update authentication state
   - Navigate ke homepage/menu
   - Semua request berikutnya akan otomatis include cookies
```

**Kode Flutter:**
```dart
final response = await request.login(
  'http://10.0.2.2:8000/auth/login/',
  {
    'username': username,
    'password': password,
  },
);

if (request.loggedIn) {
  String message = response['message'];
  String uname = response['username'];
  
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Welcome, $uname!")),
  );
}
```

**Kode Django:**
```python
from django.contrib.auth import authenticate, login

@csrf_exempt
def login_user(request):
    username = request.POST['username']
    password = request.POST['password']
    
    user = authenticate(username=username, password=password)
    
    if user is not None:
        if user.is_active:
            login(request, user)
            return JsonResponse({
                "status": True,
                "username": user.username,
                "message": "Login successful!"
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Account is disabled."
            }, status=401)
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid username or password."
        }, status=401)
```

---

#### **C. AUTHENTICATED REQUESTS**

**Setelah Login:**
```
SETIAP REQUEST KE DJANGO:
   ↓
   CookieRequest otomatis mengirim:
   - Session cookie (sessionid)
   - CSRF token
   
DJANGO MEMVERIFIKASI:
   ↓
   - SessionMiddleware: Load user dari session
   - request.user terisi dengan User object
   - Atau AnonymousUser jika tidak terautentikasi
   
VIEW CHECKING:
   ↓
   - @login_required decorator atau manual check
   - if not request.user.is_authenticated: return error
   
AKSES DATA USER:
   ↓
   - products = Product.objects.filter(user=request.user)
   - Setiap user hanya bisa akses data miliknya
```

---

#### **D. LOGOUT**

**Flow Logout:**
```
1. USER KLIK LOGOUT DI FLUTTER
   
2. KIRIM REQUEST KE DJANGO
   ↓
   CookieRequest.logout('http://10.0.2.2:8000/auth/logout/')
   
3. PROSES DI DJANGO
   ↓
   - django.contrib.auth.logout(request)
   - Hapus session dari database
   - Clear session data
   
4. RESPONSE KE FLUTTER
   ↓
   - {"status": true, "message": "Logout successful"}
   
5. FLUTTER HANDLING
   ↓
   - CookieRequest clear cookies & session
   - request.loggedIn = false
   - Navigate ke LoginPage
   - Clear semua state yang berkaitan dengan user
```

**Kode Flutter:**
```dart
final response = await request.logout(
  'http://10.0.2.2:8000/auth/logout/',
);

if (response['status']) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Logout successful!")),
  );
}
```

**Kode Django:**
```python
from django.contrib.auth import logout

@csrf_exempt
def logout_user(request):
    logout(request)
    return JsonResponse({
        "status": True,
        "message": "Logout successful!"
    }, status=200)
```


#### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
## Implementasi Checklist Tugas 9

### 1. Memastikan Deployment Proyek Django Berjalan dengan Baik

Sebelum memulai integrasi dengan Flutter, saya memastikan bahwa proyek Django sudah ter-deploy dengan baik dan dapat diakses melalui URL deployment. Saya melakukan pengecekan dengan:
- Membuka URL deployment di browser
- Memverifikasi endpoint `/json/` mengembalikan data produk dalam format JSON
- Memastikan tidak ada error pada server Django

### 2. Mengimplementasikan Fitur Registrasi Akun pada Flutter

#### a. Setup Authentication di Django
Pertama, saya membuat Django app baru untuk autentikasi:
```bash
python manage.py startapp authentication
```

Kemudian menambahkan `authentication` ke `INSTALLED_APPS` di `settings.py` dan menginstall `django-cors-headers`:
```bash
pip install django-cors-headers
```

Setelah itu, saya menambahkan konfigurasi CORS di `settings.py`:
```python
INSTALLED_APPS = [
    ...
    'authentication',
    'corsheaders',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    ...
]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'

# Tambahkan 10.0.2.2 untuk Android Emulator
ALLOWED_HOSTS = [..., "10.0.2.2"]
```

#### b. Membuat View Register di Django
Saya membuat fungsi `register` di `authentication/views.py` yang menerima data JSON dari Flutter dan membuat user baru:
```python
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = strip_tags(data.get('username', '')).strip()
        password1 = strip_tags(data.get('password1', '')).strip()
        password2 = strip_tags(data.get('password2', '')).strip()
        
        # Validasi input
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
            
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Buat user baru
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
```

Kemudian routing URL di `authentication/urls.py`:
```python
urlpatterns = [
    path('register/', register, name='register'),
]
```

#### c. Membuat Halaman Register di Flutter
Di Flutter, saya membuat `lib/screens/register.dart` dengan form yang memiliki:
- Field username
- Field password
- Field confirm password
- Button register yang mengirim data ke endpoint Django menggunakan `request.postJson()`

Saya menggunakan package `pbp_django_auth` untuk mengirim request:
```dart
final response = await request.postJson(
    "http://localhost:8000/auth/register/",
    jsonEncode({
        "username": username,
        "password1": password1,
        "password2": password2,
    }));
```

### 3. Membuat Halaman Login pada Flutter

#### a. Membuat View Login di Django
Saya membuat fungsi `login` di `authentication/views.py` yang menerima credentials dan melakukan autentikasi:
```python
@csrf_exempt
def login(request):
    if request.method == 'POST':
        username = request.POST.get('username', '').strip()
        password = request.POST.get('password', '').strip()
        
        user = authenticate(username=username, password=password)
        
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login successful!"
                }, status=200)
        
        return JsonResponse({
            "status": False,
            "message": "Invalid username or password."
        }, status=401)
```

**Catatan penting**: Fungsi login menggunakan `request.POST` (bukan `json.loads`) karena package `pbp_django_auth` mengirim data sebagai form POST, bukan JSON.

#### b. Membuat Halaman Login di Flutter
Saya membuat `lib/screens/login.dart` dengan:
- TextField untuk username dan password
- Button login yang memanggil `request.login()`
- Link navigasi ke halaman register
```dart
final response = await request.login(
    "http://localhost:8000/auth/login/", {
    'username': username,
    'password': password,
});

if (request.loggedIn) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
    );
}
```

### 4. Mengintegrasikan Sistem Autentikasi Django dengan Flutter

#### a. Setup Provider di Flutter
Saya memodifikasi `main.dart` untuk menyediakan `CookieRequest` ke seluruh aplikasi menggunakan Provider:
```dart
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Activia Goodz',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent[400]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
```

Dengan Provider, semua widget dalam aplikasi dapat mengakses instance `CookieRequest` yang sama untuk menangani autentikasi dan session.

#### b. Implementasi Logout
Saya membuat fungsi logout di Django (`authentication/views.py`):
```python
@csrf_exempt
def logout(request):
    username = request.user.username
    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        }, status=200)
    except:
        return JsonResponse({
            "status": False,
            "message": "Logout failed."
        }, status=401)
```

Di Flutter, saya menambahkan logika logout di `ItemCard` pada menu:
```dart
else if (item.name == "Logout") {
    final response = await request.logout(
        "http://localhost:8000/auth/logout/",
    );
    if (response['status']) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
        );
    }
}
```

### 5. Membuat Model Kustom Sesuai dengan Proyek Django

#### a. Membuat Model File
Saya membuat `lib/models/product_entry.dart` dengan kode dari Quicktype yang sudah disesuaikan:
```dart
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int price;
    String description;
    String category;
    String? thumbnail;
    int productViews;
    DateTime? createdAt;
    bool isFeatured;
    int userId;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        this.thumbnail,
        required this.productViews,
        this.createdAt,
        required this.isFeatured,
        required this.userId,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        productViews: json["product_views"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "product_views": productViews,
        "created_at": createdAt?.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
```


### 6. Membuat Halaman Daftar Item

#### a. Menambahkan Dependency HTTP
Saya menambahkan package `http` untuk melakukan HTTP request:
```bash
flutter pub add http
```

Kemudian menambahkan permission internet di `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```

#### b. Membuat Halaman List Product
Saya membuat `lib/screens/list_productentry.dart` dengan:

**Fungsi Fetch Data:**
```dart
Future<List<Product>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    
    var data = response;
    List<Product> listProduct = [];
    for (var d in data) {
        if (d != null) {
            listProduct.add(Product.fromJson(d));
        }
    }
    return listProduct;
}
```

**Tampilan dengan FutureBuilder:**
```dart
body: FutureBuilder(
    future: fetchProduct(request),
    builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
        } else {
            if (!snapshot.hasData) {
                return const Column(
                    children: [
                        Text('Belum ada data produk pada Activia Goodz.'),
                    ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(
                                        product: snapshot.data![index],
                                    ),
                                ),
                            );
                        },
                        child: // Card widget menampilkan data produk
                    ),
                );
            }
        }
    },
),
```

Halaman ini menampilkan:
- **Name**: Nama produk
- **Price**: Harga produk 
- **Description**: Deskripsi produk
- **Thumbnail**: Gambar produk (jika ada)
- **Category**: Kategori produk 
- **Is Featured**: Badge "Featured Product" 

### 7. Membuat Halaman Detail untuk Setiap Item

Saya membuat `lib/screens/product_detail.dart` yang menerima objek `Product` sebagai parameter:
```dart
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image (full width)
            if (product.thumbnail != null && product.thumbnail!.isNotEmpty)
              Image.network(
                product.thumbnail!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text('Featured Product'),
                    ),
                  
                  // Product name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  // Price
                  Text(
                    'Rp ${product.price}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  
                  // Category
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(_getCategoryLabel(product.category)),
                  ),
                  
                  // Views count
                  Text('${product.productViews} views'),
                  
                  // Created date
                  if (product.createdAt != null)
                    Text('Added on: ${product.createdAt!.day}/${product.createdAt!.month}/${product.createdAt!.year}'),
                  
                  const Divider(),
                  
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  
                  // Back button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back to Product List'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

Halaman detail ini menampilkan **SEMUA atribut** dari model Product:
- `id`: Digunakan untuk identifikasi (tidak ditampilkan ke user)
- `name`: Ditampilkan sebagai judul
- `price`: Ditampilkan dengan format Rupiah
- `description`: Ditampilkan lengkap dengan text-align justify
- `category`: Ditampilkan sebagai badge dengan label yang readable
- `thumbnail`: Ditampilkan sebagai gambar header (full width)
- `productViews`: Ditampilkan dengan icon mata
- `createdAt`: Ditampilkan dalam format tanggal
- `isFeatured`: Ditampilkan sebagai badge jika true
- `userId`: Digunakan untuk filter (tidak ditampilkan)

### 8. Melakukan Filter Item Berdasarkan User yang Login

Filter dilakukan di dua tempat:

#### a. Filter di Backend Django
Di `main/views.py`, fungsi `show_json` sudah dimodifikasi untuk memfilter berdasarkan user:
```python
def show_json(request):
    user_filter = request.GET.get('filter')
    
    if user_filter == 'my_products':
        products_list = Product.objects.filter(user=request.user)
    else:
        products_list = Product.objects.all()
    
    # Convert to JSON
    data = [
        {
            'id': str(product.id),
            'name': product.name,
            'price': product.price,
            'description': product.description,
            'category': product.category,
            'thumbnail': product.thumbnail,
            'product_views': product.product_views,
            'created_at': product.created_at.isoformat() if product.created_at else None,
            'is_featured': product.is_featured,
            'user_id': product.user_id,
        }
        for product in products_list
    ]
    
    return JsonResponse(data, safe=False)
```

Endpoint ini akan:
- Jika ada parameter `?filter=my_products` → menampilkan hanya produk milik user yang login
- Jika tidak ada parameter → menampilkan semua produk

#### b. Integrasi Form Flutter dengan Django
Saya membuat endpoint di Django untuk menerima data produk baru dari Flutter:
```python
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        name = strip_tags(data.get("name", ""))
        price = data.get("price", 0)
        description = strip_tags(data.get("description", ""))
        category = data.get("category", "women")
        thumbnail = data.get("thumbnail", "")
        is_featured = data.get("is_featured", False)
        user = request.user  # Otomatis mengambil user yang sedang login

        new_product = Product(
            name=name,
            price=price,
            description=description,
            category=category,
            thumbnail=thumbnail,
            is_featured=is_featured,
            user=user  # Product akan terasosiasi dengan user yang login
        )
        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
```

Di Flutter (`productentry_form.dart`), saya memodifikasi tombol Save untuk mengirim data ke Django:
```dart
onPressed: () async {
    if (_formKey.currentState!.validate()) {
        final response = await request.postJson(
            "http://localhost:8000/create-flutter/",
            jsonEncode(<String, String>{
                'name': _name,
                'price': _price.toString(),
                'description': _description,
                'category': _category,
                'thumbnail': _thumbnail,
                'is_featured': _isFeatured.toString(),
            }),
        );
        
        if (context.mounted) {
            if (response['status'] == 'success') {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Produk baru berhasil disimpan!"),
                    ),
                );
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                );
            }
        }
    }
},
```

Dengan cara ini:
1. Setiap produk yang dibuat akan otomatis terasosiasi dengan user yang sedang login (melalui `request.user` di Django)
2. Endpoint `/json/` dengan parameter filter dapat digunakan untuk menampilkan hanya produk milik user tertentu
3. User hanya bisa melihat dan mengelola produk mereka sendiri jika menggunakan filter `my_products`

#### c. Implementasi Filter di Flutter (Opsional)
Untuk memberikan opsi kepada user melihat semua produk atau hanya produk mereka, saya bisa menambahkan toggle di halaman list:
```dart
// Bisa ditambahkan button untuk switch filter
Future<List<Product>> fetchProduct(CookieRequest request, {bool myProductsOnly = false}) async {
    String url = myProductsOnly 
        ? 'http://localhost:8000/json/?filter=my_products'
        : 'http://localhost:8000/json/';
    
    final response = await request.get(url);
    // ... parsing seperti sebelumnya
}
```