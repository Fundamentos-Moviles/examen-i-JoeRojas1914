import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String usuario = '';
  String contrasena = '';
  String mensajeRetroalimentacion = '';

  void _login() {
    setState(() {
      if (usuario.isEmpty || contrasena.isEmpty) {
        mensajeRetroalimentacion = 'Datos incompletos';
      } else if (usuario != 'test') {
        mensajeRetroalimentacion = 'Usuario incorrecto';
      } else if (contrasena != 'FDM1') {
        mensajeRetroalimentacion = 'Contraseña incorrecta';
      } else {
        mensajeRetroalimentacion = '';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    });
  }

  Row rowDeFondo() {
    final List<Color> coloresFondo = [fondo, fondo2, fondo3, fondo4];
    return Row(
      children: List.generate(4, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: coloresFondo[Random().nextInt(coloresFondo.length)],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo3,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: rowDeFondo()),
              Expanded(child: rowDeFondo()),
              Expanded(child: rowDeFondo()),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: titulos,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) => usuario = value.trim(),
                      decoration: InputDecoration(
                        hintText: 'Correo/Usuario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      onChanged: (value) => contrasena = value.trim(),
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (mensajeRetroalimentacion.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          mensajeRetroalimentacion,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botones,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Mi primer examen, ¿estará sencillo?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
