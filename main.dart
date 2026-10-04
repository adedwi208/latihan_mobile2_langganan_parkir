//====================================
//HW2 : Langganan Parkir
//Nama: Ade Dwi Herdiansyah
//NIM: 1124160201
//====================================

// Enum yang digunakan untuk status member
enum StatusMember { member, nonMember }

// Enum yang digunakan untuk status tiket
enum StatusTiket { ada, hilang }

// penghitungan untuk denda ketika kehilangan tiket
const int dendaTiketHilang = 20000;

//fungsi untuk menghitung tarif progresif disetiap jam nya
int hitungTarifProgresif(int jam) {
  if (jam <= 1) {
    return 2000;
  } else if (jam == 2) {
    return 2000 + 1000;
  } else {
    return 2000 + 1000 + (jam - 2) * 3000;
  }
}

// fungsi untuk menghitung biaya parkir dengan status member dan status tiket
int hitungBiayaParkir(StatusMember member, StatusTiket tiket, int jam) {
  int biaya = 0;

  //pengecekan status member dimana ketika member terdaftar maka biaya akan 0 namun ketika member tidak terdaftar makan biaya akan menyesuaikan biaya progresif dihitung perjam
  switch (member) {
    case StatusMember.member:
      biaya = 0;
    case StatusMember.nonMember:
      biaya = hitungTarifProgresif(jam);
  }

  // pengecekan status tiket dimana jika status tiket ada maka tidak akan dikenakan denda tetapi jika status tiket hilang maka akan dikenakan denda sebesar 20000
  if (tiket == StatusTiket.hilang) {
    biaya = biaya + dendaTiketHilang;
  }

  return biaya;
}

void main() {
  print(
    'Member, tiket ada, 5 jam      : Rp${hitungBiayaParkir(StatusMember.member, StatusTiket.ada, 5)}',
  );
  print(
    'Member, tiket hilang, 2 jam   : Rp${hitungBiayaParkir(StatusMember.member, StatusTiket.hilang, 2)}',
  );
  print(
    'Non-member, tiket ada, 1 jam  : Rp${hitungBiayaParkir(StatusMember.nonMember, StatusTiket.ada, 1)}',
  );
  print(
    'Non-member, tiket ada, 4 jam  : Rp${hitungBiayaParkir(StatusMember.nonMember, StatusTiket.ada, 4)}',
  );
  print(
    'Non-member, tiket hilang, 3 jam: Rp${hitungBiayaParkir(StatusMember.nonMember, StatusTiket.hilang, 3)}',
  );
}
