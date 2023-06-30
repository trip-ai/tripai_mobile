import '../data/models/error_model.dart';
import '../data/models/itinerary_model.dart';
import '../data/repositories/itinerary_repository.dart';
import '../data/resources/remote/api_client.dart';
import '../data/resources/remote/exception/api_excaption.dart';
import '../data/resources/remote/http_services.dart';

class ItineraryService {
  final ApiClient client = HttpService();

  Future<List<ItineraryModel>> getAll() async {
    final repo = ItineraryRepository(client);

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

  Future<List<ItineraryModel>> getTop() async {
    final repo = ItineraryRepository(client);

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

  Future<List<ItineraryModel>> getRecommended() async {
    final repo = ItineraryRepository(client);

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

  Future<ItineraryModel> getById(int id) async {
    final repo = ItineraryRepository(client);

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
