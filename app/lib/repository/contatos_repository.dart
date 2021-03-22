import 'package:app/Api/CustonDio.dart';
import 'package:app/model/contato_model.dart';

class ContatosRepository {
  Future<List<ContatoModel>> findAll() {
    var dio = CustonDio.withAuthentication().instance;
    return dio.get('http://localhost:3000/contatos').then((res) {
      return res.data.map<ContatoModel>((c) => ContatoModel.fromMap(c)).toList()
          as List<ContatoModel>;
    }).catchError((err) => print(err));
  }

  Future<List<ContatoModel>> findFilter(String nome) {
    var dio = CustonDio.withAuthentication().instance;
    return dio
        .get('http://localhost:3000/contatos/filtrar?nome=$nome')
        .then((res) {
      return res.data.map<ContatoModel>((c) => ContatoModel.fromMap(c)).toList()
          as List<ContatoModel>;
    });
  }
}
