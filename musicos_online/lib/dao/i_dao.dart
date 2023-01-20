abstract class IDao<T> {
  Future create(T value);
  Future update(T value);
  Future<T> findOne(int id);
  Future delete(int id);
}
