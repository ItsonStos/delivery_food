import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class HighlightsPage extends StatelessWidget {
  const HighlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                'Destaque do Dia',
                style: TextStyle(
                  fontFamily: "Caveat",
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MediaQuery.of(context).orientation == Orientation.landscape ? const _landscapeList() : const _portraitList(),
        ],
      ),
    );
  }
}

class _portraitList extends StatelessWidget {
  const _portraitList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (
          context,
          index,
        ) {
          return HighlightItem(
            imageURI: destaques[index]['image'],
            itemTitle: destaques[index]['name'],
            itemPrice: destaques[index]['price'],
            itemDescription: destaques[index]['description'],
          );
        },
        childCount: destaques.length,
      ),
    );
  }
}

class _landscapeList extends StatelessWidget {
  const _landscapeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: destaques[index]['image'],
            itemTitle: destaques[index]['name'],
            itemPrice: destaques[index]['price'],
            itemDescription: destaques[index]['description'],
          );
        },
        childCount: destaques.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
    );
  }
}
