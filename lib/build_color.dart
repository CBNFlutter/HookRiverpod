import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_hook_riverpod/main.dart';

// final _colorProvider =
//     ChangeNotifierProvider<TestNotifier>((ref) => TestNotifier());

class BuildColor extends HookWidget {
  final colorProvider;
  BuildColor({this.colorProvider});
  @override
  Widget build(BuildContext context) {
    print('change color');
    final color = useProvider(colorProvider);
    return Container(
      width: 100,
      height: 100,
      color: color.isRed ? Colors.red : Colors.yellow,
    );
  }
}
