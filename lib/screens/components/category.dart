import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/consts/categories.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    category: category,
                  ),
                ));
          },
          child: Ink(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 155, maxWidth: 155),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 2)),
              child: Center(
                child: Image.asset("$imagePath$category.png"),
              ),
            ),
          ),
        ),
        Text(
          categories[category]!,
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).colorScheme.primaryContainer),
        )
      ],
    );
  }
}
