import 'package:flutter/material.dart';
import 'package:nicoli/biologia.dart';
import 'package:nicoli/fisica.dart';
import 'package:nicoli/quimica.dart';



class Ciencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ciências da Natureza'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, 'Biologia'),
              _buildButton(context, 'Química'),
              _buildButton(context, 'Física'),

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
          if (title == 'Biologia') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Biologia()),
            );
          } else if (title == 'Química') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quimica()),
            );
          } else if (title == 'Física') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Fisica()),
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
