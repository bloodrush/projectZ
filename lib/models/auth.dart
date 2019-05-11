import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  bool _isLogged = false;
  String _firstName = '';
  String _lastName = '';
  String _email = '';

  String get fistName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  bool get isLogged => _isLogged;

  dynamic login(Map userData) {
    _isLogged = true;
    _firstName = userData['user']['firstName'];
    _lastName = userData['user']['secondName'];
    _email = userData['user']['email'];

    notifyListeners();
  }

  dynamic logout() {
    _isLogged = false;
    _firstName = '';
    _lastName = '';
    _email = '';

    notifyListeners();
  }
}
