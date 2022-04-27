import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_short_music/common/di/get_it.dart';
import 'package:flutter_short_music/common/simple_bloc_observer.dart';
import 'package:flutter_short_music/presentation/widgets/app_widget.dart';

void main() {
  unawaited(initiateGetIt());

  BlocOverrides.runZoned(
          () => runApp(const AppWidget()),
    blocObserver: SimpleBlocObserver(),
  );
}
