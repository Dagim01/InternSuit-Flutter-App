import 'package:equatable/equatable.dart';

import '../../domain/company.dart';



abstract class CompanyEvent extends Equatable {

  CompanyEvent();
   @override
  List<Object> get props => [];
}
class FetchBycompanyname extends CompanyEvent {
  final String companyName;


  FetchBycompanyname(this.companyName);

  @override
  List<Object>  get props => [companyName];

  @override
  String toString() => 'user accessed: $companyName';
}



class CompanyCreate extends CompanyEvent {
  final Company company;
  
   CompanyCreate(this.company);

  @override
 List<Object>  get props => [company];

  @override
  String toString() => 'user Created {course Id: ${company.companyname}';
}

class CompanyUpdate extends CompanyEvent {
  final String companyName;
  final Company company;

   CompanyUpdate(this.companyName, this.company);

  @override
  List<Object>  get props => [companyName,company];

  @override
  String toString() => 'user Updated {course Id: ${company.companyname}}';
}

class CompanyDelete extends CompanyEvent {
  final String userName;
  CompanyDelete(this.userName);

  @override
  List<Object> get props => [userName];

  @override
  toString() => 'user Deleted {course Id: $userName}';

  @override
  bool? get stringify => true;
}
class AppsDelete extends CompanyEvent {
  final String companyname;
  AppsDelete(this.companyname);

  @override
  List<Object> get props => [companyname];

  @override
  toString() => 'user Deleted {course Id: $companyname}';

  @override
  bool? get stringify => true;
}
class postDelete extends CompanyEvent {
  final String companyname;
  postDelete(this.companyname);

  @override
  List<Object> get props => [companyname];

  @override
  toString() => 'post Deleted {company Id: $companyname}';

  @override
  bool? get stringify => true;
}