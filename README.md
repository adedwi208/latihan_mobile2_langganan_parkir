#Sistem Parkir Langganan

#1. Problem Statment
  Sistem harus membaca member dan nonmember dan juga kehilangan tiket atau tidak kehilangan tiket, jika pelanggan sudah menjadi member di sistem pelanggan tidak akan dikenakan biaya parkir berapa lama pun pelanggan parkir, Tetapi ketika pelanggan tidak mempunyai member maka pelanggan akan dikenakan biaya parkir sesuai dengan biaya progresif yang sudah ditentukan, Dan jika tiket hilang akan dikenakan biaya denda, Biaya denda berlaku untuk member dan nonmember

#2. Actor
  |Aktor | Peran |
  |------| ----- |
  |Petugas Parkir | Memasukan data kendaraan (Status member, Status tiket, Lama parkir) Dan melihat total biaya yang harus dibayarkan. |
  |Pelanggan | Pengguna yang memakai jasa sistem parkir langganan. |

#3. Input Dan Output
  |Jenis | Data |
  |----- | ---- |
  |Input | Status member (member / non-member). |
  |Input | Status tiket (ada / hilang). |
  |Input | Lama parkir (jam). |
  |Output | 	Total biaya parkir (Rp). |

#4. Functional Requirement
  |Kode  | Functional Requirement |
  |----- | ---------------------- |
  |FR-01 | Sistem dapat menerima input status member, status tiket, dan lama parkir. |
  |FR-02 | Sistem dapat menentukan biaya dasar berdasarkan status member. |
  |FR-03 | Sistem dapat menghitung tarif progresif untuk non-member. |
  |FR-04 | Sistem dapat menambahkan denda jika tiket hilang. |
  |FR-05 | Sistem dapat menampilkan total biaya parkir. |

#5. Business Rules
  |Kode | Rules |
  |---- | ----- |
  |BR-01| Member bulanan parkir gratis (biaya dasar Rp0). |
  |BR-02| Non-member dikenakan tarif progresif: jam ke-1 Rp3.000, jam ke-2 Rp4.000, jam ke-3 dan seterusnya Rp5.000 per jam (angka tarif adalah asumsi). |
  |BR-03| Tiket hilang dikenakan denda Rp20.000. |
  |BR-04| Denda tiket hilang berlaku untuk semua pengguna, termasuk member (asumsi). |

#6. Decomposition
  Masalah dipecah menjadi langkah-langkah kecil:
    1.Menerima input data parkir
    2.Menentukan biaya dasar berdasarkan status member
      -Jika member, biaya dasar = 0
      -Jika non-member, hitung tarif progresif dari lama parkir
    3.Memeriksa status tiket dan menambahkan denda jika hilang
    4.Menampilkan total biaya

#7. Pattern Recognition
  1.Percabangan berdasarkan kategori: status member (2 pilihan) dan status tiket (2 pilihan) sama-sama diselesaikan dengan pemilihan kondisi.
  2.Tarif bertingkat: perhitungan non-member mengikuti pola bertingkat berdasarkan jam (jam ke-1, ke-2, ke-3 dst).
  3.Biaya = biaya dasar + tambahan: total selalu terdiri dari biaya dasar ditambah denda (jika ada).

#8. Flowchart
                     ┌─────────────┐
                     │    MULAI    │
                     └──────┬──────┘
                            ↓
                ┌──────────────────────┐
                │ Input member, tiket, │
                │       dan jam        │
                └──────────┬───────────┘
                           ↓
                    ┌────────────┐
                    │ biaya = 0  │
                    └─────┬──────┘
                          ↓
                  ┌─────────────────┐
                  │ Member terdaftar│
                  │       ?         │
                  └───────┬─────────┘
                    Ya ↓       ↓ Tidak
                 ┌───────┐   ┌─────────────────┐
                 │biaya=0│   │ Hitung tarif    │
                 └───┬───┘   │ progresif       │
                     │       └────────┬────────┘
                     │                ↓
                     │       ┌────────────────┐
                     │       │ jam <= 1 ?     │
                     │       └───────┬────────┘
                     │          Ya ↓    ↓ Tidak
                     │       Rp2.000   ┌────────────┐
                     │                 │ jam == 2 ? │
                     │                 └─────┬──────┘
                     │                  Ya ↓   ↓ Tidak
                     │                Rp3.000  │
                     │                        ↓
                     │               ┌─────────────────┐
                     │               │ 2000 + 1000 +   │
                     │               │ (jam-2) × 3000  │
                     │               └────────┬────────┘
                     └────────────────────────┘
                              ↓
                    ┌──────────────────┐
                    │   Tiket hilang?  │
                    └────────┬─────────┘
                       Ya ↓       ↓ Tidak
                  ┌────────────┐    │
                  │ biaya +=   │    │
                  │ Rp20.000   │    │
                  └──────┬─────┘    │
                         └─────┬─────┘
                               ↓
                     ┌────────────────┐
                     │  return biaya  │
                     └───────┬────────┘
                             ↓
                     ┌─────────────┐
                     │   SELESAI   │
                     └─────────────┘
  -
