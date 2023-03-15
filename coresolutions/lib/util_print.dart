// ignore_for_file: avoid_print
import 'dart:developer';

void ulog(String message) {
  final String dateTimeNow = DateTime.now().toString();
  log('utillog:$dateTimeNow:$message');
}

// ignore: avoid_final_parameters, type_annotate_public_apis
void ulogList(final list) {
  for (final element in list) {
    ulog(element.name.toString());
  }
}

void printWarning(dynamic value) {
  print('\x1B[33m=================WARNING==================\x1B[0m');
  print('\x1B[33m$value\x1B[0m');
  print('\x1B[33m==========================================\x1B[0m');
}

void printError(dynamic value) {
  print('\x1B[31m=================ERROR==================\x1B[0m');
  print('\x1B[31m$value\x1B[0m');
  print('\x1B[31m========================================\x1B[0m');
}

void printInfo(dynamic value) {
  print('\x1B[35m=================INFO==================\x1B[0m');
  print('\x1B[35m$value\x1B[0m');
  print('\x1B[35m=======================================\x1B[0m');
}
