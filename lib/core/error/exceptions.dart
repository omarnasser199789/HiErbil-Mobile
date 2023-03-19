class ServerException implements Exception {
}

class CacheException implements Exception {}
class EException implements Exception {
  EException({required this.statusCode});
   int statusCode;
}