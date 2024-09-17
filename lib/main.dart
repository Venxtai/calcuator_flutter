import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _expression = '';

  void _onButtonClick(String value) {
    setState(() {
      if (value == 'AC') {
        _display = '0';
        _expression = '';
      } else if (value == '=') {
        try {
          String finalExpression =
              _expression.replaceAll('x', '*').replaceAll('÷', '/');
          Expression exp = Expression.parse(finalExpression);
          const evaluator = ExpressionEvaluator();
          var result = evaluator.eval(exp, {});
          _display = result.toString();
          _expression = result.toString();
        } catch (e) {
          _display = 'Error';
        }
      } else {
        if (_display == '0' && value != '.') {
          _display = value;
          _expression = value;
        } else {
          _display += value;
          _expression += value;
        }
      }
    });
  }

  Widget _buildButton({
    required String label,
    required Color color,
    required Color textColor,
    required double width,
    required double height,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => _onButtonClick(label),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: color,
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 28, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWeb = constraints.maxWidth > 600; // Check for larger screens
        final double buttonSize = isWeb ? 80 : (constraints.maxWidth / 4 - 16);
        final double textSize = isWeb ? 50 : 80; // Adjust text size for larger screens

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text(
              "Venthai's Calculator App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: SingleChildScrollView( // Make the layout scrollable on overflow
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _display,
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton(
                          label: 'AC',
                          color: Colors.white,
                          textColor: Colors.black,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '+/-',
                          color: Colors.white,
                          textColor: Colors.black,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '%',
                          color: Colors.white,
                          textColor: Colors.black,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '÷',
                          color: Colors.pink[200]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton(
                          label: '7',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '8',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '9',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: 'x',
                          color: Colors.pink[200]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton(
                          label: '4',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '5',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '6',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '-',
                          color: Colors.pink[200]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton(
                          label: '1',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '2',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '3',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '+',
                          color: Colors.pink[200]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: buttonSize * 2 + 8,
                          height: buttonSize,
                          child: ElevatedButton(
                            onPressed: () => _onButtonClick('0'),
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.grey[850],
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 20),
                            ),
                            child: const Text(
                              '0',
                              style: TextStyle(fontSize: 28, color: Colors.white),
                            ),
                          ),
                        ),
                        _buildButton(
                          label: '.',
                          color: Colors.grey[850]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                        _buildButton(
                          label: '=',
                          color: Colors.pink[200]!,
                          textColor: Colors.white,
                          width: buttonSize,
                          height: buttonSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
