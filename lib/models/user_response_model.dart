import 'package:second_flutter_app/models/pagination_model.dart';
import 'package:second_flutter_app/models/user_item_model.dart';


class UserResponse{
  List<User> _user;
  Pagination _pagination;

  UserResponse.fromJson(Map<String, dynamic> parsedJson) {
    List<User> user = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      User result = User(parsedJson['results'][i]);
      user.add(result);
    }
    _user = user;
    _pagination = Pagination(parsedJson['data']);
  }



  Pagination get pagination => _pagination;

  set pagination(Pagination value) {
    _pagination = value;
  }



  List<User> get user => _user;

  set user(List<User> value) {
    _user = value;
  }



}