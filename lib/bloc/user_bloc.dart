import 'package:rxdart/rxdart.dart';
import 'package:second_flutter_app/models/user_response_model.dart';
import 'package:second_flutter_app/persistence/repository.dart';

class UserBloc {
  Repository _repository = Repository();

  final _userFetcher = PublishSubject<UserResponse>();

  Observable<UserResponse> get user => _userFetcher.stream;

  fetchUser() async {
    UserResponse userResponse = await _repository.fetchUser();
    _userFetcher.sink.add(userResponse);
  }

  dispose() {
    _userFetcher.close();
  }
}

final userBloc = UserBloc();