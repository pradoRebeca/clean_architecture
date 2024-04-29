import 'package:hyrule/domain/models/entry.dart';

abstract class AapiWorkflow {
  Future<List<Entry>> getEntryByCategory({required String category});
}
