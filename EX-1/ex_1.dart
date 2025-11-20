import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Custom buttons"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectButton(),
          SelectButton(),
          SelectButton(),
          SelectButton(),
        ],
      ),
    ),
  ),
));

class SelectButton extends StatefulWidget {
  const SelectButton({
    super.key,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;
  String get buttonLabel => isSelected ? 'Selected' : 'Not Selected';
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  Color get textColor => isSelected ? Colors.white : Colors.black;

  void onSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: textColor),
            onPressed: onSelect,
            child: Center(
              child: Text(buttonLabel),
            )),
        );
  }
}
