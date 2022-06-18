import 'package:equatable/equatable.dart';

import '../../domain/applicationform.dart';


abstract class MessageEvent extends Equatable {

  const MessageEvent();
   @override
  List<Object> get props => [];
}
class FetchBycompanyName extends MessageEvent {
  final String companyName;


  const FetchBycompanyName(this.companyName);

  @override
  List<Object>  get props => [];

  @override
  String toString() => 'user accessed: $companyName';
}
class FetchByUserid extends MessageEvent {
  final String id;
  const FetchByUserid(this.id);
  @override
  List<Object>  get props => [id];
  @override
  String toString() => 'user accessed: $id';
}

class AppCreate extends MessageEvent {

  final String id;
  final String cgpa;
  final String description;
  final String Subject;
  final String company_name;

  const AppCreate(this.id,this.cgpa,this.description,this.Subject,this.company_name);

  @override
 List<Object>  get props => [];

  


}
class AppDelete extends MessageEvent {
  final String subject;
  const AppDelete(this.subject);

  @override
  List<Object> get props => [subject];

  @override
  toString() => 'user Deleted {course Id: $subject}';

  @override
  bool? get stringify => true;
}
class MessageGetfromScreen extends MessageEvent {
  final Application app;
  const MessageGetfromScreen(this.app);

  @override
  List<Object> get props => [app];
}

class AppEvaluation extends MessageEvent {
  final String subject;
  final String seen;

 const AppEvaluation(this.subject,this.seen);
  @override
  List<Object> get props => [];
}