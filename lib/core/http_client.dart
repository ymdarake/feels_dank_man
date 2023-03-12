import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get(
    String authority,
    String unencodedPath, [
    Map<String, dynamic>? query,
  ]);
  Future<void> post();
}

class HttpClient implements IHttpClient {
  @override
  Future<http.Response> get(
    String authority,
    String unencodedPath, [
    Map<String, dynamic>? query,
  ]) {
    final client = http.Client();
    // TODO: impl http/s switch
    return client.get(Uri.https(authority, unencodedPath, query));
  }

  @override
  Future<void> post() {
    // TODO: implement post
    throw UnimplementedError();
  }
}
