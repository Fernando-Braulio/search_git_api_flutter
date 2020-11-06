import 'package:flutter/material.dart';
import 'package:searchgithub/model/user.dart';
import 'package:searchgithub/repositorio/user_repositorio.dart';

class UserDetails extends StatefulWidget {
  //CRIANDO VARIAVEL username PARA RECEBER COMO PARAMETRO AO MUDAR SAIR DA TELA main
  String username;

  UserDetails({Key key, this.username}) : super(key: key); // CONSTRUTOR

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Future<User> futureUser;

  //INICIANDO O ESTADO PARA BUSCAR DADOS DA API LOGO APÓS ABRIR A TELA
  @override
  void initState() {
    super.initState();
    futureUser = getUser(widget
        .username); //CHAMANDO A FUNÇÃO QUE FOI CRIADA NO REPOSITORIO PASSANDO A VARIAVEL QUE FOI RECEBIDA NA CLASSE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.username,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff000000),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data.avatar_url),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            snapshot.data.name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add_location),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            (snapshot.data.location != null)
                                ? snapshot.data.location
                                : "Sem endereço cadastrado.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 13, bottom: 8, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.people),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Seguidores',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${snapshot.data.followers}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 13, bottom: 8, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.people_outline),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Seguindo',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${snapshot.data.following}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 13, bottom: 8, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.lock_open),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Repositório Publico',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${snapshot.data.public_repos}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                'Registro não encontrado!',
                style: TextStyle(fontSize: 24),
              );
            }

            //CASO O RETORNO DA API SEJÁ DEMORADO, UTILIZA O LOADING PADRÃO DO FLUTTER
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
