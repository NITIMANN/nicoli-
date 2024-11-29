import 'package:flutter/material.dart';
import 'ciencia.dart';
import 'humana.dart';
import 'linguagem.dart';
import 'matematica.dart';
import 'redacao.dart';

class Materias extends StatefulWidget {
  @override
  _MateriasState createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  final List<Map<String, dynamic>> materias = [
    {'label': 'Ciências da Natureza', 'page': Ciencia()},
    {'label': 'Ciências Humanas', 'page': Humana()},
    {'label': 'Linguagens e Tecnologias', 'page': Linguagem()},
    {'label': 'Matemática e Tecnologias', 'page': Matematica()},
    {'label': 'Redação', 'page': Redacao()},
  ];

  List<Map<String, dynamic>> filteredMaterias = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMaterias = materias;
    searchController.addListener(filterMaterias);
  }

  void filterMaterias() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredMaterias = materias
          .where((materia) => materia['label']
          .toLowerCase()
          .contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(filterMaterias);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matérias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Pesquisar Matérias',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMaterias.length,
                itemBuilder: (context, index) {
                  return buildButton(
                    context,
                    filteredMaterias[index]['label'] as String,
                    filteredMaterias[index]['page'] as Widget,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String label, Widget page) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 125,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade900,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

