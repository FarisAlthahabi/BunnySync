import 'package:tuple/tuple.dart';

typedef ByPredicate<T> = dynamic Function(T it);

extension ListX<T> on List<T> {
  List<T> distinctBy(ByPredicate<T> by) {
    final keys = <dynamic>{};
    return where((item) {
      final dynamic key = by(item);
      if (!keys.contains(key)) {
        keys.add(key);
        return true;
      } else {
        return false;
      }
    }).toList();
  }

  List<T> safeSublist(int start, [int? end]) {
    // ignore: parameter_assignments
    start = start.clamp(0, length);

    if (end != null) {
      end = end.clamp(0, length);
    }

    return sublist(start, end);
  }

  int replaceWhere(bool Function(T) test, T Function(T) replacement) {
    final index = indexWhere(test);
    if (index >= 0) {
      this[index] = replacement(this[index]);
    }
    return index;
  }

  List<E> deleteWhereNull<E>() {
    if (this is List<E?>) {
      return whereType<E>().toList();
    }

    throw Exception('List is not nullable');
  }

  List<T> get duplicates {
    final duplicates = <T>[];
    final unique = <T>{};

    for (final item in this) {
      if (!unique.add(item)) {
        duplicates.add(item);
      }
    }

    return duplicates;
  }

  Tuple2<List<T>, List<T>> duplicatesAndUnique() {
    final duplicates = <T>[];
    final unique = <T>{};

    for (final item in this) {
      if (!unique.add(item)) {
        duplicates.add(item);
      }
    }

    return Tuple2(duplicates, unique.toList());
  }

  List<T> get duplicatesOrUnique {
    final duplicates = <T>[];
    final unique = <T>{};

    for (final item in this) {
      if (!unique.add(item)) {
        duplicates.add(item);
      }
    }

    return duplicates.isNotEmpty ? duplicates : unique.toList();
  }
}
