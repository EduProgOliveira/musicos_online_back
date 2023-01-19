abstract class IGenericService<T> {
  Future<T> findOne(int id);
  Future<List<T>> findAll();
  Future<T> save(T value);
  Future<bool> delete(int id);
}
