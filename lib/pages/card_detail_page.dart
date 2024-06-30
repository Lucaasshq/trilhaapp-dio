import 'package:flutter/material.dart';
import '../model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({super.key, required this.cardDetail});
  final CardDetail cardDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Image.network(
                    cardDetail.url,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cardDetail.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    cardDetail.text,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
