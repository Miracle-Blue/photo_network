import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_network/pages/photo_page.dart';
import 'package:photo_network/services/http_service.dart';

import '../models/item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const id = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiGetPhoto();
  }

  void _apiGetPhoto() {
    Network.GET(Network.API_GET_PHOTO, Network.paramsEmpty()).then((response) {
      if (response != null) {
        items =
            List<Item>.from(jsonDecode(response).map((e) => Item.fromJson(e)));
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Photo Network"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => itemBuilder(items[index]),
        ),
      ),
    );
  }

  Widget itemBuilder(Item item) {
    return Container(
      height: 89,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.deepOrange,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoPage(item: item),
                ),
              );
            },
            child: Hero(
              tag: item.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: item.thumbnailUrl!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.title ?? "No Title",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
