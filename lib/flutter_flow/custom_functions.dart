import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String getWeatherImagePath(String? weatherCode) {
  switch (weatherCode) {
    case '0':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/3pfjhdhc3dfg/clear.png';
    case '1':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/ghzg9yzxr0nu/mostly-clear.png';
    case '2':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/16rhv75cx6d1/partly-cloudy.png';
    case '3':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/5ew2pirpay6m/overcast.png';
    case '45':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/1sma6o1l70xg/fog.png';
    case '48':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/z8cnjcsuc37u/icy-fog.png';
    case '51':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/702s1wld70gz/light-drizzle.png';
    case '53':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/uag6bpt6694k/drizzle.png';
    case '55':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/x3arkq82acjr/heavy-drizzle.png';
    case '61':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/puntxyfzc9ll/light-rain.png';
    case '63':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/yhyjf03znqit/rain.png';
    case '65':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/l2rykj9nfdoo/heavy-rain.png';
    case '71':
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/xb9e1aefyrgm/light-snow.png';
    case 73:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/8180rt16z9dg/snow.png';
    case 75:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/c59muj1dejvt/heavy-snow.png';
    case 80:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/puntxyfzc9ll/light-rain.png';
    case 81:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/kt8vwjmirj53/shower.png';
    case 82:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/gjxtjr5z6uyc/heavy-shower.png';
    case 95:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/fcm9rmvt0jbd/thunder-storm.png';
    case 96:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/2vwa6cnix7nv/thunder-storm-light-hail.png';
    case 99:
      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walk-point-u-r-i-bjsgl2/assets/kx6bkdlnzx8o/thunder-storm-hail.png';
    default:
      return 'assets/images/unknown-weather.png'; // Fallback for unknown codes
  }
}

String? newCustomFunction() {
  String formatTime(int hour, int minute) {
    return DateFormat('h:mm a').format(DateTime(2024, 1, 1, hour, minute));
  }

  List<Map<String, dynamic>> schedules = [
    {
      'name': '66 | URI / CCRI Warwick / Providence',
      'weekday': [
        for (int i = 5; i < 19; i++) formatTime(i, 30),
        for (int i = 19; i < 24; i++) formatTime(i, 0)
      ],
      'saturday': [
        '7:55 AM',
        '8:50 AM',
        '9:45 AM',
        '10:40 AM',
        '11:35 AM',
        '12:30 PM',
        '1:25 PM',
        '2:20 PM',
        '3:15 PM',
        '4:10 PM',
        '5:05 PM',
        '6:00 PM',
        '6:55 PM',
        '7:50 PM',
        '8:45 PM',
        '9:40 PM'
      ],
      'sunday': [
        '7:57 AM',
        '8:52 AM',
        '9:50 AM',
        '10:45 AM',
        '11:40 AM',
        '12:36 PM',
        '1:31 PM',
        '2:26 PM',
        '3:21 PM',
        '4:16 PM',
        '5:11 PM',
        '6:05 PM',
        '6:59 PM',
        '7:54 PM',
        '8:49 PM',
        '9:44 PM'
      ]
    },
    {
      'name': '64 | Newport/URI Kingston',
      'weekday': [
        '6:26 AM',
        '7:26 AM',
        '9:26 AM',
        '10:36 AM',
        '12:01 PM',
        '1:22 PM',
        '2:37 PM',
        '3:47 PM',
        '5:27 PM'
      ],
      'saturday': ['10:58 AM', '1:11 PM', '3:26 PM', '5:36 PM'],
      'sunday': []
    },
    {
      'name': '69 | Narragansett/Galilee',
      'weekday': [
        '6:15 AM',
        '7:10 AM',
        '8:10 AM',
        '9:10 AM',
        '10:10 AM',
        '11:10 AM',
        '12:10 PM',
        '1:10 PM',
        '2:10 PM',
        '3:10 PM',
        '4:10 PM',
        '5:10 PM',
        '6:10 PM',
        '7:15 PM',
        '8:30 PM',
        '9:30 PM',
        '10:30 PM',
        '11:30 PM',
        '12:30 AM'
      ],
      'saturday': [
        '8:50 AM',
        '9:45 AM',
        '10:40 AM',
        '11:35 AM',
        '12:30 PM',
        '1:25 PM',
        '2:20 PM',
        '3:15 PM',
        '4:10 PM',
        '5:05 PM',
        '6:00 PM',
        '6:55 PM',
        '7:50 PM',
        '8:45 PM',
        '9:40 PM',
        '10:35 PM'
      ],
      'sunday': [
        '8:50 AM',
        '9:45 AM',
        '10:40 AM',
        '11:35 AM',
        '12:30 PM',
        '1:25 PM',
        '2:20 PM',
        '3:15 PM',
        '4:10 PM',
        '5:05 PM',
        '6:00 PM',
        '6:55 PM',
        '7:50 PM',
        '8:45 PM',
        '9:40 PM',
        '10:35 PM'
      ]
    }
  ];

  String getDayType(DateTime time) {
    if (time.weekday >= 1 && time.weekday <= 5) {
      return 'weekday';
    } else if (time.weekday == 6) {
      return 'saturday';
    } else {
      return 'sunday';
    }
  }

  DateTime currentTime = DateTime.now();
  String currentDayType = getDayType(currentTime);
  List<String> upcomingRoutes = [];

  for (var schedule in schedules) {
    List<String> times = schedule[currentDayType];
    for (var time in times) {
      DateTime busTime = DateFormat.jm().parse(time);
      DateTime todayBusTime = DateTime(currentTime.year, currentTime.month,
          currentTime.day, busTime.hour, busTime.minute);
      if (todayBusTime.isAfter(currentTime)) {
        upcomingRoutes.add('${schedule['name']} - $time');
        if (upcomingRoutes.length == 3) {
          return upcomingRoutes.join(', ');
        }
      }
    }
  }
  return upcomingRoutes.isNotEmpty ? upcomingRoutes.join(', ') : null;
}

