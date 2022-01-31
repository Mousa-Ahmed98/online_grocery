import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:online_grocery/main.dart';

void main(){
  testWidgets('TextFieldWidgetTest', (WidgetTester tester) async{
    //this function is for loading the widget that we want to test
    await tester.pumpWidget(const MyApp());
    var textField = find.byType(TextField);
    expect(textField, findsNWidgets(8));

    //in order waiting for one frame use
    //tester.pump();
  });
}