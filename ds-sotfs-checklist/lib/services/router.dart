import 'package:ds_soft_checklist/pages/playthrough/playthrough_cubit.dart';
import 'package:ds_soft_checklist/pages/task/task.dart';
import 'package:ds_soft_checklist/pages/task/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/app/app.dart';
import '../pages/playthrough/playthrough.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => InitialPage(),
        );
      case '/playthrough':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PlaythroughCubit(ChecklistPages.playthrough),
            child: PlaythroughChecklist(),
          ),
        );
      case '/achievement':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PlaythroughCubit(ChecklistPages.achievement),
            child: PlaythroughChecklist(),
          ),
        );
      case '/task':
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TaskCubit(args['name'], args['page']),
            child: DisplayTasks(checklistName: args['name']),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
