import 'package:rts/models/ressource_model.dart';
import 'package:rts/remote/resource/resource_api_services.dart';
import 'package:rts/repositories/resource_repo/resource_repo.dart';

class ResourceRepoImp extends ResourceRepo {
  ResourceApiService resourceApi = ResourceApiService();
  @override
  Future<List<Resource>> getAllResources() async {
    Map<String, dynamic> res = await resourceApi.getAllResources();
    List<Resource> resourceList = [];
    if (res != null && res.isNotEmpty) {
      resourceList = res["data"].map((e) => Resource.fromMap(e)).toList();
    }
    return resourceList;
  }
}
