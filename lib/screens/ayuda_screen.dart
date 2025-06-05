import 'package:flutter/material.dart';

class AyudaScreen extends StatelessWidget {
  const AyudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF6A5ACD);

    return Scaffold(
      appBar: AppBar(title: const Text('Ayuda'), backgroundColor: primaryColor),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.1),
              const Color(0xFF9575CD).withOpacity(0.05),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.help_outline,
                  size: 80,
                  color: Color(0xFF6A5ACD),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Acerca de esta aplicación',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A8A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              _buildInfoCard('¿Cómo usar?', [
                '1. Selecciona tu fecha de nacimiento en la pantalla principal',
                '2. Presiona "Ver Resultados" para conocer tu signo zodiacal y horóscopo chino',
                '3. En la pantalla de resultados verás información detallada sobre cada uno',
              ]),
              const SizedBox(height: 25),
              _buildInfoCard('Signo Zodiacal', [
                'Basado en la posición del sol en el momento de tu nacimiento',
                'Cada signo tiene características únicas y períodos específicos',
                'Existen 12 signos zodiacales en el sistema occidental',
              ]),
              const SizedBox(height: 25),
              _buildInfoCard('Horóscopo Chino', [
                'Determinado por el año de nacimiento según el calendario lunar',
                'Sigue un ciclo de 12 animales que se repite cada 12 años',
                'Cada animal tiene características y atributos especiales',
              ]),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Volver'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String titulo, List<String> items) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A5ACD),
              ),
            ),
            const SizedBox(height: 15),
            ...items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: Color(0xFF9575CD),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item,
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
}
