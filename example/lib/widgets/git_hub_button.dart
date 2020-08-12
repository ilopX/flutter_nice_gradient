import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;


class GitHubButton extends StatelessWidget {
  final String sourceCodeUrl;

  const GitHubButton({
    Key key,
    @required this.sourceCodeUrl,
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
              onTap: () async {
                if (kIsWeb) {
                  html.document.window.location.href = sourceCodeUrl;
                } else {
                  var shell = Shell();
                  await shell.run('start $sourceCodeUrl');
                }
              },
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
