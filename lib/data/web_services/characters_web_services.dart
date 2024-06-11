import 'package:dio/dio.dart';
import 'package:shop/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get(charactersEndPoint);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        return data;
      } else {
        throw Exception('Failed to load characters');
      }
    } on Exception catch (e) {
      throw Exception('Failed to load characters: ${e.toString()}');
    }
  }
}
