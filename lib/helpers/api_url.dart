class ApiUrl {
  static const String baseUrl = "http://localhost:8080";
  static const String registrasi = '$baseUrl/regist';
  static const String login = '$baseUrl/login';
  static const String listProduk = '$baseUrl/products';
  static const String createProduk = '$baseUrl/products';

  static String updateProduk(int id) {
    return '$baseUrl/products/${id.toString()}';
  }

  static String showProduk(int id) {
    return '$baseUrl/products/${id.toString()}';
  }

  static String deleteProduk(int id) {
    return '$baseUrl/products/${id.toString()}';
  }
}