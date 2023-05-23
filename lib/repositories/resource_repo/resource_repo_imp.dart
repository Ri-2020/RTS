import 'package:rts/models/ressource_model.dart';
import 'package:rts/remote/resource/resource_api_services.dart';
import 'package:rts/repositories/resource_repo/resource_repo.dart';

class ResourceRepoImp extends ResourceRepo {
  ResourceApiService resourceApi = ResourceApiService();
  @override
  Future<Map<String, dynamic>> getAllResources() async {
    Map<String, dynamic> res = await resourceApi.getAllResources();
    return res;
  }
}
