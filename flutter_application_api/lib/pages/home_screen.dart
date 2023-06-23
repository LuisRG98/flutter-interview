import 'package:flutter/material.dart';
import 'package:flutter_application_api/provider/rick_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rickProvider = RickProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: rickProvider.getCharacter(),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 60,
        ),
        child: Column(
          children: [_characterSection()],
        ),
      ),
    );
  }
}

class _characterSection extends StatelessWidget {
  const _characterSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
