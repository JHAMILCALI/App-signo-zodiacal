import 'package:flutter/material.dart';
import 'package:app_signo_zodiacal/models/zodiaco_data.dart';
import 'package:app_signo_zodiacal/models/chino_data.dart';
import 'package:app_signo_zodiacal/screens/ayuda_screen.dart';

class ResultadosScreen extends StatefulWidget {
  final DateTime fecha;

  const ResultadosScreen({super.key, required this.fecha});

  @override
  _ResultadosScreenState createState() => _ResultadosScreenState();
}

class _ResultadosScreenState extends State<ResultadosScreen> {
  late String _signoZodiacal;
  late String _horoscopoChino;
  late List<String> _caracteristicasZodiaco;
  late List<String> _caracteristicasChino;
  late String _imagenZodiaco;
  late String _imagenChino;
  final Color _primaryColor = const Color(0xFF6A5ACD);

  @override
  void initState() {
    super.initState();
    _calcularSignoZodiacal();
    _calcularHoroscopoChino();
  }

  void _calcularSignoZodiacal() {
    final int dia = widget.fecha.day;
    final int mes = widget.fecha.month;

    for (var signo in zodiacoData) {
      if ((mes == signo['mes_inicio'] && dia >= signo['dia_inicio']) ||
          (mes == signo['mes_fin'] && dia <= signo['dia_fin'])) {
        setState(() {
          _signoZodiacal = signo['nombre'];
          _caracteristicasZodiaco = List<String>.from(signo['caracteristicas']);
          _imagenZodiaco = signo['imagen'];
        });
        break;
      }
    }
  }

  void _calcularHoroscopoChino() {
    final int ano = widget.fecha.year;
    final int index = (ano - 1900) % 12;

    setState(() {
      _horoscopoChino = chinoData[index]['animal'];
      _caracteristicasChino = List<String>.from(
        chinoData[index]['caracteristicas'],
      );
      _imagenChino = chinoData[index]['imagen'];
    });
  }

  Widget _buildCard(
    String titulo,
    List<String> caracteristicas,
    String imagen,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, _primaryColor.withOpacity(0.05)],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A4A8A),
              ),
            ),
            const SizedBox(height: 15),
            Image.asset(imagen, height: 150, width: 150),
            const SizedBox(height: 20),
            const Text(
              'Características:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A5ACD),
              ),
            ),
            const SizedBox(height: 10),
            ...caracteristicas
                .map(
                  (caract) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Color(0xFF9575CD),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            caract,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus Resultados'),
        backgroundColor: _primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {
              Navigator.pushNamed(context, '/ayuda');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _primaryColor.withOpacity(0.1),
              const Color(0xFF9575CD).withOpacity(0.05),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildCard(
                _signoZodiacal,
                _caracteristicasZodiaco,
                'assets/zodiaco/$_imagenZodiaco',
              ),
              const SizedBox(height: 30),
              _buildCard(
                _horoscopoChino,
                _caracteristicasChino,
                'assets/chino/$_imagenChino',
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
