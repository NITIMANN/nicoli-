import 'package:flutter/material.dart';
import 'package:nicoli/filosofia.dart';
import 'package:nicoli/geografia.dart';
import 'package:nicoli/sociologia.dart';

import 'historia.dart';

import 'package:flutter/material.dart';

class Humana extends StatelessWidget {
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
              _buildButton(context, 'História'),
              _buildButton(context, 'Geografia'),
              _buildButton(context, 'Filosofia'),
              _buildButton(context, 'Sociologia'),
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
          if (title == 'História') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Historia()),
            );
          } else if (title == 'Geografia') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Geografia()),
            );
          } else if (title == 'Filosofia') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Filosofia()),
            );
          } else if (title == 'Sociologia') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sociologia()),
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
