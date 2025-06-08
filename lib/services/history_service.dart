import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/conversion_history.dart';
import '../models/platform_fee.dart';

class HistoryService {
  static const String _historyKey = 'conversion_history';
  final SharedPreferences _prefs;
  final _uuid = const Uuid();

  HistoryService(this._prefs);

  Future<List<ConversionHistory>> getHistory() async {
    final historyJson = _prefs.getStringList(_historyKey) ?? [];
    return historyJson
        .map((json) => ConversionHistory.fromJson(jsonDecode(json)))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<void> addToHistory(ConversionResult result) async {
    final history = await getHistory();
    final newEntry = ConversionHistory(
      id: _uuid.v4(),
      result: result,
      timestamp: DateTime.now(),
    );
    history.insert(0, newEntry);
    await _saveHistory(history);
  }

  Future<void> toggleFavorite(String id) async {
    final history = await getHistory();
    final index = history.indexWhere((entry) => entry.id == id);
    if (index != -1) {
      final entry = history[index];
      history[index] = entry.copyWith(isFavorite: !entry.isFavorite);
      await _saveHistory(history);
    }
  }

  Future<void> deleteFromHistory(String id) async {
    final history = await getHistory();
    history.removeWhere((entry) => entry.id == id);
    await _saveHistory(history);
  }

  Future<void> clearHistory() async {
    await _prefs.remove(_historyKey);
  }

  Future<void> _saveHistory(List<ConversionHistory> history) async {
    final historyJson = history
        .map((entry) => jsonEncode(entry.toJson()))
        .toList();
    await _prefs.setStringList(_historyKey, historyJson);
  }
} 