import 'package:flutter/material.dart';
import 'tela_principal.dart';
import 'materias.dart';
import 'minha_conta.dart';

void main() {
  runApp(MaterialApp(
    home: MeuApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  int indiceAtual = 0;

  List telas = [
    TelaPrincipal(),
    Materias(),
    MinhaConta(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceAtual,
        onTap: quandoClicar,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Login',
              backgroundColor: Colors.blue.shade900
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Materias',
              backgroundColor: Colors.blue.shade900
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Minha conta',
              backgroundColor: Colors.blue.shade900
          ),

        ],
      ),
    );
  }

  void quandoClicar(int index){
    setState(() {
      indiceAtual = index;
    });
  }

}