import 'package:flutter/material.dart';

class SemestreTela extends StatelessWidget {
  const SemestreTela({
    super.key,
    required this.periodo,
    required this.disciplinas,
  });

  final String periodo;
  final List<String> disciplinas;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Disciplinas - $periodo',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        for (final disciplina in disciplinas)
          Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(disciplina),
            ),
          ),
      ],
    );
  }
}
