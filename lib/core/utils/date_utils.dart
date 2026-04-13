import 'package:intl/intl.dart';

const String dateApiFmt = 'yyyyMMdd';
const String dateTimeApiFmt = 'yyyyMMddHHmmss';
const String dateDisplayFmt = 'dd.MM.yyyy';
const String dateTimeDisplayFmt = 'dd.MM.yyyy HH:mm';

/// API tarih string → görüntüleme formatı "15.01.2024"
String formatDate(String? value) {
  if (value == null || value.isEmpty) return '—';
  try {
    final date = DateFormat(dateApiFmt).parseStrict(value);
    return DateFormat(dateDisplayFmt).format(date);
  } catch (_) {
    return value;
  }
}

/// API datetime string → görüntüleme formatı "15.01.2024 14:30"
String formatDateTime(String? value) {
  if (value == null || value.isEmpty) return '—';
  try {
    final date = DateFormat(dateTimeApiFmt).parseStrict(value);
    return DateFormat(dateTimeDisplayFmt).format(date);
  } catch (_) {
    return value;
  }
}

/// DateTime → API tarih string "20240115"
String? toApiDate(DateTime? value) {
  if (value == null) return null;
  return DateFormat(dateApiFmt).format(value);
}

/// DateTime → API datetime string "20240115143022"
String? toApiDateTime(DateTime? value) {
  if (value == null) return null;
  return DateFormat(dateTimeApiFmt).format(value);
}

/// API tarih string → DateTime
DateTime? fromApiDate(String? value) {
  if (value == null || value.isEmpty) return null;
  try {
    return DateFormat(dateApiFmt).parseStrict(value);
  } catch (_) {
    return null;
  }
}

/// API datetime string → DateTime
DateTime? fromApiDateTime(String? value) {
  if (value == null || value.isEmpty) return null;
  try {
    return DateFormat(dateTimeApiFmt).parseStrict(value);
  } catch (_) {
    return null;
  }
}
