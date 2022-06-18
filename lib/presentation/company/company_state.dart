import 'package:equatable/equatable.dart';

import '../../domain/company.dart';


abstract class CompanyState extends Equatable {
  CompanyState();
late Company? company;
  @override
   List<Object> get props => [];
}

class CompanyLoading extends CompanyState {}

class CompanyOperationSuccess extends CompanyState {
  CompanyOperationSuccess({company}){super.company = company;}
  @override
  List<Object> get props => [];
}

class CompanyOperationFailure extends CompanyState {
  final Object error;
  CompanyOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