String? getNextRoute66() {
  String formatTime(int hour, int minute) {
    return DateFormat('h:mm a').format(DateTime(2024, 1, 1, hour, minute));
  }

  String getDayType(DateTime time) {
    if (time.weekday >= 1 && time.weekday <= 5) {
      return 'weekday';
    } else if (time.weekday == 6) {
      return 'saturday';
    } else {
      return 'sunday';
    }
  }

  List<String> getUpcomingTimes(
      String routeName,
      Map<String, List<String>> schedule,
      String currentDayType,
      DateTime currentTime) {
    List<String> upcomingTimes = [];
    List<String> times = schedule[currentDayType] ?? [];
    for (var time in times) {
      DateTime busTime = DateFormat.jm().parse(time);
      DateTime todayBusTime = DateTime(currentTime.year, currentTime.month,
          currentTime.day, busTime.hour, busTime.minute);
      if (todayBusTime.isAfter(currentTime)) {
        upcomingTimes.add('$routeName - $time');
        if (upcomingTimes.length == 1) {
          break;
        }
      }
    }
    return upcomingTimes;
  }

  Map<String, List<String>> schedule = {
    'weekday': [
      for (int i = 5; i < 19; i++) formatTime(i, 30),
      for (int i = 19; i < 24; i++) formatTime(i, 0)
    ],
    'saturday': [
      '7:55 AM',
      '8:50 AM',
      '9:45 AM',
      '10:40 AM',
      '11:35 AM',
      '12:30 PM',
      '1:25 PM',
      '2:20 PM',
      '3:15 PM',
      '4:10 PM',
      '5:05 PM',
      '6:00 PM',
      '6:55 PM',
      '7:50 PM',
      '8:45 PM',
      '9:40 PM'
    ],
    'sunday': [
      '7:57 AM',
      '8:52 AM',
      '9:50 AM',
      '10:45 AM',
      '11:40 AM',
      '12:36 PM',
      '1:31 PM',
      '2:26 PM',
      '3:21 PM',
      '4:16 PM',
      '5:11 PM',
      '6:05 PM',
      '6:59 PM',
      '7:54 PM',
      '8:49 PM',
      '9:44 PM'
    ]
  };

  DateTime currentTime = DateTime.now();
  String currentDayType = getDayType(currentTime);
  return getUpcomingTimes('66 | URI / CCRI Warwick / Providence', schedule,
          currentDayType, currentTime)
      .join(', ');
}

