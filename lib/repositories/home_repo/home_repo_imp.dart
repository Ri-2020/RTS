import 'package:rts/remote/home/home_api_services.dart';
import 'package:rts/repositories/home_repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  HomeApiService homeApiService = HomeApiService();
  @override
  Future<Map<String, dynamic>> getLoggedInUserData() async {
    Map<String, dynamic> res = await homeApiService.getLoggedInUser();
    print("res : $res");
    return res;
  }
}
