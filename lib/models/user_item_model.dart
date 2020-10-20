
class User{
  String _username;
  String _firstName;
  String _lastName;
  String _image;

  User(parsedJson) {
    _username = parsedJson['username'];
    _firstName = parsedJson['first_name'];
    _lastName = parsedJson['last_name'];
    _image = parsedJson['image'];
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

}