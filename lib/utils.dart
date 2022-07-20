import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'container_pending.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.day);
final kLastDay = DateTime(2022, 12, 31);
String? hour;
String? day;
bool isPressed = false;
