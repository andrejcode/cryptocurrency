import 'package:cryptocurrency/domain/entities/coin_entity.dart';
import 'package:flutter/material.dart';

class CoinListItem extends StatelessWidget {
  final CoinEntity coin;

  const CoinListItem({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '${coin.rank}. ${coin.name} (${coin.symbol})',
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              coin.isActive ? 'active' : 'inactive',
              style: TextStyle(
                  color: coin.isActive ? Colors.greenAccent : Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
