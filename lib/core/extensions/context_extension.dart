import 'package:flutter/material.dart';

import '../local_datasource.dart';

extension BuildContextExtension on BuildContext {
  SecureStorageService get localStore => SecureStorageService();
}
