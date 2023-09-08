import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double initialValue = 13928143.193128213092;
  double interestRate = 23.51232131;
  int numberOfInstallments = 16;

  double simpleInterest = 0;
  double compoundInterest = 0;
  double bitcoinConversion = 0;
  double ethereumConversion = 0;
  int parcels = 0;
  double monteCarloPi = 0;

  void calculate() {
    simpleInterest = initialValue * (interestRate / 100) * numberOfInstallments;

    compoundInterest =
        initialValue * (pow(1 + interestRate / 100, numberOfInstallments)) -
            initialValue;

    bitcoinConversion = initialValue * 0.00002;
    ethereumConversion = initialValue * 0.0008;

    parcels = (initialValue / 12.99).floor();

    setState(() {
      simpleInterest = simpleInterest;
      compoundInterest = compoundInterest;
      bitcoinConversion = bitcoinConversion;
      ethereumConversion = ethereumConversion;
      parcels = parcels;
    });
  }

  void startMonteCarlo() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      monteCarlo();
    });
  }

  void monteCarlo() {
    int totalPoints = 1000000; // Número total de pontos a serem gerados
    int insideCircle = 0;

    for (int i = 0; i < totalPoints; i++) {
      double x = Random().nextDouble(); // Coordenada x aleatória
      double y = Random().nextDouble(); // Coordenada y aleatória

      // Verifica se o ponto está dentro do círculo
      if (x * x + y * y <= 1) {
        insideCircle++;
      }
    }

    // Estima o valor de π
    monteCarloPi = 4 * (insideCircle / totalPoints);

    setState(() {
      monteCarloPi = monteCarloPi;
    });
  }

  @override
  void initState() {
    super.initState();
    calculate();
    startMonteCarlo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Financeira"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Juros Simples: R\$ $simpleInterest"),
            Text("Juros Compostos: R\$ $compoundInterest"),
            Text("Bitcoin: BTC $bitcoinConversion"),
            Text("Ethereum: ETH $ethereumConversion"),
            Text("Parcelas de R\$12,99: $parcels parcelas"),
            Text("Estimativa de π (Monte Carlo): $monteCarloPi"),
          ],
        ),
      ),
    );
  }
}
