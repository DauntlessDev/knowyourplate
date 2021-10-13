import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';

void main() {
  testWidgets('On pressed callback', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: RoundedButton(
          text: 'tap me',
          onPressed: () => pressed = true,
          color: Colors.blue,
        ),
      ),
    );
    final button = find.byType(MaterialButton);
    expect(button, findsOneWidget);
    expect(find.text('tap me'), findsOneWidget);

    await tester.tap(button);
    expect(pressed, true);
  });
}
