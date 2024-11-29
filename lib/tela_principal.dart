import 'package:flutter/material.dart';
import 'package:nicoli/materias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void _handleLogin() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Materias()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: _buildLoginScreen(),
    );
  }

  // Método para construir a tela de login
  Widget _buildLoginScreen() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF5AD1D1),
            Color(0xFF0057B2),
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Learnfy",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100.0),
              Container(
                width: 300,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Insira seu email",
                                labelStyle: TextStyle(color: Colors.blue.shade900),
                                hintStyle: TextStyle(color: Colors.blue.shade100),
                                prefixIcon: Icon(Icons.email, color: Colors.blue.shade900),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty)
                                  return "Preenchimento Obrigatório";
                                if (!value.contains("@"))
                                  return "Email não é válido";
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Senha",
                                hintText: "Insira sua senha",
                                labelStyle: TextStyle(color: Colors.blue.shade900),
                                hintStyle: TextStyle(color: Colors.blue.shade100),
                                prefixIcon: Icon(Icons.password, color: Colors.blue.shade900),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty)
                                  return "Preenchimento Obrigatório";

                                if (value.length < 6 || value.length > 8)
                                  return "Senha deve ter de 6 a 8 caracteres";

                                if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                                  return "A senha deve conter pelo menos uma letra";
                                }

                                if (!RegExp(r'\d').hasMatch(value)) {
                                  return "A senha deve conter pelo menos um número";
                                }

                                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                  return "A senha deve conter pelo menos um caractere especial";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.blue.shade900),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                      ),
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    if (isLoading) CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MateriaisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materiais"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: Text(
          "Aqui estão os materiais disponíveis!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
