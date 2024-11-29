import 'package:flutter/material.dart';
import 'package:nicoli/mate.dart';



class Matematica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matemática e suas tecnologias'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, 'Matemática e suas Tecnologias'),

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
          if (title == 'Matemática e suas Tecnologias') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MatTec()),
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
