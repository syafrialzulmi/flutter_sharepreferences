import 'package:flutter/material.dart';
import 'package:flutter_sharepreferences/counter_shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _getDataCounter() async {
    _counter = await CounterSharedPreferences().getData();
    setState(() {});
  }

  void _decrementCounter() async {
    await CounterSharedPreferences().saveDate(--_counter);
    _getDataCounter();
  }

  void _incrementCounter() async {
    await CounterSharedPreferences().saveDate(++_counter);
    _getDataCounter();
  }

  void _clearCounter() async {
    await CounterSharedPreferences().removeData();
    _getDataCounter();
  }

  @override
  void initState() {
    super.initState();
    _getDataCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sharepreferences',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter example'),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrementCounter,
                  icon: const Icon(Icons.remove),
                  label: const Text('Remove'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: _clearCounter,
              icon: const Icon(Icons.delete_forever),
              label: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
