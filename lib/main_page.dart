import 'package:calculator_app/math_operation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Expanded(
            child: TextHolder(appState: appState),
          ),
          const KetPad(),
        ],
      ),
    );
  }
}

class TextHolder extends StatelessWidget {
  const TextHolder({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Text(
            appState.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 85,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class KetPad extends StatefulWidget {
  const KetPad({
    super.key,
  });

  @override
  State<KetPad> createState() => _KetPadState();
}

class _KetPadState extends State<KetPad> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    const textStyle = TextStyle(fontSize: 33, fontWeight: FontWeight.w400);
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Btn(
                  sign: 'AC',
                  icon: Text(
                      (appState.last != '' || appState.sign != '') ? 'C' : 'AC',
                      style:
                          const TextStyle(fontSize: 30, color: Colors.black)),
                  color: CupertinoColors.lightBackgroundGray),
              const Btn(
                  sign: '!',
                  icon: Icon(CupertinoIcons.plus_slash_minus,
                      size: 40, color: Colors.black),
                  color: CupertinoColors.lightBackgroundGray),
              const Btn(
                  sign: '%',
                  icon: Icon(CupertinoIcons.percent,
                      size: 40, color: Colors.black),
                  color: CupertinoColors.lightBackgroundGray),
              Btn(
                  sign: '÷',
                  icon: Icon(CupertinoIcons.divide,
                      size: 40,
                      color: (appState.sign == '÷' && appState.last == '')
                          ? CupertinoColors.systemOrange
                          : Colors.white),
                  color: (appState.sign == '÷' && appState.last == '')
                      ? Colors.white
                      : CupertinoColors.systemOrange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Btn(
                  sign: '1',
                  icon: Text('1', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              const Btn(
                  sign: '2',
                  icon: Text('2', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              const Btn(
                  sign: '3',
                  icon: Text('3', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              Btn(
                  sign: '×',
                  icon: Icon(CupertinoIcons.multiply,
                      size: 40,
                      color: (appState.sign == '×' && appState.last == '')
                          ? CupertinoColors.systemOrange
                          : Colors.white),
                  color: (appState.sign == '×' && appState.last == '')
                      ? Colors.white
                      : CupertinoColors.systemOrange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Btn(
                  sign: '4',
                  icon: Text('4', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              const Btn(
                  sign: '5',
                  icon: Text('5', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              const Btn(
                  sign: '6',
                  icon: Text('6', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              Btn(
                  sign: '-',
                  icon: Icon(CupertinoIcons.minus,
                      size: 40,
                      color: (appState.sign == '-' && appState.last == '')
                          ? CupertinoColors.systemOrange
                          : Colors.white),
                  color: (appState.sign == '-' && appState.last == '')
                      ? Colors.white
                      : CupertinoColors.systemOrange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Btn(
                  sign: '7',
                  icon: Text('7', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              const Btn(
                  sign: '8',
                  icon: Text('8', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              const Btn(
                  sign: '9',
                  icon: Text('9', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              Btn(
                  sign: '+',
                  icon: Icon(CupertinoIcons.add,
                      size: 40,
                      color: (appState.sign == '+' && appState.last == '')
                          ? CupertinoColors.systemOrange
                          : Colors.white),
                  color: (appState.sign == '+' && appState.last == '')
                      ? Colors.white
                      : CupertinoColors.systemOrange),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: BigBtn(
                  icon: Text('0',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left),
                ),
              ),
              Btn(
                  sign: '.',
                  icon: Text('.', style: textStyle),
                  color: CupertinoColors.darkBackgroundGray),
              Btn(
                  sign: '=',
                  icon: Icon(CupertinoIcons.equal, size: 40),
                  color: CupertinoColors.systemOrange),
            ],
          ),
        ],
      ),
    );
  }
}

class BigBtn extends StatelessWidget {
  const BigBtn({super.key, required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Container(
      height: 88,
      margin: const EdgeInsets.only(left: 12, right: 12),
      child: ElevatedButton(
        onPressed: () {
          appState.addText('0');
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 30),
          backgroundColor: CupertinoColors.darkBackgroundGray,
        ),
        child: icon,
      ),
    );
  }
}

class Btn extends StatelessWidget {
  const Btn(
      {super.key, required this.sign, required this.icon, required this.color}
  );
  final String sign;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var myColor = color;
    return Expanded(
      flex: 1,
      child: Container(
        height: 88,
        width: 88,
        margin: const EdgeInsets.only(top: 5, bottom: 5, left: 3, right: 3),
        child: ElevatedButton(
          onPressed: () {
            appState.addText(sign);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: myColor,
          ),
          child: icon,
        ),
      ),
    );
  }
}
