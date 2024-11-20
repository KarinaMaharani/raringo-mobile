# raringo

- **Nama**: Karina Maharani  
- **NPM**: 2306165736  
- **Kelas**: PBP A  

## Tugas 7
Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.  
**Jawab**:  
Stateless Widget : Widget yang tidak menyimpan state sehingga tidak dapat mengubah informasi pada dirinya sendiri. Untuk mengubah widget ini perlu external event pada parent untuk mengubah tampilan dari widget ini.  
Stateful Widget : Widget yang menyimpan state (informasi yang bisa dibaca saat widget dibuat atau informasi yang berubah selama _lifetime_ widget).  
Perbedaan :  
- Semua _value_ di stateless widget final sedangkan _value_ di stateful widget dinamis dan bisa berubah/diupdate.  
- Stateless Widget bersifat immutable sedangkan Stateful Widget bersifat mutable.  
- Stateless Widget digunkan untuk data yang _static_ (tidak berubah) sedangkan Stateful Widget cendering digunakan untuk data-data yang akan berubah.  
 
Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.  
**Jawab**:
- Scaffold: Parent/container dari elemen lainnya, sebagai struktur utama aplikasi.  
- AppBar : Seperti Navbar pada html digunakan untuk aplikasi yang mengandung informasi terkait nama aplikasi.  
- IconButton : Button dalam bentuk icon saja, di program saya untuk melakukan logout.  
- Text : Menampilkan text.  
- Padding: Menambahkan jarak/spasi dari konten ke ujung container konten.  
- Column and Row : Menyusun layout berbasis grid atau tabel untuk menyusun konten secara vertikal dan horizontal.  
- ElevatedButton : Button interaktif yang memiliki elevasi dari konten/backgrounf (elemen foreground).   
- FloatingActionButton : Button diatas contect (mirip dengan stick pada html).   

Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.  
**Jawab**:  
Fungsi dari setState() adalah mengubah Stateful Widget sehingga tampilan atau data pada tampilan berubah sesuai keinginan developer. setState() akan meminta flutter untuk mengubah widget seperti refresh pada web yang telah diubah kemudian perlu direfresh untuk memuat ulang web tersebut hanya saja setState() hanya terjadi pada skala widget.  

Jelaskan perbedaan antara const dengan final.  
**Jawab**:  
- const : digunakan untuk konstanta dan dideklarasi saat compile. Sehingga perlu dipastikan variabel dengan const memiliki nilai yang tidak bisa diubah sejak compile. const digunakan untuk nilai yang diketahui sebelum runtime dan tidak boleh berubah.
- final : digunakan untuk variabel yang di deklarasikan dan tidak bisa diubah saat dideklarasi selama runtime. Sehingga variabel final bisa jadi hanya diinstansi jika memenuhi kondisi pada runtime sehingga jika kondisi tersebut tidak dipenuhi variabel final tidak _exist_ selama program berjalan. Sedangkan untuk const akan teteap terdefinisi daan _exist_ sekalipun syarat kondisi pada runtime dipenuhi. final digunakan untuk variabel yang dijalankan saat runtime dan ingin diinisialisasi sekali saja (tidak perlu diubah)

Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.  
**Jawab**:  
1.  Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.  
Saya membuat program flutter baru dengan menggunakan "flutter create [NAMA APLIKASI]" pada sebuah root folder baru di file explorer
Flutter akan membuat proyek baru dengan memiliki subfolder dengan nama aplikasi. Terdpat folder seperti web, ios, dsb. untuk membuat program menjadi adaptif dan responsif. Tapi untuk tugas 7 ini kita hanya menggunakan lib yang akan berisikan file dart. File dart akan diisi dengan kode dan widget kami.  
2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:  
 - Melihat daftar produk (Lihat Daftar Produk)  
 Saya membuat widget untuk tombol daftar product sebagai floating button di ujung kanan bawah aplikasi pada body sebagai sebuah child dengan style ElevatedButton dan menggunakan snackbar untuk menampilkan teks saat button di pencet, dengan kutipan kode sebagai berikut :
```
Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.open_in_new),
                label: const Text('Lihat Daftar Produk!'),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text("Kamu telah menekan tombol Lihat Daftar Produk!")),
                    );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18.0),
                  backgroundColor: Colors.yellow[800],
                  foregroundColor: Colors.indigo[600],
                ),
                
              ),
            ),
```
 - Menambah produk (Tambah Produk)  
 Saya membuat widget untuk tombol tambah product pada body dan menggunakan snackbar untuk menampilkan teks saat button di pencet.
