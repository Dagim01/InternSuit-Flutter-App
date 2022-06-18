import 'package:equatable/equatable.dart';

import '../../domain/applicationform.dart';


abstract class MessageState extends Equatable {
  MessageState();
  
  @override
   List<Object> get props => [];
}

class AppLoading extends MessageState {}

class AppOperationSuccess extends MessageState {
 
  AppOperationSuccess();
  @override
  List<Object> get props => [];
}

class AppOperationFailure extends MessageState {
  final Object error;
  AppOperationFailure(this.error);
  @override
  List<Object> get props => [error];

}
class GetByComoanynameFetchSuccess extends MessageState {
  final List<Application> apps;
  GetByComoanynameFetchSuccess([this.apps = const []]);
  @override
  List<Object> get props => [apps];
}
class MessagegetfromScreenSucccess extends MessageState {
  final Application app;

  MessagegetfromScreenSucccess(this.app);
  @override
  List<Object> get props => [app];
}

class MessageEvaluationSucccess extends MessageState {
  final Application app;

  MessageEvaluationSucccess(this.app);
  @override
  List<Object> get props => [app];
}
class AppFetchByUserIdSuccess extends MessageState{
  
final List<Application> apps;
AppFetchByUserIdSuccess(this.apps);
 @override
  List<Object> get props => [apps];
}



