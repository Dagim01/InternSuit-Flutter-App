import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/company.dart';
import '../../../infrastructure/company/repository/company_repository.dart';
import '../../../presentation/company/company_event.dart';
import '../../../presentation/company/company_state.dart';



class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository companyRepository;

  CompanyBloc({required this.companyRepository}) : super(CompanyLoading()) {
    on<FetchBycompanyname>((event, emit) async {
      try {
        final Company company = await companyRepository.fetchBycompanyName(event.companyName);
        emit(CompanyOperationSuccess(company:company));
      } catch (error) {
        print(error);
        emit(CompanyOperationFailure(error));
      }
    });
    

    on<CompanyCreate>((event, emit) async {
      try {
        Company company = await companyRepository.create(event.company);
        emit(CompanyOperationSuccess(company:company));

      } catch (error) {
        emit(CompanyOperationFailure(error));
      }
    });

    on<CompanyUpdate>((event, emit) async {
 
      try {
        await companyRepository.update(event.companyName, event.company);
        emit(CompanyLoading());
        final Company company = await companyRepository.fetchBycompanyName(event.companyName);
        emit(CompanyOperationSuccess(company:company));
      } catch (error) {
        emit(CompanyOperationFailure(error));
      }
    });
      
    on<CompanyDelete>((event, emit) async {
      try {
        await companyRepository.delete(event.userName);
        emit(CompanyOperationSuccess());
      } catch (error) {
        emit(CompanyOperationFailure(error));
      }
    });
        on<AppsDelete>((event, emit) async {
      try {
        await companyRepository.deleteapps(event.companyname);
        emit(CompanyOperationSuccess());
      } catch (error) {
        emit(CompanyOperationFailure(error));
      }
    });
            on<postDelete>((event, emit) async {
      try {
        await companyRepository.deleteposts(event.companyname);
        emit(CompanyOperationSuccess());
      } catch (error) {
        emit(CompanyOperationFailure(error));
      }
    });
  }
}
