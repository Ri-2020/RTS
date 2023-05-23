import 'package:rts/models/ressource_model.dart';

abstract class ResourceRepo {
  Future<List<Resource>> getAllResources();
}
