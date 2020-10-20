
class Pagination {
  int _count;
  String _next;
  String _previous;

  Pagination(parsedJson)  {
    _count = parsedJson['count'];
    _next = parsedJson['next'];
    _previous = parsedJson['previous'];
  }

  int get count => _count;

  set count(int value) {
    _count = value;
  }
  String get next => _next;

  set next(String value) {
    _next = value;
  }
  String get previous => _previous;

  set previous(String value) {
    _previous = value;
  }
}