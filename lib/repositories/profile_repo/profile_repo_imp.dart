import 'package:rts/repositories/profile_repo/profile_repo.dart';
import 'package:rts/remote/profile/profile_api_services.dart';

class ProfileRepoImp extends ProfileRepo {
  ProfileApiServices profileApiServices = ProfileApiServices();
  @override
  Future<bool> updateProfile(Map<String, dynamic> data) async {
    var res = await profileApiServices.updateProfile(data);
    if (res["status"] == "success") {
      return true;
    }
    return false;
  }

  @override
  Future<Map<String, dynamic>> addSkillAndSocialMedia(
      Map<String, dynamic> data) async {
    var res = await profileApiServices.addSkillAndSocialMedia(data);
    print("res :: $res");
    return res;
  }

  @override
  Future<bool> removeSkillAndSocialMedia(Map<String, dynamic> data) async {
    var res = await profileApiServices.removeSkillAndSocialMedia(data);
    if (res["status"] == "success") {
      return true;
    }
    return false;
  }
}
