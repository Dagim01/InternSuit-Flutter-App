import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/applicationform.dart';
import '../../../infrastructure/message/application_repository/app_repository.dart';
import '../../../presentation/message/app_event.dart';
import '../../../presentation/message/app_state.dart';




class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository appRepository;

  MessageBloc({required this.appRepository}) : super(AppLoading()) {
    on<FetchBycompanyName>((event, emit) async {
      
      try {
        final apps = await appRepository.fetchBycompanyName(event.companyName);
        emit(GetByComoanynameFetchSuccess(apps));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
    

    on<AppCreate>((event, emit) async {
      try {
        await appRepository.create(event.id,event.cgpa,event.description,event.Subject,event.company_name);
        //  final apps =await appRepository.fetchByUserid(event.id);
        // emit(AppFetchByUserIdSuccess(apps));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });


    on<AppDelete>((event, emit) async {
      try {
        await appRepository.delete(event.subject);
        emit(AppOperationSuccess());
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
     on<MessageGetfromScreen>((event, emit) async {
      try {
        emit(MessagegetfromScreenSucccess(event.app));
        

      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
     on<AppEvaluation>((event, emit) async {
      try {
        final Application app =await appRepository.appEvaluation(event.subject,event.seen);
        // emit(MessageEvaluationSucccess(app));
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
      on<FetchByUserid>((event, emit) async {
      try {
        
        final apps =await appRepository.fetchByUserid(event.id);
        
        emit(AppFetchByUserIdSuccess(apps));
       
      } catch (error) {
        emit(AppOperationFailure(error));
      }
    });
  }
}
