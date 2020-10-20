import 'package:second_flutter_app/models/user_response_model.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<UserResponse> fetchUser() => appApiProvider.fetchUser();
}