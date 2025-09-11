import 'dart:io';

class MenuItem {
  String id;
  String name;
  int price;
  int stock;

  MenuItem(this.id, this.name, this.price, this.stock);
}

class OrderItem {
  MenuItem menuItem;
  int quantity;

  OrderItem(this.menuItem, this.quantity);
}

class OutOfStockException implements Exception {
  final String message;
  OutOfStockException(this.message);
  @override
  String toString() => "OutOfStockException: $message";
}

class InvalidOrderException implements Exception {
  final String message;
  InvalidOrderException(this.message);
  @override
  String toString() => "InvalidOrderException: $message";
}

abstract class MenuFetcher {
  Future<MenuItem?> fetch(String id);
}

abstract class OrderUpdater {
  Future<void> updateStock(String id, int change);
}

void main(){

  DateTime waktuSekarang = DateTime.now();

  //jam buka-tutup
  DateTime waktuBuka = DateTime(waktuSekarang.year, waktuSekarang.month, waktuSekarang.day, 8, 0, 0);
  DateTime waktuTutup = DateTime(waktuSekarang.year, waktuSekarang.month, waktuSekarang.day, 16, 0, 0);

  while (true){
    if (waktuSekarang.isAfter(waktuBuka) && waktuSekarang.isBefore(waktuTutup)){
    print('SELAMAT DATANG DI KANTIN AW!\n');
    } else {
      print('Toko tutup, silakan datang kembali pukul 08:00 - 16:00. Terimakasih!');
      break;
    }

    while (true){
      stdout.write('Silahkan Pilih Tipe Menu:\n1. Menu Spesial\n2. Menu Prasmanan\nPilihan Anda: ');
      if (stdin.readLineSync() == '1'){
        print('Anda memilih Menu Spesial\n');
        break;
      } else if (stdin.readLineSync() == '2'){
        print('Anda memilih Menu Prasmanan\n');
        break;
      } else {
        print('Pilihan tidak valid, silakan coba lagi.\n');
      }
    }

    var menuSpesial = [
      MenuItem("1", "Nasi Goreng Merah", 15000, 10),
      MenuItem("2", "Mie Goreng Jakarta", 15000, 10),
      MenuItem("4", "Paket Ayam Geprek", 15000, 10),
      MenuItem("5", "Paket Telur Gimbal", 12000, 10),
      MenuItem("6", "Bakso Kuah", 15000, 10),
      MenuItem("7", "Beef Teriyaki", 20000, 10),
      MenuItem("8", "Beef Patty", 15000, 10),
      MenuItem("9", "Ketang Goreng", 15000, 10)
    ];

    for (var item in menuSpesial) {
      print("${item.id}. ${item.name} - Rp${item.price}");
    }
    stdout.write('Masukkan ID menu yang ingin dipesan: ');
    
  }
}