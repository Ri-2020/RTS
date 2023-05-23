import 'package:rts/models/ressource_model.dart';

abstract class ResourceRepo {
  Future<Map<String, dynamic>> getAllResources();
}
