import '../data/models/error_model.dart';
import '../data/models/place_model.dart';
import '../data/repositories/place_repository.dart';
import '../data/resources/remote/api_client.dart';
import '../data/resources/remote/exception/api_excaption.dart';
import '../data/resources/remote/http_services.dart';

class PlaceService {
  final ApiClient client = HttpService();

  Future<List<PlaceModel>> getAll() async {
    final repo = PlaceRepository(client);

    try {
      var list = await repo.getAll();
      return list;
    } on ApiException catch (error) {
      throw ErrorModel(
        id: 0,
        isFriendly: error.isFriendly,
        message: error.message,
      );
    } catch (e) {
      throw ErrorModel(id: 0, isFriendly: false, message: e.toString());
    }
  }

  Future<List<PlaceModel>> getTop() async {
    final repo = PlaceRepository(client);

    try {
      var list = await repo.getAll();
      return list;
    } on ApiException catch (error) {
      throw ErrorModel(
        id: 0,
        isFriendly: error.isFriendly,
        message: error.message,
      );
    } catch (e) {
      throw ErrorModel(id: 0, isFriendly: false, message: e.toString());
    }
  }

  Future<List<PlaceModel>> getRecommended() async {
    final repo = PlaceRepository(client);

    try {
      var list = await repo.getAll();
      return list;
    } on ApiException catch (error) {
      throw ErrorModel(
        id: 0,
        isFriendly: error.isFriendly,
        message: error.message,
      );
    } catch (e) {
      throw ErrorModel(id: 0, isFriendly: false, message: e.toString());
    }
  }

  Future<PlaceModel> getById(int id) async {
    final repo = PlaceRepository(client);

    try {
      var place = await repo.getById(id);

      return place;
    } on ApiException catch (error) {
      throw ErrorModel(
        id: 0,
        isFriendly: error.isFriendly,
        message: error.message,
      );
    } catch (e) {
      throw ErrorModel(id: 0, isFriendly: false, message: e.toString());
    }
  }
}
