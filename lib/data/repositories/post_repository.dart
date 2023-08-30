import 'package:instagram/data/repositories/api/api.dart';

class PostRepository {
  final API _api = API();

  void fetchPost() async {
    try {
      var response = _api.sendRequest.get("/photos");
    } catch (ex) {
      rethrow;
    }
  }
}
