import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';
import 'package:hyrule/utils/theme.dart';

class EntryCard extends StatelessWidget {
  EntryCard({Key? key, required this.entry, required this.isSaved})
      : super(key: key);

  final Entry entry;
  final bool isSaved;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      child: Dismissible(
        key: ValueKey<int>(entry.id),
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
        },
        background: Container(
          color: Colors.redAccent,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.delete),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(entry: entry),
                    ));
              },
              child: Ink(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: SizedBox(
                    height: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    entry.image,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                            clipBehavior: Clip.hardEdge,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    entry.name.toUpperCase(),
                                    style: EntryDecoration.titleText,
                                  ),
                                ),
                                Text(
                                  entry.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              padding: const EdgeInsets.all(8),
              child: Wrap(
                spacing: 8.0,
                children: entry
                    .commonLocationsDecode()
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
