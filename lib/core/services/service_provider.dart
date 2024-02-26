import 'package:http/http.dart' as http;

class ServiceProvider {
  String apiSecretKey = '4ca6bafb7393d477782ce4f7c5d12b8d';

  Future<String> getServiceProviderData(String city) async {
    try {
      var result = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$apiSecretKey'));
      return result.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
