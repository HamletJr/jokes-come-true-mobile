# 🪶 Jokes Come True (Mobile)
**Nama:**   Joshua Montolalu<br>
**NPM:**    2306275746<br>
**Kelas:**  PBP F<br>

Versi mobile dari aplikasi web [Jokes Come True](https://github.com/HamletJr/jokes-come-true) menggunakan Flutter.

### Tugas Sebelumnya
| [Tugas 7](#7️⃣-tugas-7) |
| - |

## 7️⃣ Tugas 7
### 1. Jelaskan apa yang dimaksud dengan *stateless widget* dan *stateful widget*, dan jelaskan perbedaan dari keduanya.
- ***Stateless widget***<br>
*Stateless widget* adalah *widget* yang tidak memiliki *state*. Dengan kata lain, *widget* dalam kategori ini tidak dapat berubah selama penggunaan aplikasi. Ini membuat *stateless widget* cocok untuk konten statis yang tidak akan berubah. Contoh *widget* yang *stateless* adalah `Icon` dan `Text`.

- ***Stateful widget***<br>
Stateful widget adalah *widget* yang memiliki *state*. Berbeda dengan *stateless widget*, *widget* jenis ini dapat berubah secara dinamis selama penggunaan aplikasi, baik itu deskripsinya maupun *property* lain, lewat objek `State` yang dimilikinya. Contohnya adalah widget `Slider`, yang dapat berubah penampilannya ketika digeser oleh pengguna, `Radio`, `Form`, `TextField`, dan lain sebagainya. 

### 2. Sebutkan *widget* apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Beberapa *widget* yang saya buat pada proyek ini adalah:
1. `MyApp`: Merupakan *widget* dasar (`MaterialApp`) yang menampung semua *widget* lain pada aplikasi. 
2. `MyHomepage`: Merupakan *widget* yang akan menampilkan *view homepage*.
3. `InfoCard`: Merupakan *widget* yang menampilkan `Card` yang berisi informasi seperti NPM, nama, dan kelas.
4. `ItemCard`: Merupakan *widget* yang menampung `InkWell` yang jika ditekan akan menampilkan `SnackBar`. 

Selain itu, *widget* di atas menggunakan beberapa *widget* dari Flutter, yaitu:
1. `MaterialApp`: *Widget* yang menjadi basis dari sebuah Material app.
2. `Scaffold`: *Widget* yang mengimplementasikan struktur *layout* dasar dari Material Design.
3. `AppBar`: *Widget* yang berada pada posisi atas aplikasi dan memiliki *toolbar* yang dapat memuat *widget* lain. Pada aplikasi ini, `AppBar` hanya menampilkan judul aplikasi. 
4. `Text`: *Widget* yang menampilkan teks di layar.
5. `TextStyle`: *Widget* yang mengandung *property style* dari teks, seperti *font size*, *weight*, dan warna.
6. `Icons`: *Widget* yang menampilkan ikon *built-in* dari Flutter.
7. `Row`: *Widget* yang dapat menyusun *widget* lain secara horizontal dalam baris.
8. `Column`: *Widget* yang dapat menyusun *widget* lain secara vertikal dalam kolom.
9. `SizedBox`: *Widget* yang memiliki bentuk kotak dengan tinggi dan lebar tertentu.
10. `Padding`: *Widget* yang memberikan *padding* pada *widget* lain.
11. `EdgeInsets`: *Widget* yang dapat digabungkan dengan `Padding` untuk memberi jarak dalam *widget*. 
12. `GridView`: *Widget* yang dapat menyusun *widget* lain dalam bentuk *grid*.
13. `Center`: *Widget* yang dapat memposisikan *widget* lain di tengah.
14. `Card`: *Widget* yang berbentuk segiempat dan dapat berisi sekumpulan informasi dan *action*. 
15. `Container`: *Widget* yang dapat menampung *widget* lain dengan *padding*, *margin*, tinggi, dan lebar tertentu. `Container` juga dapat mendefinisikan *property* lain pada *child* seperti penampilan (*painting*).
16. `MediaQuery`: *Widget* yang dapat di-*query* untuk mendapatkan informasi tentang *media* di mana aplikasi kita sedang berjalan, misalnya ukuran layar *media*-nya.
17. `InkWell`: *Widget* yang *responsive* terhadap sentuhan layar dan menampilkan animasi "ink" yang memenuhi *widget ancestor*-nya ketika ditekan.
18. `ScaffoldMessenger`: *Widget* yang mengatur *widget* `SnackBar` lain.
19. `SnackBar`: *Widget* yang menampilkan pesan singkat di posisi bawah aplikasi.

### 3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` berfungsi untuk memberi tahu Flutter bahwa sebuah *widget stateful* telah berubah *state*-nya sehingga perlu di-*render* ulang oleh Flutter. Fungsi `setState()` sendiri dapat mengubah variabel-variabel yang dimiliki oleh sebuah *widget* (misalnya variabel `counter` pada *demo* Flutter yang dapat di-*increment* ketika ditekan) atau variabel-variabel lainnya yang menjadi bagian dari objek `State` dan digunakan dalam method `build()`.

### 4. Jelaskan perbedaan antara `const` dengan `final`.
`const` dan `final` sama-sama digunakan untuk menandakan sebuah variabel yang tidak dapat diganti. Namun, `const` sendiri merupakan sebuah *compile-time constant*, yang berarti nilai pada sebuah variabel `const` **harus** diketahui saat kode ingin di-*compile*. Sementara itu, `final` digunakan untuk variabel yang nilainya hanya diketahui pada *runtime*, yang artinya nilainya diketahui ketika kodenya dijalankan. Salah satu contoh di mana `const` dapat digunakan adalah untuk mendefinisikan konstanta matematika seperti berikut:
```Dart
const pi = 3.14;        // Memiliki nilai jelas saat compile time
const tau = 2 * pi;     // Dapat dihitung saat compile-time karena menggunakan variabel const lain
```
Salah satu contoh di mana `const` **tidak** dapat digunakan adalah sebagai berikut:
```Dart
const date = DateTime.now();    // Ini akan memberikan error karena variabel date hanya dapat diketahui nilainya setelah DateTime.now() dijalankan

final date = DateTime.now();    // Pada kasus ini, keyword final harus digunakan karena final memperbolehkan nilai suatu variabel diinisialisasi pada saat runtime
```
Selain kedua contoh di atas, ada juga beberapa perbedaan lain antara `const` dan `final`. Misalnya, `const` tidak dapat digunakan untuk *instance variable*, sedangkan `final` bisa. Kemudian, objek yang diinisialisasi ke variabel `const` otomatis akan bersifat `const` juga, bersama dengan semua elemen dan *field* di dalamnya, sehingga objek tersebut bersifat sepenuhnya *immutable*. Sementara itu, objek yang diinisialisasi ke variabel `final` tidak otomatis bersifat `final`, sehingga walaupun variabel itu sendiri tidak bisa diubah, isi dari objek yang disimpan dapat berubah, seperti *field*-nya dan lain-lain. 

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Pertama, saya membuat proyek Flutter baru dengan perintah `flutter create jokes_come_true`.
2. Kemudian, saya merapikan struktur proyek dengan memisahkan isi file `main.dart` menjadi file sendiri, yaitu `menu.dart`. Ini dilakukan untuk memisahkan *logic* untuk komponen aplikasi yang berbeda-beda agar lebih rapi dan mudah di-*maintain*.
3. Saya mengubah judul dari aplikasi di `main.dart` menjadi *Jokes Come True*.
4. Pada file `menu.dart`, saya menambah *widget stateless* baru yaitu `MyHomepage` untuk menyimpan *widget-widget* lain yang akan digunakan pada *view homepage*.
5. Saya menambah *widget* `InfoCard` untuk menyimpan informasi NPM, kelas, dan nama. *Widget* ini menggunakan widget `Card` dan `Text` dari Flutter.
6. Kemudian, saya menambah *widget* `ItemCard` yang akan menyimpan tombol-tombol yang dapat ditekan. *Widget* ini menggunakan *widget* `InkWell` dari Flutter dan ditambah ikon dan teks yang sesuai. Selain itu, ada *property* `onTap` yang akan menampilkan `SnackBar` yang berisi pesan ketika tombol ditekan. Untuk mengatur isi dari setiap `ItemCard`, dibuat *class* baru yaitu `ItemHomepage`. *Class* ini mengandung 3 *instance variable*: ikon, teks, dan warna. Nantinya, `ItemCard` akan menerima sebuah *instance* `ItemHomepage` agar isinya dapat disesuaikan dengan yang diinginkan. Saya membuat tiga tombol untuk melihat produk, menambah produk, dan logout dengan warna biru, hijau, dan merah berturut-turut.
7. Widget `ItemCard` dan `InfoCard` ditambahkan ke `MyHomepage` dan disusun menggunakan `Row`, `Column`, dan `GridView`. Posisi diatur menggunakan `Padding` dan *property-property* lain yang sesuai.
8. Saya membuat repositori baru di GitHub dan melakukan *add-commit-push*.

🕛 **Terakhir di-*update*:** 5 November 2024

## 📜 Log Riwayat README
N/A
<!--
<details>
<summary><b>Judul</b></summary>
</details>
-->