mixin StringifyMixin {
  List<Object> get stringers;

  @override
  String toString() {
    return '$runtimeType(${stringers.map((prop) => prop.toString()).join(', ')})';
    // return toStringPretty(this, stringers);
  }
}

String toStringPretty(Object object, [List<Object>? values]) {
  if (object is Iterable) return _toPrettyIterable(object);
  if (object is Map) return _toPrettyMap(object);
  if (object is Set) return _toPrettySet(object);

  final buf = StringBuffer();

  if (object is String) {
    if (object.isEmpty) {
      buf.writeln('{');
    } else {
      buf.writeln('$object {');
    }
  } else {
    buf.writeln('${object.runtimeType} {');
  }
  values?.forEach((value) {
    buf.writeAll(_shiftLine(value));
  });
  buf.write('},');

  return buf.toString();
}

Iterable<String> _shiftLine(Object obj) sync* {
  String str;
  if (obj is Iterable) {
    str = _toPrettyIterable(obj);
  } else if (obj is Map) {
    str = _toPrettyMap(obj);
  } else if (obj is Set) {
    str = _toPrettySet(obj);
  } else {
    str = obj.toString();
  }

  for (final item in str.split('\n')) {
    if (item.endsWith('{') || item.endsWith('[')) {
      yield '    $item\n';
    } else {
      yield '    ${item.replaceFirst(',', '')},\n';
    }
  }
}

String _toPrettyIterable(Iterable<dynamic> iterable) {
  if (iterable.isEmpty) return '[]';

  final buf = StringBuffer();
  buf.writeln('[');
  for (final item in iterable) {
    if (item is Iterable) {
      buf.writeAll(_shiftLine(_toPrettyIterable(item)));
    } else if (item is Map) {
      buf.writeAll(_shiftLine(_toPrettyMap(item)));
    } else if (item is Set) {
      buf.writeAll(_shiftLine(_toPrettySet(item)));
    } else {
      buf.writeAll(_shiftLine(item.toString()));
    }
  }
  buf.write('],');
  return buf.toString();
}

String _toPrettySet(Set<dynamic> iterable) {
  if (iterable.isEmpty) return '{}';

  final buf = StringBuffer();
  buf.writeln('{');
  for (final item in iterable) {
    if (item is Iterable) {
      buf.writeAll(_shiftLine(_toPrettyIterable(item)));
    } else if (item is Map) {
      buf.writeAll(_shiftLine(_toPrettyMap(item)));
    } else if (item is Set) {
      buf.writeAll(_shiftLine(_toPrettySet(item)));
    } else {
      buf.writeAll(_shiftLine(item.toString()));
    }
  }
  buf.write('},');
  return buf.toString();
}

String _toPrettyMap(Map<dynamic, dynamic> map) {
  if (map.isEmpty) return '{}';

  final buf = StringBuffer();
  buf.writeln('{');
  map.forEach((key, value) {
    var str = '$key: ';
    if (value is Iterable) {
      str += _toPrettyIterable(value);
    } else if (value is Map) {
      str += _toPrettyMap(value);
    } else if (value is Set) {
      buf.writeAll(_shiftLine(_toPrettySet(value)));
    } else {
      str += value.toString();
    }
    buf.writeAll(_shiftLine(str));
  });
  buf.write('},');
  return buf.toString();
}
