import 'package:flutter/material.dart';

class Bitola extends StatefulWidget {
  const Bitola({super.key});

  @override
  State<Bitola> createState() => _BitolaState();
}

class _BitolaState extends State<Bitola> {
  double corrente = 0.0;
  double distancia = 0.0;

  double calcular110() {
    return (2 * corrente * distancia) / 294.64;
  }

  double calcular220() {
    return (2 * corrente * distancia) / 510.4;
  }

  void resultado() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(
          "Bitola 110V: ${calcular110().toStringAsFixed(2)} mm²\n"
          "Bitola 220V: ${calcular220().toStringAsFixed(2)} mm²",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de Bitola"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Corrente (A)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  corrente = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: "Distância (m)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  distancia = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  resultado();
                },
                child: Text("Calcular"),
              ),
              SizedBox(height: 20),
              Text(
                "Bitola 110V: ${calcular110().toStringAsFixed(2)} mm²",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Bitola 220V: ${calcular220().toStringAsFixed(2)} mm²",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Sair"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}