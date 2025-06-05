import 'package:flutter/material.dart';
import 'package:app_signo_zodiacal/screens/resultados_screen.dart';

class FechaScreen extends StatefulWidget {
  const FechaScreen({super.key});

  @override
  _FechaScreenState createState() => _FechaScreenState();
}

class _FechaScreenState extends State<FechaScreen> {
  DateTime _fechaNacimiento = DateTime.now();
  final Color _primaryColor = const Color(0xFF6A5ACD);
  final Color _secondaryColor = const Color(0xFF9575CD);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6A5ACD),
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _fechaNacimiento) {
      setState(() {
        _fechaNacimiento = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signo Zodiacal y Horóscopo Chino'),
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
              _secondaryColor.withOpacity(0.05),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.calendar_today,
                  size: 80,
                  color: Color(0xFF6A5ACD),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Descubre tu signo zodiacal y tu horóscopo chino',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A4A8A),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          '${_fechaNacimiento.day}/${_fechaNacimiento.month}/${_fechaNacimiento.year}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton.icon(
                          onPressed: () => _selectDate(context),
                          icon: const Icon(Icons.calendar_month),
                          label: const Text('Seleccionar Fecha'),
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ResultadosScreen(fecha: _fechaNacimiento),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    shadowColor: _primaryColor.withOpacity(0.5),
                  ),
                  child: const Text(
                    'Ver Resultados',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Jhami Calixto Mamani Quea',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 79, 110, 234),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
