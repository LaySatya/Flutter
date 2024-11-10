import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final bool isFavorite;
  const FavoriteCard({super.key, required this.isFavorite});

  Color getColor() => isFavorite ? Colors.red : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey,
      ))),
      child: Row(
        children: [
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "title",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "description",
              )
            ],
          )),
          IconButton(
              onPressed: () => {},
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: getColor(),
              ))
        ],
      ),
    );
  }
}


void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
          ],
        ),
      ),
    ));
