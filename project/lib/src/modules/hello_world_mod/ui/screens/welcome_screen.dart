import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../features/fetch_hello_world/states_holder/hello_world_bloc/hello_world_bloc.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late String _hello;

  @override
  void initState() {
    _hello = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HelloWorldBloc, HelloWorldState>(
        builder: (context, helloWorldBuilderState) {
          if (helloWorldBuilderState is HelloWorldReceiveSuccess) {
            _hello = helloWorldBuilderState.greetTheWorld;
          }
          return Center(
            child: _hello.isEmpty
                ? Container()
                : Text(
                    Translator.of(context)!.translate(_hello),
                    style: TextStyle(
                      fontSize: 20.0.sp,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