```
floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text("Kamu telah menekan tombol Tambah Produk!")),
            );
        },
        backgroundColor: Colors.indigo[600],
        child: const Icon(Icons.add),
      ),
```
 - Logout (Logout) (Catatan saat debug tombol ada di kanan atas sehingga terteutup banner debug/demo)  
Saya membuat widget untuk tombol logout pada appbar dan menggunakan snackbar untuk menampilkan teks saat button di pencet, dengan kutipan kode sebagai beriikut :

```
appBar: AppBar(
        backgroundColor: Colors.indigo[600],
        title: const Text(
          'RARINGO',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Silkscreen', 
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,),
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol Logout!")),
                );
            },
          ),
        ],
      ),
```
4.  Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout)
Saya menggunakan warna berupa white dan text indigo 600 untuk button Lihat Daftar Produk dengan kutipan kode berikut
```
backgroundColor: Colors.yellow[800], // untuk warna button
foregroundColor: Colors.white, // untuk warna elemen seperti text pada button
```
Saya menggunakan warna berupa indigo 600 untuk button Tambah Produk dengan kutipan kode berikut
```
backgroundColor: Colors.indigo[600],
```
Saya menggunakan warna putih untuk icon yang digunakan sebagai logout dengan kutipan kode berikut
```
 actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,),
```
6. Memunculkan Snackbar dengan text tertentu saat tombol di klik
Karena pada program saya setiap button merupakan elemen tersenndiri maka untuk text yang ditampilkan bersifat _hard coded_ namun tidak berpengaruh pada output akhir karena setiap button merefer ke snackbar yang sama hanya saja text yang ditampilkan sudah ditentukan (tidak mengambil nilai variabel name).
Kutipan kode snackbar Button Lihat Daftar Produk :
```
onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text("Kamu telah menekan tombol Lihat Daftar Produk!")),
                    );
                },
```
Kutipan kode snackbar Button Tambah Produk :  
```
onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text("Kamu telah menekan tombol Tambah Produk!")),
            );
        },
```
Kutipan kode snackbar Button Logout :  
```
onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol Logout!")),
                );
            },
```

## Tugas 8
Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?   
Jawab : const digunakan untuk mendefinisikan variabel konstan. Dengan menyataka variabel konstan developer dapat membatasi pengunaan memori dan peningkatan waktu performance sehingga variabel tersebut dianggap tidak akan berubah (memerlukan memori yang variatif atau waktu pemrosesan yang lama).   
const sebaiknya digunakan untuk widget yang tidak mengalami perubahan seperti elemen text dan image. const kurang baik digunakan untuk widget yang dapat berubah bentuk seperti data yang berasal dari database dan stateful widget.  

Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!   
Jawab : Column dan Row adalah cara penyusunan widget yang mengutilisasikan sistem seperti tabel. 

Row menyusun semua childrennya secara horizontal contoh penggunaannya seperti dalam navbar dimana setiap fitur akan disusun ke samping.
Berikut contoh implementasi :
```

// Contoh Row
Row(
  children: <Widget>[
    Text('Home'),
    Text('Shop'),
    Text('Account')
  ],
)
// HASIL
// -------------------------
// | Home | Shop | Account |
// -------------------------
```

