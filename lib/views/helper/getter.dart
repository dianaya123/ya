String name = "uwu";
String induk = "0w0";

void Name(String? lame) {
  name = lame.toString();
}

void NomorInduk(String? nomor) {
  induk = nomor.toString();
}

String userName() {
  return name;
}

String nomorInduk() {
  return induk;
}

var months = [
  "Januari",
  "Februari",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Agustus",
  "September",
  "Oktober",
  "November",
  "Desember"
];

String formattedDate() {
  DateTime now = DateTime.now();
  return '${now.day.toString()} ${months[now.month - 1]} ${now.year.toString()}';
}

String formattedTime() {
  DateTime now = DateTime.now();
  return '${now.hour.toString()}:${now.minute.toString()} WIB';
}
