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


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
