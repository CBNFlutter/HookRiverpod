import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:using_hook_riverpod/build_color.dart';
import 'package:using_hook_riverpod/test_notifier.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

final _labelProvider =
    ChangeNotifierProvider<TestNotifier>((ref) => TestNotifier());
final _colorProvider =
    ChangeNotifierProvider<TestNotifier>((ref) => TestNotifier());

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hook riverpod'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildColor(colorProvider: _colorProvider),
            LabelNumber(),
            _buildButton(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(_labelProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LabelNumber extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // print('labelNumber');
    final count = useProvider(_labelProvider);
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Text(
          '${count.num}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

// class Color extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     // print('change color');
//     final color = useProvider(_colorProvider);
//     return Container(
//       width: 100,
//       height: 100,
//       color: color.isRed ? Colors.red : Colors.yellow,
//     );
//   }
// }

_buildButton(BuildContext context) {
  return MaterialButton(
    onPressed: () {
      context.read(_colorProvider.notifier).changeColor();
    },
    child: Text('Change Color'),
    color: Colors.blue,
  );
}
