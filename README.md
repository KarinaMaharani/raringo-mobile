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
- const : digunakan untuk konstanta dan dideklarasi saat compile. Sehingga perlu dipastikan variabel dengan const memiliki nilai yang tidak bisa diubah sejak compile
- final : digunakan untuk variabel yang di deklarasikan dan tidak bisa diubah saat dideklarasi selama runtime. Sehingga variabel final bisa jadi hanya diinstansi jika memenuhi kondisi pada runtime sehingga jika kondisi tersebut tidak dipenuhi variabel final tidak _exist_ selama program berjalan. Sedangkan untuk const akan teteap terdefinisi daan _exist_ sekalipun syarat kondisi dipenuhi.  

Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.  
**Jawab**:


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
