abstract class IDao<T> {
  Future<bool> create(T value);
  Future<bool> update(T value);
  Future<T?> findOne(int id);
  Future<bool> delete(int id);
}
