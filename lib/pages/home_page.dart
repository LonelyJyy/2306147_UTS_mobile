import 'package:flutter/material.dart';
import 'package:pertemuan_4/models/quest.dart';
import 'package:pertemuan_4/pages/quest_detail_page.dart';
import 'package:pertemuan_4/widgets/header_widget.dart';
import 'package:pertemuan_4/widgets/quest_widget.dart';

class HomePage extends StatefulWidget {
  final String name;
  final int level;
  final String rank;
  final String job;

  const HomePage({
    super.key,
    required this.name,
    required this.level,
    required this.rank,
    required this.job,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Quest> quests = [
    Quest(
      id: '1',
      title: 'Membasmi Slime di Hutan',
      rank: 'F',
      reward: '500 Gold, 10 Exp',
      image: 'https://img.youtube.com/vi/KxG9q2CSbDM/maxresdefault.jpg',
      desc: 'Hutan timur desa diserang oleh kawanan Slime. Basmi 10 Slime untuk mengembalikan keamanan.',
    ),
    Quest(
      id: '2',
      title: 'Mengumpulkan Ramuan Herbal',
      rank: 'E',
      reward: '1000 Gold, 20 Exp, Potion x3',
      image: 'https://img.youtube.com/vi/KxG9q2CSbDM/maxresdefault.jpg',
      desc: 'Tabib desa membutuhkan ramuan herbal langka yang hanya tumbuh di lereng gunung.',
    ),
    Quest(
      id: '3',
      title: 'Misteri Goa Terbengkalai',
      rank: 'C',
      reward: '5000 Gold, 100 Exp, Magic Sword',
      image: 'https://img.youtube.com/vi/KxG9q2CSbDM/maxresdefault.jpg',
      desc: 'Terdengar suara aneh dari goa terbengkalai. Selidiki sumber suara tersebut dan amankan area.',
    ),
  ];

  void _navigateToDetail(Quest quest) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestDetailPage(quest: quest),
      ),
    );

    if (result == true) {
      setState(() {
        quest.isTaken = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quest Board', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey[800],
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              name: widget.name,
              level: widget.level,
              rank: widget.rank,
              job: widget.job,
            ),
            const SizedBox(height: 24),
            Text(
              "Available Quests",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: quests.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final quest = quests[index];
                  return QuestWidget(
                    quest: quest,
                    onTap: () => _navigateToDetail(quest),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
