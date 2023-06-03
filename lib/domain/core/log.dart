// main.dart
import 'dart:developer' as developer;

// Blue text
void logInfo(String msg) {
  // logInfo('benifiapp info $msg');
  developer.log('\x1B[34m$msg\x1B[0m');
}

// Green text
void logSuccess(String msg) {
  // logInfo('benifiapp success $msg');
  developer.log('\x1B[32m$msg\x1B[0m');
}

// Yellow text
void logWarning(String msg) {
  // logInfo('benifiapp warning $msg');
  developer.log('\x1B[33m$msg\x1B[0m');
}

// Red text
void logError(String msg) {
  // logInfo('benifiapp error $msg');
  developer.log('\x1B[31m$msg\x1B[0m');
}
