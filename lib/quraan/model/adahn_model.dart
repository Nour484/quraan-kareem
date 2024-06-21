import 'dart:convert';

class PrayerTimesResponse {
  final int code;
  final String status;
  final Data data;

  PrayerTimesResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimesResponse(
      code: json['code'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final Timings timings;
  final Date date;
  final Meta meta;

  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: Timings.fromJson(json['timings']),
      date: Date.fromJson(json['date']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstthird;
  final String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstthird: json['Firstthird'],
      lastthird: json['Lastthird'],
    );
  }
}

class Date {
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json['readable'],
      timestamp: json['timestamp'],
      hijri: Hijri.fromJson(json['hijri']),
      gregorian: Gregorian.fromJson(json['gregorian']),
    );
  }
}

class Hijri {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: Weekday.fromJson(json['weekday']),
      month: Month.fromJson(json['month']),
      year: json['year'],
      designation: Designation.fromJson(json['designation']),
      holidays: List<dynamic>.from(json['holidays']),
    );
  }
}

class Gregorian {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: Weekday.fromJson(json['weekday']),
      month: Month.fromJson(json['month']),
      year: json['year'],
      designation: Designation.fromJson(json['designation']),
    );
  }
}

class Weekday {
  final String en;
  final String? ar;

  Weekday({
    required this.en,
    this.ar,
  });

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class Month {
  final int number;
  final String en;
  final String? ar;

  Month({
    required this.number,
    required this.en,
    this.ar,
  });

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(
      number: json['number'],
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class Designation {
  final String abbreviated;
  final String expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      abbreviated: json['abbreviated'],
      expanded: json['expanded'],
    );
  }
}

class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      timezone: json['timezone'],
      method: Method.fromJson(json['method']),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'],
      midnightMode: json['midnightMode'],
      school: json['school'],
      offset: Offset.fromJson(json['offset']),
    );
  }
}

class Method {
  final int id;
  final String name;
  final Params params;
  final Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      id: json['id'],
      name: json['name'],
      params: Params.fromJson(json['params']),
      location: Location.fromJson(json['location']),
    );
  }
}

class Params {
  final double fajr;
  final String isha;

  Params({
    required this.fajr,
    required this.isha,
  });

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      fajr: json['Fajr'].toDouble(),
      isha: json['Isha'],
    );
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}

class Offset {
  final int imsak;
  final int fajr;
  final int sunrise;
  final int dhuhr;
  final int asr;
  final int maghrib;
  final int sunset;
  final int isha;
  final int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) {
    return Offset(
      imsak: json['Imsak'],
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      sunset: json['Sunset'],
      isha: json['Isha'],
      midnight: json['Midnight'],
    );
  }
}
