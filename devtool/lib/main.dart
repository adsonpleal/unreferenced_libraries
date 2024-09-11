import 'package:devtools_app_shared/service.dart';
import 'package:devtools_app_shared/ui.dart';
import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SomePkgDevToolsExtension());
}

class SomePkgDevToolsExtension extends StatelessWidget {
  const SomePkgDevToolsExtension({super.key});

  @override
  Widget build(BuildContext context) {
    return const DevToolsExtension(
      child: _Content(), // Build your extension here
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  String? value;
  bool loading = false;

  Future<void> performEval() async {
    setState(() {
      loading = true;
    });
    await serviceManager.onServiceAvailable;
    final eval = EvalOnDartLibrary(
      'package:fake_library/src/devtools_extension.dart',
      serviceManager.service!,
      serviceManager: serviceManager,
    );
    final isAlive = Disposable();
    final instance = await eval.evalInstance(
      'DevtoolsExtension().doSomething()',
      isAlive: isAlive,
    );
    setState(() {
      value = instance.valueAsString;
      loading = false;
    });
  }

  @override
  void initState() {
    performEval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading
          ? const CircularProgressIndicator()
          : Text(
              value ?? '',
            ),
    );
  }
}
