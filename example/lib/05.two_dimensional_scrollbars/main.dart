import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/ir-black.dart' show irBlackTheme;
import 'package:highlight/languages/dart.dart';

void main() {
  runApp(const CodeEditor());
}

const monospace = TextStyle(fontFamily: 'monospace', fontSize: 14, height: 1.2);

class CodeEditor extends StatefulWidget {
  const CodeEditor({super.key});

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  final codeController = CodeController(language: dart);
  final vScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        scrollbarTheme: Theme.of(context).scrollbarTheme.copyWith(
              radius: const Radius.circular(2),
              thumbVisibility: const WidgetStatePropertyAll(true),
              trackVisibility: const WidgetStatePropertyAll(true),
              thumbColor: WidgetStateProperty.all(Colors.grey),
            ),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          controller: vScrollController,
          child: CodeTheme(
            data: CodeThemeData(styles: irBlackTheme),
            child: CodeField(
              gutterStyle: const GutterStyle(
                showFoldingHandles: false,
                textStyle: monospace,
              ),
              textStyle: monospace,
              controller: codeController,
              enableHorizontalScrollBar: true,
            ),
          ),
        ),
      ),
    );
  }
}
