import 'package:flutter/material.dart';

class GitHubButton extends StatelessWidget {
  final void Function() onPressed;

  const GitHubButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: 85,
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0x63ffffff),
                  border: Border.all(width: 1.0, color: const Color(0x63000000)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 77,
                      height: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/GitHub_Logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -5),
                      child: Text(
                        'Source Code',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 12,
                          color: const Color(0xff000000),
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