Column menyusun semua childrennya secara vertikal, contoh penggunaannya seperti dalam form dimana kita akan menyusun setiap input di baris selanjutnya. 
```
// Contoh Column
Column(
  children: <Widget>[
    Text('Nama:'),
    TextField(),
    Text('Alamat:'),
    TextField()
  ],
)
// HASIL
// -------------------
// | Nama :          |
// -------------------
// | [input field]   |
// -------------------
// | Alamat :        |
// -------------------
// | [input field]   |
// -------------------

```


Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!    
Jawab : Saya menggunakan TextFormField untuk user mengisi nilai berupa text dan integer dan ElevatedButton untuk melakukan penyimpanan. Element input yang belum digunakan dalam program ada Checkbox (bisa memilih beberapa pilihan yang sudah didefinisikan), Dropdown(bisa salah satu pilihan dari pilihan yang sudah didefinisikan), Slider (memilih nilai integer secara intuitif), Date Picker (Jika ada pemilihan tanggal), Time Picker (Jika ada pemilihan waktu jam, menit, detik), Switch (mirip dengan toggle, memiliki nilai binary)   

Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?   
Jawab : Mendefiniskan tema pada file main.dart pada bagian theme untuk mengubah nilai pada ThemeData pada library Material yang digunakan keseluruhan program.
```
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raringo',
      theme: ThemeData(
        ....
      // colorScheme digunakan untuk penentuan warna utama (primarySwatch), warna aksen (accentColor), karakterisik teks (textTheme)
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo,). 
      copyWith(secondary: Colors.indigo[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
```
Kita juga dapat mendefinisikan tema dan warna lebih specifik lagi pada elemen, tema di main.dart hanya sebagai global.css sedangkan spesifikasi tema lanjutan pada elemen di scaffold serupa dengan inline css sehingga akan lebih diprioritaaskan.

Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?   
Jawab : Dapat menggunakan elemen Navigator dengan pop atau push untuk mendefinisikan routing. Kemudian didalam elemen navigator kita mengload route tujuan melalui MaterialPageRoute. Berikut contoh routing :   
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => [NAMA_PAGE TUJUAN()] ),
);
```

## Tugas 9
Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?  
Model bermanfaat untuk memudahkan aplikasi dalam menampilkan data yang diambil dan dikirim antar platform hal ini diakarenakan model berperan sebagai struktur dari data database web atau aplikasi. Jika kita tidak menggunakan model maka kita akan meningkatka risiko terjadinya error dari model dari komunikasi model yang ingin digunakan, data mungkin tidak dapat diparse karena memiliki field yang tidak ada pada platform tertentu, pengambilan field yang salah, serta isu struktural lainnya yang akan mempengaruhi fungsionalitas program.  

Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini  
Http response digunakan untuk berkomunikasi dalam versi web dari aplikasi dalam pengambilan data. Saat kita melakukan login, kita akan terhubung dengan user ada yang ada di web sehingga semua data yang dimiliki oleh user pada aplikasi akan terupdate pada web baik untuk pengiriman data maupun pengambilan data untuk di baca. Hal ini dilakuka melalui method GET, POST, dan PUT.

Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.  
CookieRequest berfungsi untuk menyimpan data sebuah user untuk memastikan agar setiap komponen dapat mengakses informasi yang sama sehingga mengurangi kemungkinan program ragu atas data yang harus ditampilkaan sehingga menyebabkan gap/aambiguitas pada data. Selain itu CookieRequest juga dapat digunakan untuk menjaga sesi user agar tidak terjadi insersi secara sembarangan dan authentication user yang ada pada program.

Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.  
Input diterima pada form dan kemudian di save sebagai objek baru.  
Objek ini akan dikomunikasikan ke django atau versi web melalui JsonResponse  
Django/Web Server berkomunikasi dengan database untuk menginisiasi/membuat instance objek baru ini dalam database  
Jika berhasil maka database user tersebut akan terupdate sehingga saat Flutter menampilkan daftar objek, objek baru juga akan dipaparkan karena sudah berada dalam daftar objek user tersebut. Flutter juga akan menerima json respons untuk mengkomunikasi bahwa request diterima dan jawaban dari pemroses apakah berhasil atau tidak  

Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.  
Input diterima pada form kemudian, flutter mengirim request ke django via json untuk melakukan autentikasi, login atau logout  
Django akan memproses request tersebut dan menilai apabila request dapat diterima dan proses  
Jika berhasil, maka Flutter akan menerima json respons dari web/server untuk melanjutkan ke page selanjutnya  
Untuk login, user akan masuk ke homepage  
Untuk logout, user akan masuk ke login  
Untuk register, user akan masuk ke login    

Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).  
DJANGO :  
Membuat folder AUTHENTICATION dan fungsi untuk login, register, logout via flutter  
```
# authentication/views.py

from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth import logout as auth_logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User

import json

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
    
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
    

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)

# authentication/urls.py
from django.urls import path
from authentication.views import login, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]