String? getNextRoute64() {
  String formatTime(int hour, int minute) {
    return DateFormat('h:mm a').format(DateTime(2024, 1, 1, hour, minute));
  }

  String getDayType(DateTime time) {
    if (time.weekday >= 1 && time.weekday <= 5) {
      return 'weekday';
    } else if (time.weekday == 6) {
      return 'saturday';
    } else {
      return 'sunday';
    }
  }

  List<String> getUpcomingTimes(
      String routeName,
      Map<String, List<String>> schedule,
      String currentDayType,
      DateTime currentTime) {
    List<String> upcomingTimes = [];
    List<String> times = schedule[currentDayType] ?? [];
    for (var time in times) {
      DateTime busTime = DateFormat.jm().parse(time);
      DateTime todayBusTime = DateTime(currentTime.year, currentTime.month,
          currentTime.day, busTime.hour, busTime.minute);
      if (todayBusTime.isAfter(currentTime)) {
        upcomingTimes.add('$routeName - $time');
        if (upcomingTimes.length == 1) {
          break;
        }
      }
    }
    return upcomingTimes;
  }

  Map<String, List<String>> schedule = {
    'weekday': [
      '6:26 AM',
      '7:26 AM',
      '9:26 AM',
      '10:36 AM',
      '12:01 PM',
      '1:22 PM',
      '2:37 PM',
      '3:47 PM',
      '5:27 PM'
    ],
    'saturday': ['10:58 AM', '1:11 PM', '3:26 PM', '5:36 PM'],
    'sunday': []
  };

  DateTime currentTime = DateTime.now();
  String currentDayType = getDayType(currentTime);
  return getUpcomingTimes(
          '64 | Newport/URI Kingston', schedule, currentDayType, currentTime)
      .join(', ');
}

String? getNextRoute69() {
  String formatTime(int hour, int minute) {
    String hourString = hour > 12 ? (hour - 12).toString() : hour.toString();
    String minuteString = minute.toString().padLeft(2, '0');
    String period = hour >= 12 ? 'PM' : 'AM';
    return '$hourString:$minuteString $period';
  }

  String getDayType(DateTime time) {
    if (time.weekday >= 1 && time.weekday <= 5) {
      return 'weekday';
    } else if (time.weekday == 6) {
      return 'saturday';
    } else {
      return 'sunday';
    }
  }

  List<String> getUpcomingTimes(
      String routeName,
      Map<String, List<String>> schedule,
      String currentDayType,
      DateTime currentTime) {
    List<String> upcomingTimes = [];
    List<String> times = schedule[currentDayType] ?? [];
    for (var time in times) {
      DateTime busTime = DateFormat.jm().parse(time);
      DateTime todayBusTime = DateTime(currentTime.year, currentTime.month,
          currentTime.day, busTime.hour, busTime.minute);
      if (todayBusTime.isAfter(currentTime)) {
        upcomingTimes.add('$routeName - $time');
        if (upcomingTimes.length == 1) {
          break;
        }
      }
    }
    return upcomingTimes;
  }

  Map<String, List<String>> schedule = {
    'weekday': [
      '6:15 AM',
      '7:10 AM',
      '8:10 AM',
      '9:10 AM',
      '10:10 AM',
      '11:10 AM',
      '12:10 PM',
      '1:10 PM',
      '2:10 PM',
      '3:10 PM',
      '4:10 PM',
      '5:10 PM',
      '6:10 PM',
      '7:15 PM',
      '8:30 PM',
      '9:30 PM',
      '10:30 PM',
      '11:30 PM',
      '12:30 AM'
    ],
    'saturday': [
      '8:50 AM',
      '9:45 AM',
      '10:40 AM',
      '11:35 AM',
      '12:30 PM',
      '1:25 PM',
      '2:20 PM',
      '3:15 PM',
      '4:10 PM',
      '5:05 PM',
      '6:00 PM',
      '6:55 PM',
      '7:50 PM',
      '8:45 PM',
      '9:40 PM',
      '10:35 PM'
    ],
    'sunday': [
      '8:50 AM',
      '9:45 AM',
      '10:40 AM',
      '11:35 AM',
      '12:30 PM',
      '1:25 PM',
      '2:20 PM',
      '3:15 PM',
      '4:10 PM',
      '5:05 PM',
      '6:00 PM',
      '6:55 PM',
      '7:50 PM',
      '8:45 PM',
      '9:40 PM',
      '10:35 PM'
    ]
  };

  DateTime currentTime = DateTime.now();
  String currentDayType = getDayType(currentTime);
  return getUpcomingTimes(
          '69 | Narragansett/Galilee', schedule, currentDayType, currentTime)
      .join(', ');
}
