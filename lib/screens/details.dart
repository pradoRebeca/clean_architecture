import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/theme.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.entry}) : super(key: key);
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          daoController.saveEntry(entry: entry);
        },
        child: const Icon(Icons.bookmark),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              entry.name.toUpperCase(),
              style: EntryDecoration.titleText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Wrap(
                spacing: 8.0,
                children: entry
                    .commonLocationsDecode()
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
            ),
            Container(
                height: 220,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.network(
                  entry.image,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(entry.description),
            )
          ],
        ),
      ),
    ));
  }
}
