abstract class IDao<T> {
  Future<bool> create(T value);
  Future<bool> update(Map<String, dynamic> params);
  Future<T?> findOne(int id);
  Future<bool> delete(int id);
}
