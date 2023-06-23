import 'package:flutter/material.dart';
import 'package:flutter_application_api/models/rick_model.dart';
import 'package:flutter_application_api/provider/rick_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rickProvider = RickProvider();

  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text('Get'),
        onPressed: () {
          rickProvider.getCharacters();
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 60,
        ),
        child: Container(
          child: _characterScetion(),
        ),
      ),
    );
  }

  Widget _characterScetion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Characters'),
        const SizedBox(
          height: 10,
        ),
        AnimatedBuilder(
          animation: rickProvider,
          builder: (context, child) {
            if (rickProvider.requestStatus == RequestStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (rickProvider.requestStatus == RequestStatus.failed) {
              return const Center(
                child: Text('Something happened fetching movies'),
              );
            }

            return SizedBox(
              height: 500,
              child: _moviesCardsList(rickProvider.characters),
            );
          },
        ),
        FloatingActionButton(
          onPressed: () async {
            var url = Uri.https('example.com', 'whatsit/create');
            var response = await http.post(url, body: {'name': 'Luis'});
          },
          child: const Text('post'),
        )
      ],
    );
  }

  Widget _moviesCardsList(List<RickModel> characters) {
    return ListView.separated(
      itemCount: characters.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final character = characters[index];

        return _movieCard(character);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }

  Widget _movieCard(RickModel character) {
    return ListTile(
      title: Text(character.name),
    );
  }
}
