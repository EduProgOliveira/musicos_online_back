abstract class IGenericService<T> {
  Future<T?> findOne(int id);
  Future<List<T>> findAll();
  Future<bool> create(T value);
  Future<bool> delete(int id);
}
