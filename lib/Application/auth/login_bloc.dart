import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/company.dart';
import '../../domain/users.dart';
import '../../infrastructure/auth/auth_repository.dart';
import '../../presentation/auth/login_event.dart';
import '../../presentation/auth/login_state.dart';



class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final AuthenticationRepository authrepo;
  LoginBloc({required this.authrepo}):super(LoginLoading()){
     on<AttemptLogin>((event, emit) async{
    try {
        final  User user = await authrepo.login(event.username,event.password);
        emit(UserLoginSuccess(user));
      } catch (error) {
        emit(LoginFilure(error));
      }

  
    });
    on<CompanyAttemptLogin>((event, emit) async{
    try {
        Company  company = await authrepo.companylogin(event.companyname,event.password);
        emit(CompanyLoginSuccess(company));
      } catch (error) {
        print(error);
        emit(CompanyLoginFilure(error));
      }

  
    });

    
  
   
}

  }