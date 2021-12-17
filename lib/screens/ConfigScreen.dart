

import 'dart:async';
import 'dart:collection';

import 'package:ergodox_configurator/screens/CommandBox.dart';
import 'package:flutter/material.dart';

import 'KeyBox.dart';
import 'KeyBoxButton.dart';

class ConfigScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConfigScreenState();

}


class _ConfigScreenState extends State<ConfigScreen> {
  final changeNotifier = StreamController.broadcast();
  HashMap<String, GlobalKey<KeyBoxButtonState>> keyMap = HashMap<String, GlobalKey<KeyBoxButtonState>>();
  late List<CommandBox> commandBoxes;
  var alphaList = ["A", "B", "C", "D", "E", "F"];
  var numList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"];

  _ConfigScreenState() {
    // 33 is ! (and beginning?)
    // 90 is Z
    // 96 is `
    var aCode = 33;
    var zCode = 96;
    commandBoxes = List<CommandBox>.generate(
      zCode - aCode + 1,
          (index) => CommandBox(String.fromCharCode(aCode + index), changeNotifier),
    );

    for (var alpha in alphaList) {
      for (var num in numList) {
        keyMap[alpha + num] = GlobalKey<KeyBoxButtonState>();
      }
    }
  }

  @override
  void dispose() {
    changeNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    const leftThumbClusterAngle = (20 * 3.1415) / 180;
    const rightThumbClusterAngle = (340 * 3.1415) / 180;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ErgoDox Wireless Configurator"),
        actions: [
          ElevatedButton(
              onPressed: () {
                String keyMapString = "";
                for (var alpha in alphaList) {
                  keyMapString += "\n\t";
                  for (var num in numList) {
                    String key = "";
                    if (keyMap[alpha + num] != null && keyMap[alpha + num]!.currentState != null) {
                      key = keyMap[alpha + num]!.currentState!.text;
                    }
                    keyMapString += key + "\t";
                  }
                }
                print(keyMapString);
              },
              child: const Text("Test button")
          )
        ],
      ),
      body: Container(
        padding:  const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    // Left Half
                    child: Card(
                        borderOnForeground: true,
                        // semanticContainer: true,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(20)),
                            Row(children: [const Padding(padding: EdgeInsets.all(20)), KeyBoxButton(keyMap["A1"]!, changeNotifier.stream, width: 1.5), KeyBoxButton(keyMap["A2"]!, changeNotifier.stream), KeyBoxButton(keyMap["A3"]!, changeNotifier.stream), KeyBoxButton(keyMap["A4"]!, changeNotifier.stream), KeyBoxButton(keyMap["A5"]!, changeNotifier.stream), KeyBoxButton(keyMap["A6"]!, changeNotifier.stream), KeyBoxButton(keyMap["A7"]!, changeNotifier.stream)]),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -12.5, 0.0),
                                child: Row(children: [const Padding(padding: EdgeInsets.all(20)), KeyBoxButton(keyMap["B1"]!, changeNotifier.stream, width: 1.5), KeyBoxButton(keyMap["B2"]!, changeNotifier.stream), KeyBoxButton(keyMap["B3"]!, changeNotifier.stream), KeyBoxButton(keyMap["B4"]!, changeNotifier.stream), KeyBoxButton(keyMap["B5"]!, changeNotifier.stream), KeyBoxButton(keyMap["B6"]!, changeNotifier.stream),
                                  Transform(child: KeyBoxButton(keyMap["B7"]!, changeNotifier.stream, height: 1.6,), alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, 14.5, 0.0))])),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -25.0, 0.0),
                                child: Row(children: [const Padding(padding: EdgeInsets.all(20)), KeyBoxButton(keyMap["C1"]!, changeNotifier.stream, width: 1.5), KeyBoxButton(keyMap["C2"]!, changeNotifier.stream), KeyBoxButton(keyMap["C3"]!, changeNotifier.stream), KeyBoxButton(keyMap["C4"]!, changeNotifier.stream), KeyBoxButton(keyMap["C5"]!, changeNotifier.stream), KeyBoxButton(keyMap["C6"]!, changeNotifier.stream)])),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -37.5, 0),
                                child: Row(children: [const Padding(padding: EdgeInsets.all(20)), KeyBoxButton(keyMap["D1"]!, changeNotifier.stream, width: 1.5), KeyBoxButton(keyMap["D2"]!, changeNotifier.stream), KeyBoxButton(keyMap["D3"]!, changeNotifier.stream), KeyBoxButton(keyMap["D4"]!, changeNotifier.stream), KeyBoxButton(keyMap["D5"]!, changeNotifier.stream), KeyBoxButton(keyMap["D6"]!, changeNotifier.stream),
                                  Transform(child: KeyBoxButton(keyMap["D7"]!, changeNotifier.stream, height: 1.6), alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -14.5, 0.0))])),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(1.0, -50.0, 0.0),
                                child: Row(children: [const Padding(padding: EdgeInsets.only(right: 64.5)), KeyBoxButton(keyMap["E1"]!, changeNotifier.stream), KeyBoxButton(keyMap["E2"]!, changeNotifier.stream), KeyBoxButton(keyMap["E3"]!, changeNotifier.stream), KeyBoxButton(keyMap["E4"]!, changeNotifier.stream), KeyBoxButton(keyMap["E5"]!, changeNotifier.stream)])),

                            // Thumb Cluster
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(250.0, 0.0, 0.0)..rotateZ(leftThumbClusterAngle), child: Row(children:
                              [
                                Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(163.0, -78.0, 0.0), child: Row(children: [KeyBoxButton(keyMap["F1"]!, changeNotifier.stream), KeyBoxButton(keyMap["F2"]!, changeNotifier.stream)])),
                                Row(children: [
                                  KeyBoxButton(keyMap["F3"]!, changeNotifier.stream, height: 2), KeyBoxButton(keyMap["F4"]!, changeNotifier.stream, height: 2),
                                  Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -25.0, 0.0), child: KeyBoxButton(keyMap["F5"]!, changeNotifier.stream)),
                                  Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(-54.0, 27.0, 0.0), child: KeyBoxButton(keyMap["F6"]!, changeNotifier.stream))
                                ])]
                            ))
                          ],
                        )
                    )
                ),
                Flexible(
                    // Right half
                    child: Card(
                        borderOnForeground: true,
                        // semanticContainer: true,
                        color: Colors.transparent,
                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          // Left Half
                          children: [
                            const Padding(padding: EdgeInsets.all(20)),
                            Row(mainAxisAlignment: MainAxisAlignment.end, children: [const Padding(padding: EdgeInsets.all(20)), KeyBoxButton(keyMap["A8"]!, changeNotifier.stream), KeyBoxButton(keyMap["A9"]!, changeNotifier.stream), KeyBoxButton(keyMap["A10"]!, changeNotifier.stream), KeyBoxButton(keyMap["A11"]!, changeNotifier.stream), KeyBoxButton(keyMap["A12"]!, changeNotifier.stream), KeyBoxButton(keyMap["A13"]!, changeNotifier.stream), KeyBoxButton(keyMap["A14"]!, changeNotifier.stream, width: 1.5)]),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -12.5, 0.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [const Padding(padding: EdgeInsets.all(20)), Transform(child: KeyBoxButton(keyMap["B8"]!, changeNotifier.stream, height: 1.6), alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, 14.5, 0.0)), KeyBoxButton(keyMap["B9"]!, changeNotifier.stream), KeyBoxButton(keyMap["B10"]!, changeNotifier.stream), KeyBoxButton(keyMap["B11"]!, changeNotifier.stream), KeyBoxButton(keyMap["B12"]!, changeNotifier.stream), KeyBoxButton(keyMap["B13"]!, changeNotifier.stream),
                                  KeyBoxButton(keyMap["B14"]!, changeNotifier.stream, width: 1.5)])),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -25.0, 0.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [const Padding(padding: EdgeInsets.all(20)), KeyBoxButton(keyMap["C8"]!, changeNotifier.stream), KeyBoxButton(keyMap["C9"]!, changeNotifier.stream), KeyBoxButton(keyMap["C10"]!, changeNotifier.stream), KeyBoxButton(keyMap["C11"]!, changeNotifier.stream), KeyBoxButton(keyMap["C12"]!, changeNotifier.stream), KeyBoxButton(keyMap["C13"]!, changeNotifier.stream, width: 1.5)])),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -37.5, 0.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [const Padding(padding: EdgeInsets.all(20)), Transform(child: KeyBoxButton(keyMap["D8"]!, changeNotifier.stream, height: 1.6), alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -14.5, 0.0)), KeyBoxButton(keyMap["D9"]!, changeNotifier.stream), KeyBoxButton(keyMap["D10"]!, changeNotifier.stream), KeyBoxButton(keyMap["D11"]!, changeNotifier.stream), KeyBoxButton(keyMap["D12"]!, changeNotifier.stream), KeyBoxButton(keyMap["D13"]!, changeNotifier.stream),
                                  KeyBoxButton(keyMap["D14"]!, changeNotifier.stream, width: 1.5)])),
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(1.0, -50, 0.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [const Padding(padding: EdgeInsets.only(right: 64.5)), KeyBoxButton(keyMap["E8"]!, changeNotifier.stream), KeyBoxButton(keyMap["E9"]!, changeNotifier.stream), KeyBoxButton(keyMap["E10"]!, changeNotifier.stream), KeyBoxButton(keyMap["E11"]!, changeNotifier.stream), KeyBoxButton(keyMap["E12"]!, changeNotifier.stream)])),

                            // Thumb Cluster
                            Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(100.0, -120.0, 0.0)..rotateZ(rightThumbClusterAngle), child: Row(children:
                            [
                              Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(108.0, -78.0, 0.0), child: Row(children: [KeyBoxButton(keyMap["F8"]!, changeNotifier.stream), KeyBoxButton(keyMap["F9"]!, changeNotifier.stream)])),
                              Row(children: [
                                Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(0.0, -25.0, 0.0), child: KeyBoxButton(keyMap["F12"]!, changeNotifier.stream)),
                                Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(-54.0, 27.0, 0.0), child: KeyBoxButton(keyMap["F13"]!, changeNotifier.stream)),
                                Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(-54.0, 0.0, 0.0), child: KeyBoxButton(keyMap["F10"]!, changeNotifier.stream, height: 2)),
                                Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..translate(-54.0, 0.0, 0.0), child: KeyBoxButton(keyMap["F11"]!, changeNotifier.stream, height: 2)),
                              ])]
                            ))
                          ],
                        )
                    )
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
                child: Card(
                  color: Colors.grey,
                  child: GridView.count(
                    padding: const EdgeInsets.all(25),
                    crossAxisCount: 4,
                    physics: const BouncingScrollPhysics(),
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    children: commandBoxes,
                  ),
                )
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

}