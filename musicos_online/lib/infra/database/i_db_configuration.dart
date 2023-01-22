abstract class IDbConfiguration {
  Future<dynamic> createConnection();
  Future<dynamic> get connection;
}
