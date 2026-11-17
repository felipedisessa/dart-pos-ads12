import 'package:flutter/material.dart';

import 'modelos.dart';
import 'sessao.dart';
import 'telas/home_tela.dart';
import 'telas/login_tela.dart';

void main() {
  runApp(const TwitterPro9000());
}

class TwitterPro9000 extends StatelessWidget {
  const TwitterPro9000({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Pro 9000',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1D9BF0),
        useMaterial3: true,
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Usuario?>(
      future: Sessao.carregar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final usuario = snapshot.data;
        return usuario == null ? const LoginTela() : HomeTela(usuario: usuario);
      },
    );
  }
}
