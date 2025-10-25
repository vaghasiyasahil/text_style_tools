extension TextCaseExtensions on String? {
  String safe() => this == null ? '' : this!.trim();

  String toSentenceCase() {
    final s = safe();
    if (s.isEmpty) return '';
    final lower = s.toLowerCase();
    return lower[0].toUpperCase() + lower.substring(1);
  }

  String toTitleCase() {
    final s = safe();
    if (s.isEmpty) return '';
    final words = s.split(RegExp(r'\s+'));
    final result = words.map((w) {
      if (w.isEmpty) return '';
      final core = w.toLowerCase();
      return core[0].toUpperCase() + (core.length > 1 ? core.substring(1) : '');
    }).join(' ');
    return _normalizeSpaces(result);
  }

  String toUpperCaseExt() {
    return safe().toUpperCase();
  }

  String toLowerCaseExt() {
    return safe().toLowerCase();
  }

  String toCamelCase() {
    final s = safe();
    if (s.isEmpty) return '';
    final parts = s.split(RegExp(r'[\s_\-]+'));
    final first = parts.first.toLowerCase();
    final rest = parts.skip(1).map((p) {
      final lower = p.toLowerCase();
      return lower.isEmpty ? '' : (lower[0].toUpperCase() + lower.substring(1));
    }).join();
    return first + rest;
  }

  String toTitleCaseStrict() {
    final s = safe();
    if (s.isEmpty) return '';
    final words = s.split(RegExp(r'(\s+)'));
    final buffer = StringBuffer();
    for (final w in words) {
      if (w.trim().isEmpty) {
        buffer.write(w);
      } else {
        final core = w.replaceAll(RegExp(r'^[^A-Za-z0-9]+|[^A-Za-z0-9]+$'), '');
        final prefix = w.substring(0, w.indexOf(core));
        final suffix = w.substring(w.indexOf(core) + core.length);
        final coreTransformed = core.isEmpty ? '' : (core[0].toUpperCase() + core.substring(1).toLowerCase());
        buffer.write(prefix + coreTransformed + suffix);
      }
    }
    return _normalizeSpaces(buffer.toString());
  }

  String _normalizeSpaces(String input) {
    return input.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
