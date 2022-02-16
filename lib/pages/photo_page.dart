import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/item_model.dart';

class PhotoPage extends StatefulWidget {

  final Item item;

  const PhotoPage({Key? key, required this.item}) : super(key: key);

  static const id = "/photo_page";

  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Hero(
          tag: widget.item.id.toString(),
          child: CachedNetworkImage(
            imageUrl: widget.item.url!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
