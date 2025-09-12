import 'dart:convert';
import 'dart:io';

class FixtureReader {
  FixtureReader._();

  static String getJsonData(String path) =>
      File('testing/$path').readAsStringSync();

  static T getData<T>(String path) =>
      jsonDecode(File('testing/$path').readAsStringSync()) as T;
}
