import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  static const String _itemsKey = 'Aufgabe';

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<List<String>> getItems() async {
    final prefs = await _prefs;
    final List<String>? items = prefs.getStringList(_itemsKey);
    return items ?? [];
  }

  @override
  Future<void> addItem(String item) async {
    final prefs = await _prefs;
    List<String> items = prefs.getStringList(_itemsKey) ?? [];
    items.add(item);
    await prefs.setStringList(_itemsKey, items);
  }

  @override
  Future<void> editItem(int index, String newItem) async {
    final prefs = await _prefs;
    List<String> items = prefs.getStringList(_itemsKey) ?? [];
    if (index >= 0 && index < items.length) {
      items[index] = newItem;
      await prefs.setStringList(_itemsKey, items);
    }
  }

  @override
  Future<void> deleteItem(int index) async {
    final prefs = await _prefs;
    List<String> items = prefs.getStringList(_itemsKey) ?? [];
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      await prefs.setStringList(_itemsKey, items);
    }
  }

  @override
  Future<int> get itemCount async {
    final prefs = await _prefs;
    final List<String>? items = prefs.getStringList(_itemsKey);
    return items?.length ?? 0;
  }
}
