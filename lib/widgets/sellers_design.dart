import 'package:flutter/material.dart';

import '../home_screen/menus_screen.dart';
import '../models/sellers.dart';

// ignore: must_be_immutable
class SellersDesignWidget extends StatefulWidget {
  Sellers? model;
  BuildContext? context;

  SellersDesignWidget({super.key, this.model, this.context});

  @override
  // ignore: library_private_types_in_public_api
  _SellersDesignWidgetState createState() => _SellersDesignWidgetState();
}

class _SellersDesignWidgetState extends State<SellersDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => MenusScreen(model: widget.model)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.sellerAvatarUrl!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1.0,
              ),
              Text(
                widget.model!.sellerName!,
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontFamily: "Train",
                ),
              ),
              Text(
                widget.model!.sellerEmail!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
