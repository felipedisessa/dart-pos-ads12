import 'package:flutter/material.dart';

class HomeTela extends StatelessWidget {
  const HomeTela({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school, size: 80, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              'Tela Principal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Abra o menu para ver as disciplinas de cada período.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
