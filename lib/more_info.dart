import 'package:flutter/material.dart';
import 'package:untitled/utils/constants.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  int numContenedores = 0;
  final List<Color> coloresFondo = [fondo, fondo2, fondo3, fondo4];

  void agregaContainer() {
    setState(() {
      numContenedores++;
    });
  }

  Widget nuevoContainer(Color color) {
    return Expanded(
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: agregaContainer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: botones,
                  ),
                  child: const Text('Agregar Container'),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int numRows = 0; numRows < (numContenedores / 12); numRows++)
                    Row(
                      children: [
                        for (int colIndex = 0; colIndex < (numRows * 12 + 12 > numContenedores ? numContenedores - numRows * 12 : 12); colIndex++)
                          nuevoContainer(
                            coloresFondo[(numRows * 12 + colIndex) % coloresFondo.length],
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
