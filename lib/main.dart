import 'package:flutter/material.dart';
import 'package:searchgithub/user_details.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      title: "Busca GitHub",
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //DEIXANDO O CONTAINER COM TAMANHOS 100% DO APARELHO
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://icon-library.com/images/github-icon-png/github-icon-png-29.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Github",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 120.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.1)),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "GitHub Username",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.all(20),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                      child: Text(
                        'Buscar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      //CASO USUÁRIO TENHA INSERIDO O USERNAME, IR PARA A TELA DE DETALHES E TRAZER OS DADOS DA API
                      if (_controller.text != '') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetails(
                                username: _controller.text,
                              ),
                            ));
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
