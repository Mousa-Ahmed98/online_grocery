import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String value;
  final Widget child;
  bool isF;
  Badge({Key? key, required this.value, required this.child, this.isF = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: isF? 9 : 0,
          top: isF? 6 : 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).accentColor)  ,
            constraints:  BoxConstraints(
              minHeight: isF? 16 : 12,
              minWidth: isF? 16 : 12,
            ),
            child: (Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            )),
          ),
        )
      ],
    );
  }
}
