import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:searchgithub/model/user.dart';

// FUNÇÃO PARA BUSCAR DADOS DA API, A FUNÇÃO RECEBE COMO PARAMETRO O username
// É UMA FUNÇÃO Future POR QUE O RETORNO NÃO É INSTANTÂNEO, TEM QUE AGUARDAR O RETORNO, É UM MÉTODO ASSÍNCRONO
Future<User> getUser(String username) async {
  final response = await http.get('https://api.github.com/users/${username}');

  //CASO O RETORNO DA API SEJÁ CODIGO 200, CONSEGUIU TRAZER OS DADOS DO USUÁRIO
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body)); // "CONVERTENDO" O RETORNO QUE É EM JSON PARA A CLASSE USER
  } else {
    throw ('Registro não encontrado!');
  }
}
