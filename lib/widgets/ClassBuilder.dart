import 'package:covid_app/screens/Detail.dart';
import 'package:covid_app/screens/HomePage.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Detail>(() => Detail());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
