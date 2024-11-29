import 'package:flutter/material.dart';

class Artes extends StatelessWidget {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController textoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artes'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: textoController,
              decoration: InputDecoration(labelText: 'Texto'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão Salvar
                String titulo = tituloController.text;
                String texto = textoController.text;


                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cadastro salvo: $titulo')),
                );

                tituloController.clear();
                textoController.clear();
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
