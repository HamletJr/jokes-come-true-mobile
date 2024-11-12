# 🪶 Jokes Come True (Mobile)
**Nama:**   Joshua Montolalu<br>
**NPM:**    2306275746<br>
**Kelas:**  PBP F<br>

Versi mobile dari aplikasi web [Jokes Come True](https://github.com/HamletJr/jokes-come-true) menggunakan Flutter.

### Tugas Sebelumnya
| [Tugas 7](#7️⃣-tugas-7) | [Tugas 8](#8️⃣-tugas-8) |
| - | - |

## 8️⃣ Tugas 8
### 1. Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
Seperti yang pernah disebut sebelumnya, `const` dalam Flutter berguna untuk menetapkan sebuah *compile-time constant*, atau konstanta yang diketahui saat di-*compile*. Ini berguna ketika kita ingin memberitahu Flutter bahwa suatu variabel tidak akan berubah nilainya selama berjalannya program kita. Misalnya, pada `menu.dart`, digunakan *widget* `Text` untuk judul `AppBar` yang didefinisikan sebagai berikut:
```Dart
return Scaffold(
    appBar: AppBar(
    title: const Text(
        'Jokes Come True',
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),
    ),
    ...
    ),
)
```
Pada contoh di atas, diberi modifier `const` pada `Text` sehingga *property* `title` pada `AppBar` akan selalu merupakan sebuah *widget* `Text`. Tidak hanya itu, `const` menjamin bahwa isi variabel tersebut (*property*-nya) tidak akan berubah juga selama berjalannya aplikasi. Ini berarti isi *widget* `Text` juga tidak akan berubah, baik itu teksnya, *style*-nya, *color*-nya, dan semua *property* lainnya. Keuntungan menggunakan `const` dalam Flutter adalah Flutter tidak perlu melakukan *render* atau *build* ulang terhadap *widget* tersebut karena pasti tidak berubah. Selain itu, `const` juga mencegah kita dan developer lain untuk mengubah tanpa sengaja *widget* atau variabel yang seharusnya tidak berubah. `const` sebaiknya digunakan untuk *widget-widget* dan variabel-variabel yang **tidak diharapkan untuk berubah nilai-nya, khususnya saat di-*compile***. Seperti contoh di atas, judul dari aplikasi saya seharusnya tetap *Jokes Come True* selama berjalannya aplikasi, sehingga diberi modifier `const`. Sebaliknya, `const` tidak dapat digunakan untuk variabel yang tidak diketahui nilainya saat di-*compile* (gunakan `final` untuk *run-time constant*) atau variabel yang akan berubah terus, seperti *counter* pada demo Flutter.

### 2. Jelaskan dan bandingkan penggunaan *Column* dan *Row* pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
*Widget* `Column` digunakan untuk menyusun *widget* lain secara vertikal, sedangkan `Row` digunakan untuk menyusun elemen secara horizontal. Masing-masing elemen memiliki `mainAxisAlignment` (yang mengatur penempatan sejajar dengan arah masing-masing) dan `crossAxisAlignment` (yang mengatur penempatan secara tegak lurus dengan arah masing-masing).

Untuk contoh implementasinya ada dalam `menu.dart`, yaitu:
```Dart
child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(                            // Elemen kolom ke-1
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            InfoCard(title: 'NPM', content: npm),           // Elemen row ke-1
            InfoCard(title: 'Name', content: name),         // Elemen row ke-2
            InfoCard(title: 'Class', content: className),   // Elemen row ke-3
            ],
        ),
        const SizedBox(height: 16.0),   // Elemen kolom ke-2
        Center(                         // Elemen kolom ke-3
            child: Column(
                ...     // Elemen-elemen lain dalam kolom
            )
        )
        ]
    )
```
Dapat dilihat bahwa kedua widget tersebut dapat digunakan secara bersamaan dan di-*nesting* untuk penataan *widget* yang lebih tepat dan akurat. Terdapat `Column` pada level paling luar untuk menyimpan semua *widget* lain, kemudian disusun 3 *widget* di dalamnya secara vertikal, yaitu `Row`, `SizedBox`, dan `Center`. `Row` pun menyusun *widget* lain secara horizontal di dalamnya, yaitu `InfoCard`. Kemudian, ada `SizedBox` sebagai elemen ke-2 dan terakhir ada `Center` yang akan menempatkan *child widget*-nya di tengah. Dan ternyata ia menyimpan sebuah *widget* `Column` lain! Jadi widget `Row` dan `Column` dapat digunakan bersamaan untuk menata *widget* dalam Flutter.

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman *form* yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada tugas ini, saya hanya menggunakan elemen input `TextArea` untuk menerima input teks. Namun, elemen input Flutter tidak hanya terbatas pada `TextArea`, tetapi ada banyak elemen input lain yang dapat digunakan antara lain: 
- `Radio`: Untuk menerima satu input saja dari beberapa pilihan tertentu.
- `Slider`: Untuk menerima input dalam batasan tertentu.
- `DatePicker`: Untuk menerima input tanggal.
- `TimePicker`: Untuk menerima input waktu.
- `Switch`: Untuk menyediakan beberapa parameter yang dapat "dinyalakan" atau "dimatikan".
- `Checkbox`: Mirip dengan `Switch`, menyediakan beberapa parameter yang dapat di-*toggle*.
- ...dan masih banyak lagi.

### 4. Bagaimana cara kamu mengatur tema (*theme*) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi Flutter, Flutter menyediakan class `ThemeData` yang dapat didefinisikan dalam *widget* `MaterialApp`. Flutter akan menyimpan dan menggunakan definisi tema yang kita tentukan di sini, seperti warna dan font, sebagai default ketika kita tidak mendefinisikan tema khusus untuk *widget* dalam aplikasi kita. Sebaiknya *default theme* yang kita definisikan menggunakan `ThemeData` ini digunakan jika tidak ada keperluan *styling* khusus agar tema visual aplikasi kita tetap terjaga dan konsisten. Pada aplikasi saya, saya mendefinisikan tema warna dari aplikasi saya sebagai warna biru dalam `main.dart`. 
```Dart
theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.lightBlue,
    ).copyWith(secondary: Colors.lightBlue[400]),
),
```
Ini pun digunakan dalam *widget-widget* lain dalam aplikasi saya seperti pada `AppBar` dan `Drawer` menggunakan baris berikut:
```Dart
color: Theme.of(context).colorScheme.primary
```
Dengan demikian, widget-widget pada aplikasi saya tetap konsisten dan mengikuti warna yang ditetapkan dalam `main.dart`, bahkan jika saya misalnya ingin mengubah temanya ke warna hijau di kemudian hari.

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menangani navigasi dengan banyak halaman pada Flutter, kita dapat menggunakan *widget* yang menyimpan halaman-halaman tersebut, contohnya adalah `Drawer` yang digunakan dalam tugas ini. `Drawer` ini akan menyimpan halaman-halaman yang dapat dikunjungi, dan untuk menangani navigasi antar halaman sendiri, kita dapat menggunakan class `Navigator`. Ada beberapa method yang disediakan untuk navigasi, seperti `Navigator.push()` untuk *push route* baru ke atas *stack* (halaman yang ditampilkan dalam aplikasi otomatis merupakan *route* yang paling atas pada *stack*), `Navigator.pop()` untuk *pop* route teratas dan kembali ke route sebelumnya (jika ada), dan `Navigator.pushReplacement()`, yang akan *push* dan menggantikan *route* yang sekarang. `Navigator` juga menyediakan method lain seperti `Navigator.popUntil()`, `Navigator.pushNamed()`, dan `Navigator.pushNamedAndRemoveUntil()` yang dapat digunakan untuk meningkatkan UX dari aplikasi kita. 

🕛 **Terakhir di-*update*:** 6 November 2024

## 📜 Log Riwayat README

<details>
<summary><b>Tugas 7 (6/11/2024)</b></summary>

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
</details>