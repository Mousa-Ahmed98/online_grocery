import 'package:flutter_test/flutter_test.dart';
import 'package:online_grocery/screens/account_secreen.dart';

void main(){
  test('String should be reversed', (){
      expect(reverse('mousa'), 'asuom');
      expect(reverse('ali'), 'ila');
      expect(reverse('nader'), 'redan');
      expect(reverse('modajdas'), 'sadjadom');
      expect(reverse('hiwfhewfwffw'), 'wffwfwehfwih');
    String init = 'hello';
    String reversed = reverse(init);
    expect(reversed, 'olleh');
  });
}