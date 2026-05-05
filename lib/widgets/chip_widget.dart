import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final IconData ikon;
  final Color warna;
  final int nilai;

  const ChipWidget({
    super.key,
    required this.label,
    required this.ikon,
    required this.warna,
    required this.nilai,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: warna.withAlpha(75),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color.fromARGB(255, 208, 208, 208).withAlpha(80),
        ),
      ),
      child: Row(
        children: [
          Icon(ikon, size: 16, color: Colors.white),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            nilai.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
