import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../../Application/app/blocs/app_bloc.dart';
import '../../../Application/message/blocs/app_bloc.dart';
import '../../../infrastructure/storage/localstorage.dart';
import '../../app/app_event.dart';
import '../../message/app_state.dart';


class ApplicationEvaluation extends StatefulWidget {
  const ApplicationEvaluation({Key? key}) : super(key: key);

  @override
  State<ApplicationEvaluation> createState() => _ApplicationEvaluationState();
}

class _ApplicationEvaluationState extends State<ApplicationEvaluation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Application Evaluation"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: BlocConsumer<MessageBloc, MessageState>(listener: (context, state) {
          print(state);

          // if (state is MessageEvaluationSucccess) {
          //   AwesomeDialog(
          //     context: context,
          //     dialogType: DialogType.SUCCES,
          //     animType: AnimType.TOPSLIDE,
          //     title: 'Success',
          //     desc: 'message was sent to applicant',
          //     btnOkOnPress: () {
          //       context.go('/CompanyNavigation');
          //     },
          //   ).show();
          // }
        }, builder: (_, state) {
          if (state is MessagegetfromScreenSucccess) {
            return Card(
                color: Colors.amber[100],
                margin: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Column(
                    children: [
                      
                
                        
                          Column(
                            children: [
                            Text(
                              " Name       :${state.app.user.fullName}",
                              style: const TextStyle(
                                  fontSize: 20),
                            ),
                            Text(
                              "Address      :${state.app.user.address}",
                              style: const TextStyle(
                                  fontSize: 20),
                            ),
                             Text(
                              "        Department      :${state.app.user.department}",
                              style: const TextStyle(
                                  fontSize: 20),
                            ),
                             Text(
                              "   University      :${state.app.user.university}",
                              style: const TextStyle(
                                  fontSize: 20),
                            ),
                            Text(
                              " Cgpa      :${state.app.cgpa}",

                              style: const TextStyle(
                                  fontSize: 20),
                            ),
                             Text(
                              "     Description      :${state.app.description}",
                              
                              style: const TextStyle(
                                  fontSize: 20),
                            ),
                          ]),
                        
                      
                      // const Divider(
                      //     indent: 5,
                      //     endIndent: 5,
                      //     thickness: 0.5,
                      //     color: Colors.black),
                     
                      ButtonBar(
                        children: [
                          OutlinedButton(
                            child: const Text('Accept'),
                            onPressed: () async {
                              String acc = "Accepted";
                              String? id = await TokenStorage.getCompany();
                              BlocProvider.of<AppBloc>(context)
                                  .add(AppEvaluation(state.app.Subject, acc));

                                  AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.TOPSLIDE,
              title: 'Success',
              desc: 'Acceptance message was sent to applicant',
              btnOkOnPress: () {
                
              },
            ).show();
                            },
                          ),
                          OutlinedButton(
                            child: const Text('Reject'),
                            onPressed: () async {
                              String rej = "Rejected";
                              BlocProvider.of<AppBloc>(context)
                                  .add(AppEvaluation(state.app.Subject, rej));
                                  AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.TOPSLIDE,
              title: 'Success',
              desc: 'Rejection message was sent to applicant',
              btnOkOnPress: () {
                
              },
            ).show();


                            },
                          )
                        ],
                      )
                    ],
                  ),
                ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
