//use the uuid package for generating uniquie ids

import 'package:uuid/uuid.dart';

class Place {
  static final uniqueId = Uuid();

  Place({required this.title}) : id = uniqueId.v4();

  final title;
  final id;
}
