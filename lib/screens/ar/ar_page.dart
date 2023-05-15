import 'dart:io';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import '../../widgets/stylish_app_bar.dart';
import 'package:vector_math/vector_math_64.dart';

class ArPage extends StatefulWidget {
  const ArPage({Key? key}) : super(key: key);

  @override
  State<ArPage> createState() => ArPageState();
}

class ArPageState extends State<ArPage> {
  late ARKitController arkitController;
  late ArCoreController arCoreController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    arkitController.dispose();
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StylishAppBar(),
        body: SafeArea(
            child: getArWidget()));
  }

  Widget getArWidget(){
    if (Platform.isAndroid) {
      return ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,);
    } else if (Platform.isIOS) {
      return ARKitSceneView(onARKitViewCreated: onARKitViewCreated);
    } else {
      return Container();
    }
  }
  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }
  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addSphere(arCoreController);
    _addCylindre(arCoreController);
    _addCube(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244));
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 166, 34, 244),
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

}
