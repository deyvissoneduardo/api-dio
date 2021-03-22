import 'package:app/Api/CustonDio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  login() {
    var dio = CustonDio().instance;

    dio.post('http://localhost:3000/login',
        data: {'username': 'eduardo', 'password': 'admin'}).then((res) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res.data['token']);
    }).catchError((err) {
      throw Exception('Login ou senha inválidos');
    });
  }
}
