import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate = DateTime.now();
  String? _userId;
  Timer? _authTimer;
  String b = '';

  bool get isAuth {

    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return null;
  }

  String? get userId {
    return _userId;
  }

  Future<void> _authonticate(String email, String password, String urlSegment) async {
    print('authonticate called');
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:'
        '$urlSegment?key=AIzaSyAfZmqruQ9YP5zVdGCkwZTvqjsgRayuV4E';

    try {
      final res = await http.post(Uri.parse(url), body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }));

      final responseData = json.decode(res.body) as Map<String, dynamic>;
      print('respnse data $responseData');
      print('respnse data ${responseData['idToken']}');
      // if(responseData['error'] != null){
      //   throw HttpException(responseData['error']['message']);
      // }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      String _userData = json.encode({
        'token': _token!,
        'userId': _userId!,
        'expiryDate': _expiryDate!.toIso8601String(),
      });
      prefs.setString('userData', _userData);
      print('setted');
      if(prefs.containsKey('userData')) {
        print('yesy yes yes');
        final extractedData = json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
        print('tiken ${extractedData['token']}');
        print('uID ${extractedData['userId']}');
      }
      else print('no no no');

    }
    catch (e){
      print('eoko $e');
    }



  }

  Future<void> signUp(String email, String password)async {
    print('signup called');
    await _authonticate(email, password, 'signUp');

  }

  Future<void> login(String email, String password) async{
    print('login called');
    await _authonticate(email, password, 'signInWithPassword');

  }

  void _autoLogout(){
    if(_authTimer != null){
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> logout() async{
    print('log out is called');
    _token = '';
    _userId = '';
    _expiryDate = null;

    if(_authTimer != null){
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();

  }
  Future<bool> tryAutoLogin() async{
    print('tryAutoLogin called');
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')) return false;
    final extractedData = json.decode(prefs.getString('userData')!) as Map<String, dynamic>;

    final expiryDate = DateTime.parse(extractedData['expiryDate'].toString());
    if(expiryDate.isBefore(DateTime.now())) return false;

    _token = extractedData['token'].toString();
    _userId = extractedData['userId'].toString();
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

}
