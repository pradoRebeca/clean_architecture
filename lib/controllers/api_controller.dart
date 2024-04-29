import 'package:hyrule/data/api/data_aip.dart';
import 'package:hyrule/domain/business/api_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

class ApiController implements AapiWorkflow {
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntryByCategory({required String category}) {
    return dataApi.getEntriesByCategory(category: category);
  }
}
