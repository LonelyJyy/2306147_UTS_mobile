import 'package:flutter/material.dart';
import 'package:pertemuan_4/models/quest.dart';

class QuestWidget extends StatelessWidget {
  final Quest quest;
  final VoidCallback onTap;

  const QuestWidget({super.key, required this.quest, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.blueGrey[200]!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withAlpha(20),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: quest.isTaken ? Colors.green[100] : Colors.blueGrey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                quest.isTaken ? Icons.check_circle : Icons.circle_outlined,
                color: quest.isTaken ? Colors.green : Colors.blueGrey,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Rank ${quest.rank}",
                          style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          quest.reward,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
}
