import 'package:flutter/material.dart';
import 'package:untitled/utils/constants.dart';
import 'more_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listaf = List.from(lista);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var element in listaf) {
      var items = element.split(' # ');
      int segundoNumero = int.parse(items[1]);
      int numEstrellas = int.parse(items[4]);

      if (int.parse(items[0]) % 2 == 0) {
        children.add(filaConBotones(context, segundoNumero, items[2], items[3], numEstrellas, eliminaCont));
      } else {
        children.add(filaSinBotones(context, segundoNumero, items[2], items[3], numEstrellas));
      }
    }

    return Scaffold(
      backgroundColor: fondo3,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Notificación de actividades',
                  style: TextStyle(
                      color: titulos,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ...children,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: fondo3,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'SEGUNDA VISTA: Rojas Martinez Jorge Angel',
          style: TextStyle(color: Colors.amber),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void eliminaCont(BuildContext context, int numero) {
    if (numero == 20 || numero == 23) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se puede eliminar el contenedor')),
      );
    } else {
      setState(() {
        listaf.removeWhere((element) => element.split(' # ')[1] == numero.toString());
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contenedor eliminado')),
      );
    }
  }
}

Widget filaSinBotones(BuildContext context, int numero, String titulo, String subtitulo, int estrellas) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MoreInfo()),
      );
    },
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$numero',
                  style: TextStyle(
                    color: fondo3,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  titulo,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Text(
                  subtitulo,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < estrellas ? Icons.star : Icons.star_border,
                      color: index < estrellas ? Colors.yellow : Colors.grey,
                      size: 16,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget filaConBotones(BuildContext context, int numero, String titulo, String subtitulo, int estrellas, Function eliminaCont) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$numero',
                style: TextStyle(
                  color: fondo3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                titulo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
              Text(
                subtitulo,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(5, (index) {
                  return Icon(
                    index < estrellas ? Icons.star : Icons.star_border,
                    color: index < estrellas ? Colors.yellow : Colors.grey,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10),
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoreInfo()),
                );
              },
              icon: Icon(Icons.edit, color: Colors.white),
              label: Text("Ver más"),
              style: ElevatedButton.styleFrom(
                backgroundColor: botones,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                eliminaCont(context, numero);
              },
              icon: Icon(Icons.delete, color: Colors.white),
              label: Text("Borrar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: botones,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
