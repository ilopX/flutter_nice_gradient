import 'package:flutter/material.dart';

class ConsumeValueNotifier<C> extends StatefulWidget {
  final ValueNotifier<C> valueNotifier;
  final Widget Function(BuildContext context, ValueNotifier<C>  valueNotifier) builder;

  const ConsumeValueNotifier({
    Key key,
    @required this.valueNotifier,
    @required this.builder,
  }) : super(key: key);

  @override
  _ConsumeValueNotifierState createState() => _ConsumeValueNotifierState();
}

class _ConsumeValueNotifierState<C> extends State<ConsumeValueNotifier<C>> {
  @override
  void initState() {
//    print('init');
    widget.valueNotifier.addListener(_update);
    super.initState();
  }

  @override
  void dispose() {
    //print('dispose');
//    widget.valueNotifier.removeListener(_update);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    //print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ConsumeValueNotifier oldWidget) {
//    print('didUpdateWidget');
    oldWidget.valueNotifier.removeListener(_update);
    widget.valueNotifier.addListener(_update);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    widget.valueNotifier.removeListener(_update);
    super.deactivate();
  }

  _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.valueNotifier);
  }
}


