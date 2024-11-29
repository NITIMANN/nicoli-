import 'package:flutter/material.dart';
import 'package:nicoli/artes.dart';
import 'package:nicoli/educ.dart';
import 'package:nicoli/estrangeira.dart';
import 'package:nicoli/informacao.dart';
import 'package:nicoli/literatura.dart';
import 'package:nicoli/portugues.dart';


class Linguagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ciências Humanas'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, 'Língua Estrangeira'),
              _buildButton(context, 'Tecnologia da informação e comunicação'),
              _buildButton(context, 'Literatura'),
              _buildButton(context, 'Português'),
              _buildButton(context, 'Artes'),
              _buildButton(context, 'Educação Física'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    return Container(
      width: 500,
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade900,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (title == 'Língua Estrangeira') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Estrangeira()),
            );
          } else if (title == 'Tecnologia da informação e comunicação') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Informacao()),
            );
          } else if (title == 'Literatura') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Literatura()),
            );
          } else if (title == 'Português') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Portugues()),
            );
          } else if (title == 'Artes') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Artes()),
            );
          } else if (title == 'Educação Física') {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context) => EducacaoFisica()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Você selecionou $title')),

            );
          }
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 24),
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
