import 'package:admin/src/app.dart';
import 'package:admin/src/core/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: AdminVisitorApp(),
  ));
}
