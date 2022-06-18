import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../Application/app/blocs/app_bloc.dart';
import '../../../Application/auth/login_bloc.dart';
import '../../../Application/message/blocs/app_bloc.dart';
import '../../app/app_state.dart';
import '../../message/app_event.dart';


class Companymessage extends StatefulWidget {
  const Companymessage({Key? key}) : super(key: key);

  @override
  _CompanymessageState createState() => _CompanymessageState();
}

class _CompanymessageState extends State<Companymessage> {
  List<Application> characterList = <Application>[];



  @override
  void initState() {
    // getCompaniesfromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Message"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: BlocBuilder<AppBloc, AppState>(builder: (_, state) {
          print(state);
          if (state is GetByComoanynameFetchSuccess) {
            final AppList = state.apps;

            return GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Column(children: [
                  Flexible(
                      child: Container(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              itemCount: AppList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        const Divider(
                                            indent: 5,
                                            endIndent: 5,
                                            thickness: 0.5,
                                            color: Colors.black),
                                        Column(children: [
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            alignment: Alignment.centerLeft,
                                            child:
                                                const Text("user application"),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5.0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                "From : ${AppList.elementAt(index).user.userName}"),
                                          ),
                                          ButtonBar(
                                            children: [
                                              OutlinedButton(
                                                child: const Text('Detail'),
                                                onPressed: () {
                                                  BlocProvider.of<MessageBloc>(
                                                          context)
                                                      .add(MessageGetfromScreen(
                                                          AppList.elementAt(
                                                              index)));
                                                  context.go(
                                                      '/ApplicationEvaluation');
                                                },
                                              )
                                            ],
                                          )
                                        ]),
                                      ],
                                    ));
                              })))
                ]));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}

class Application {
}
