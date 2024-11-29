import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Historia(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Historia extends StatefulWidget {
  @override
  _HistoriaState createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController textoController = TextEditingController();

  // Lista para armazenar os tópicos históricos
  List<Map<String, String>> historico = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('História'),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Navega para a página de histórico
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historico(historico: historico, onSalvarAlteracoes: _salvarAlteracoes)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: tituloController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: textoController,
                decoration: InputDecoration(
                  labelText: 'Texto',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,  // Permite que o campo de texto expanda dinamicamente
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String titulo = tituloController.text;
                  String texto = textoController.text;

                  // Verifica se ambos os campos foram preenchidos
                  if (titulo.isNotEmpty && texto.isNotEmpty) {
                    // Adiciona o novo tópico ao histórico
                    setState(() {
                      historico.add({'titulo': titulo, 'texto': texto});
                    });

                    // Exibe uma mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('História salva: $titulo')),
                    );

                    // Limpa os campos após salvar
                    tituloController.clear();
                    textoController.clear();
                  } else {
                    // Exibe uma mensagem de erro caso os campos não estejam preenchidos
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Preencha todos os campos!')),
                    );
                  }
                },
                child: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,  // Cor do botão
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função que será chamada para salvar as alterações no histórico
  void _salvarAlteracoes(Map<String, String> itemAlterado, int index) {
    setState(() {
      historico[index] = itemAlterado;  // Atualiza o item no histórico
    });
  }
}

class Historico extends StatelessWidget {
  final List<Map<String, String>> historico;
  final Function(Map<String, String>, int) onSalvarAlteracoes;

  Historico({required this.historico, required this.onSalvarAlteracoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Tópicos'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: historico.length,
          itemBuilder: (context, index) {
            var item = historico[index];
            return Card(
              margin: EdgeInsets.only(bottom: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  item['titulo']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(item['texto']!),
                contentPadding: EdgeInsets.all(16),
                onTap: () {
                  // Ao clicar em um tópico, abre a tela de edição
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarHistoria(
                        item: item, // Passa o item selecionado para a tela de edição
                        index: index, // Passa o índice do item para editar o histórico
                        onSalvarAlteracoes: onSalvarAlteracoes, // Passa a função de salvar alterações
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class EditarHistoria extends StatefulWidget {
  final Map<String, String> item;
  final int index;
  final Function(Map<String, String>, int) onSalvarAlteracoes;

  EditarHistoria({required this.item, required this.index, required this.onSalvarAlteracoes});

  @override
  _EditarHistoriaState createState() => _EditarHistoriaState();
}

class _EditarHistoriaState extends State<EditarHistoria> {
  late TextEditingController tituloController;
  late TextEditingController textoController;

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores com os valores existentes
    tituloController = TextEditingController(text: widget.item['titulo']);
    textoController = TextEditingController(text: widget.item['texto']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar História'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: textoController,
              decoration: InputDecoration(
                labelText: 'Texto',
                border: OutlineInputBorder(),
              ),
              maxLines: null,  // Permite que o campo de texto expanda dinamicamente
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String titulo = tituloController.text;
                String texto = textoController.text;

                // Verifica se ambos os campos foram preenchidos
                if (titulo.isNotEmpty && texto.isNotEmpty) {
                  // Atualiza o tópico no histórico
                  widget.item['titulo'] = titulo;
                  widget.item['texto'] = texto;

                  // Chama a função de callback para atualizar o histórico na tela principal
                  widget.onSalvarAlteracoes(widget.item, widget.index);

                  // Exibe uma mensagem de sucesso
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('História editada: $titulo')),
                  );

                  // Volta para a tela de histórico
                  Navigator.pop(context);
                } else {
                  // Exibe uma mensagem de erro caso os campos não estejam preenchidos
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Preencha todos os campos!')),
                  );
                }
              },
              child: Text('Salvar Alterações'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade900,  // Cor do botão
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
