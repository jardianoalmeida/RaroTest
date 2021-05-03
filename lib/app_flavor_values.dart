import 'package:flutter/foundation.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:injectable/injectable.dart';

class AppFlavorValues implements FlavorValues {
  const AppFlavorValues({
    required this.baseUrl,
    required this.anotherUrl,
    required this.apiVersion,
    required this.socketUrl,
    required Map<String, bool> Function() features,
  }) : _features = features;

  final String baseUrl;
  final String anotherUrl;
  final String apiVersion;
  final String socketUrl;
  final Map<String, bool> Function() _features;
  Map<String, bool> get features => _features();
//Add other flavor specific values, e.g database name
}

const qa = Environment('qa');
