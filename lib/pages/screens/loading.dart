import 'dart:math' as math;

import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> with RestorationMixin {
  final RestorableDouble _continuousValue = RestorableDouble(25);
  final RestorableDouble _discreteValue = RestorableDouble(20);

  @override
  String get restorationId => 'slider_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_continuousValue, 'continuous_value');
    registerForRestoration(_discreteValue, 'discrete_value');
  }

  @override
  void dispose() {
    _continuousValue.dispose();
    _discreteValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 64,
                  height: 48,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      final newValue = double.tryParse(value);
                      if (newValue != null &&
                          newValue != _continuousValue.value) {
                        setState(() {
                          _continuousValue.value =
                              newValue.clamp(0, 100) as double;
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(
                      text: _continuousValue.value.toStringAsFixed(0),
                    ),
                  ),
                ),
                Slider(
                  value: _continuousValue.value,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _continuousValue.value = value;
                    });
                  },
                ),
                // Disabled slider
                Slider(
                  value: _continuousValue.value,
                  min: 0,
                  max: 100,
                  onChanged: null,
                ),
                Text('Continuous Slider'),
              ],
            ),
            const SizedBox(height: 80),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: _discreteValue.value,
                  min: 0,
                  max: 200,
                  divisions: 5,
                  label: _discreteValue.value.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _discreteValue.value = value;
                    });
                  },
                ),
                // Disabled slider
                Slider(
                  value: _discreteValue.value,
                  min: 0,
                  max: 200,
                  divisions: 5,
                  label: _discreteValue.value.round().toString(),
                  onChanged: null,
                ),
                Text('Discrete Slider'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