# [project name]/urls.py
from django.contrib import admin
from django.urls import path
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('main.urls')),
    path('auth/', include('authentication.urls'))
]
```


Menambahkan dependensi yang diperlukan seperti cors header
```
# [project name]/settings.py untuk menambahkan
"""
Django settings for raringo project.

Generated by 'django-admin startproject' using Django 5.1.1.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.1/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-a*d8lc^+c0qiw8*o822tsqq%(-y5k8e!2#il53i1xvvxfno)67'

# SECURITY WARNING: don't run with debug turned on in production!
PRODUCTION = os.getenv("PRODUCTION", False)
DEBUG = not PRODUCTION

ALLOWED_HOSTS = ["localhost", "127.0.0.1", "karina-maharani31-raringo.pbp.cs.ui.ac.id", "10.0.2.2"]

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'main',
    'authentication',
    'corsheaders',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'corsheaders.middleware.CorsMiddleware',
]

ROOT_URLCONF = 'raringo.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'raringo.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.1/howto/static-files/

STATIC_URL = '/static/'
if DEBUG:
    STATICFILES_DIRS = [
        BASE_DIR / 'static' 
    ]
else:
    STATIC_ROOT = BASE_DIR / 'static'

# Default primary key field type
# https://docs.djangoproject.com/en/5.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

CSRF_TRUSTED_ORIGINS = ["http://localhost","http://127.0.0.1", "http://10.0.2.2" ,"http://karina-maharani31-raringo.pbp.cs.ui.ac.id/", "https://karina-maharani31-raringo.pbp.cs.ui.ac.id/"]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

Membuat fungsi penambahan objek pada model untuk flutter  
```
# main/views.py
...
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':

        data = json.loads(request.body)
        new_product = Product.objects.create(
            user=request.user,
            name=data["name"],
            price=data["price"],
            description=data["description"],
            time=data["time"],
            tags=data["tags"],
            ratings=float(data["ratings"]),
            image_url=data["image_url"],
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```


FLUTTER :  
Menambahkan dependensi yang diperlukan untuk autentikasi, http, dan provider  
```
# pada terminal
flutter pub get provider
fluter pub get pbp_django_auth
fluter pub get http
```


Membuat model di aplikasi Flutter untuk komunikasi dengan model Django  menggunakan quicktype, dimana hasil konversi dimasukkan ke folder baru pada lib bernama models dengan [ model name ].dart sebagai model kita :  
```
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String model;
    String pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    DateTime time;
    String tags;
    String ratings;
    String imageUrl;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.time,
        required this.tags,
        required this.ratings,
        required this.imageUrl,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        time: DateTime.parse(json["time"]),
        tags: json["tags"],
        ratings: json["ratings"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "tags": tags,
        "ratings": ratings,
        "image_url": imageUrl,
    };
}

```

Membuat halaman List Produk folder di lib/screen dengan file [ nama file list produk ].dart
```
import 'package:flutter/material.dart';
import 'package:raringo/models/product.dart';
import 'package:raringo/screens/product_detail.dart';
import 'package:raringo/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    // TODO: Update URL and include a trailing slash (/)
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    var data = response;
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Product List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Silkscreen',
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada produk terdaftar.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1 / 1.4,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          var product = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(product: product),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        product.fields.imageUrl ?? '',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image, size: 50),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    product.fields.name ?? 'Unknown Product',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Price: ${product.fields.price ?? 'N/A'}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Rating: ${product.fields.ratings ?? 'N/A'}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Tags: ${product.fields.tags ?? ''}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

```

Membuat halaman detail per produk di lib/screen dengan file [ nama page detail produk ].dart
```
import 'package:flutter/material.dart';
import 'package:raringo/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(product.fields.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Silkscreen',
          ),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Image
            Expanded(
              flex: 1, // Takes 1/3 of the width
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1, // Makes the image square
                  child: Image.network(
                    product.fields.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16), // Spacing between columns

            // Right Column: Product Information
            Expanded(
              flex: 2, // Takes 2/3 of the width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.fields.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Price
                  Text(
                    "Price: ${product.fields.price}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  // Rating
                  Text(
                    "Rating: ${product.fields.ratings}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  // Tags
                  Text(
                    "Tags: ${product.fields.tags}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product.fields.description,
                    style: const TextStyle(fontSize: 16),
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

Melakukan filter pada halaman daftar item agar hanya ada daftar objek yang dimiliki user yang terlogin saja  
Hal ini dicapai dengan penggunaan field request.user pada sjango untuk mengassign objek dari request yang dikirim dari flutter ke user tertentu. Selain itu Flutter juga memanfaatkan CookieRequest untuk memastikan bahwa request yang dikirim terautentiksai dalam sesi user tertentu dan tidak sembarang. Kombinasi ini membuat daftar item tetap terfilter untuk user yang terlogin saja dan tidak bercampur dengan user lainnya  
```
django : main/views.py 
...

@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':

        data = json.loads(request.body)
        new_product = Product.objects.create(
            user=request.user, # assign object to specific request
            name=data["name"],
            price=data["price"],
            description=data["description"],
            time=data["time"],
            tags=data["tags"],
            ratings=float(data["ratings"]),
            image_url=data["image_url"],
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)

flutter : lib/screens/productentry_form.dart

...
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); # cookie untuk sesi
    ...

                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/",
                          jsonEncode({
                            'name': _productname,
                            'price': _price.toString(),
                            'description': _description,
                            'time': currentDate,
                            'tags': _tags,
                            'ratings': _ratings.toString(),
                            'image_url': _imgurl,
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
                              MaterialPageRoute(
                                  builder: (context) => const ProductEntryFormPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Terdapat kesalahan, silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      }
                      ...
```



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
