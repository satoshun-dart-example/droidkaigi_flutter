import 'package:flutter/material.dart';
import 'package:confsched2020/model/session_info.dart';
import 'package:confsched2020/ext/context.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({
    Key key,
    @required this.sessionInfo,
    this.onSessionPressed,
  }) : super(key: key);

  final SessionInfo sessionInfo;

  final void Function(SessionInfo) onSessionPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed:
          onSessionPressed != null ? () => onSessionPressed(sessionInfo) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('${sessionInfo.session.startsAtString}'),
                ),
                Text('${sessionInfo.session.durationString}min')
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                sessionInfo.session.title.ja,
                textAlign: TextAlign.start,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
            ),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: NetworkImage(sessionInfo.speakerIcon()),
                    width: 32,
                    height: 32,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(sessionInfo.speakerName()),
                ),
              ],
            )
          ],
        ),
//        Text(
//          sessionInfo.session.title.by(context),
//          style: context.theme.textTheme.title,
//        ),
      ),
    );
  }
}
