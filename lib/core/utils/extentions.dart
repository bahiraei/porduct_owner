// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:math';

import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension Gender on String? {
  String? toGender() {
    if (this == '1') {
      return 'مرد';
    } else if (this == '2') {
      return 'زن';
    } else {
      return null;
    }
  }
}

extension PersianDateExtensions on DateTime? {
  /// جمعه 8 اردیبهشت 1375
  Jalali? toJalaliDate() {
    if (this == null) {
      return null;
    } else {
      Jalali jalali = Jalali.fromDateTime(this!);

      return jalali;
    }
  }
}

extension ConvertToServerDateTime on DateTime {
  String toServerDateTime() {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(this);
  }

  String toServerDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toServerTime() {
    return DateFormat('HH:mm:ss').format(this);
  }

  String toTime() {
    return DateFormat('HH:mm').format(this);
  }

  String fromTimePicketToServerTime() {
    return DateFormat('HH:mm').format(this);
  }
}

extension PriceLable on int {
  String get withPriceLabel => ' $this ریال';

  String withPriceSplit({String separator = ","}) {
    String str = "";
    String number = toString();
    var numberSplit = number.split('.');
    number = numberSplit[0].replaceAll(separator, '');
    for (var i = number.length; i > 0;) {
      if (i > 3) {
        str = separator + number.substring(i - 3, i) + str;
      } else {
        str = number.substring(0, i) + str;
      }
      i = i - 3;
    }
    if (numberSplit.length > 1) {
      str += '.${numberSplit[1]}';
    }

    return ' $str ' + 'ریال';
  }

  String withCompactPriceSplit({String separator = ","}) {
    String str = "";
    String number = toString();
    var numberSplit = number.split('.');
    number = numberSplit[0].replaceAll(separator, '');
    for (var i = number.length; i > 0;) {
      if (i > 3) {
        str = separator + number.substring(i - 3, i) + str;
      } else {
        str = number.substring(0, i) + str;
      }
      i = i - 3;
    }
    if (numberSplit.length > 1) {
      str += '.${numberSplit[1]}';
    }
    return str;
  }
}

extension JalaliDateComparison on Jalali {
  bool isGreaterThan(Jalali other) {
    DateTime dateTime1 = toDateTime();
    DateTime dateTime2 = other.toDateTime();
    return dateTime1.isAfter(dateTime2);
  }

  bool isLessThan(Jalali other) {
    DateTime dateTime1 = toDateTime();
    DateTime dateTime2 = other.toDateTime();
    return dateTime1.isBefore(dateTime2);
  }

  bool isEqualTo(Jalali other) {
    DateTime dateTime1 = toDateTime();
    DateTime dateTime2 = other.toDateTime();
    return dateTime1.isAtSameMomentAs(dateTime2);
  }
}

extension NumberLable on num {
  String get withPriceLabel => '$this';

  String withNumberSplit({String separator = ","}) {
    String str = "";
    String number = toStringAsFixed(0);
    var numberSplit = number.split('.');
    number = numberSplit[0].replaceAll(separator, '');
    for (var i = number.length; i > 0;) {
      if (i > 3) {
        str = separator + number.substring(i - 3, i) + str;
      } else {
        str = number.substring(0, i) + str;
      }
      i = i - 3;
    }
    if (numberSplit.length > 1) {
      str += '.${numberSplit[1]}';
    }

    return str;
  }
}

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    final rnd = Random();
    return min + rnd.nextInt(max - min);
  }
}
