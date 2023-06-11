import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feature/app/app.dart';
import 'feature/app/error_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (details) => ErrorApp(details: details);

  runApp(const ProviderScope(child: App()));
}
