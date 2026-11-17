import 'package:flutter/material.dart';

import 'telas/home_tela.dart';
import 'telas/semestre_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Drawer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // 0 = Home, 1 = Primeiro, 2 = Segundo, 3 = Terceiro
  int _telaSelecionada = 0;

  static const List<String> _titulos = [
    'Home',
    'Primeiro período',
    'Segundo período',
    'Terceiro período',
  ];

  static const List<Widget> _telas = [
    HomeTela(),
    SemestreTela(
      periodo: 'Primeiro período',
      disciplinas: [
        'Algoritmos e Lógica de Programação',
        'Fundamentos de Sistemas de Informação',
        'Matemática Discreta',
        'Arquitetura de Computadores',
        'Inglês Técnico',
      ],
    ),
    SemestreTela(
      periodo: 'Segundo período',
      disciplinas: [
        'Estrutura de Dados',
        'Programação Orientada a Objetos',
        'Banco de Dados I',
        'Sistemas Operacionais',
        'Estatística',
      ],
    ),
    SemestreTela(
      periodo: 'Terceiro período',
      disciplinas: [
        'Desenvolvimento Mobile I',
        'Engenharia de Software',
        'Banco de Dados II',
        'Redes de Computadores',
        'Interface Humano-Computador',
      ],
    ),
  ];

  void _selecionar(int indice) {
    setState(() {
      _telaSelecionada = indice;
    });
    // Fecha o Drawer
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulos[_telaSelecionada]),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _telas[_telaSelecionada],
      drawer: Drawer(
        child: ListView(
          // Importante: remover qualquer padding do ListView.
          padding: EdgeInsets.zero,
          children: [
            // Parte 2 - Header de usuário (nome e e-mail fake)
            const UserAccountsDrawerHeader(
              accountName: Text('Ana Souza'),
              accountEmail: Text('ana.souza@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            // Parte 1 - DrawerHeader com o título "Curso"
            const SizedBox(
              height: 72,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  'Curso',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _telaSelecionada == 0,
              onTap: () => _selecionar(0),
            ),
            ListTile(
              leading: const Icon(Icons.looks_one),
              title: const Text('Primeiro período'),
              selected: _telaSelecionada == 1,
              onTap: () => _selecionar(1),
            ),
            ListTile(
              leading: const Icon(Icons.looks_two),
              title: const Text('Segundo período'),
              selected: _telaSelecionada == 2,
              onTap: () => _selecionar(2),
            ),
            ListTile(
              leading: const Icon(Icons.looks_3),
              title: const Text('Terceiro período'),
              selected: _telaSelecionada == 3,
              onTap: () => _selecionar(3),
            ),
          ],
        ),
      ),
    );
  }
}
