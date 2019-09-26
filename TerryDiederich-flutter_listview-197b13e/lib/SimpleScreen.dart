import 'package:flutter/material.dart';
import 'package:flutter_listview/item_model.dart';

// This screen displays the item name when
// and item is tapped in the list
// An item is padded into the screen
class SimpleScreen extends StatelessWidget {
  SimpleScreen(this.item);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manutenção')),
      body: Center(
        child: Text(this.item.name),
      ),
    );
  }
}
