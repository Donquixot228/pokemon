import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon/pages/detail_screen.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find your pokemon',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 45),
            child: Text(
              'Search Pokémon by entering their name or using the Pokédex number.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black),
              maxLines: 1,
              controller: _textController,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[600]),
                errorText: null,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                hintText: "What Pokémon are you looking for? ",
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {

                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
