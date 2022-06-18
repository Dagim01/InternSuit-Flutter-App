// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mynotes/presentation/views/app/application_form.dart';
import 'package:mynotes/presentation/views/auth/companylogin.dart';
import 'package:mynotes/presentation/views/auth/login.dart';
import 'package:mynotes/presentation/views/company/Company_message.dart';
import 'package:mynotes/presentation/views/company/companies_post.dart';
import 'package:mynotes/presentation/views/company/company_navigation.dart';
import 'package:mynotes/presentation/views/company/company_post.dart';
import 'package:mynotes/presentation/views/company/company_profile.dart';
import 'package:mynotes/presentation/views/company/company_registration.dart';
import 'package:mynotes/presentation/views/message/Usermessage.dart';
import 'package:mynotes/presentation/views/message/reject_or_accept_application.dart';
import 'package:mynotes/presentation/views/post/postform.dart';
import 'package:mynotes/presentation/views/user/user_navigation.dart';
import 'package:mynotes/presentation/views/user/user_profile.dart';
import 'package:mynotes/presentation/views/user/user_registration.dart';

import 'Application/app/blocs/app_bloc.dart';
import 'Application/auth/login_bloc.dart';
import 'Application/company/blocs/company_bloc.dart';
import 'Application/message/blocs/app_bloc.dart';
import 'Application/post/blocs/post_bloc.dart';
import 'Application/user/blocs/user_bloc.dart';
import 'infrastructure/application/application_repository/app_repository.dart';
import 'infrastructure/application/dataprovider/app_provider.dart';
import 'infrastructure/auth/auth_repository.dart';
import 'infrastructure/auth/dataprovider.dart';
import 'infrastructure/company/data_provider/company_data_provider.dart';
import 'infrastructure/company/repository/company_repository.dart';
import 'infrastructure/message/application_repository/app_repository.dart';
import 'infrastructure/message/dataprovider/app_provider.dart';
import 'infrastructure/post/data_provider/post_data_provider.dart';
import 'infrastructure/post/post_repository/post_repository.dart';
import 'infrastructure/user/data_provider/user_data_provider.dart';
import 'infrastructure/user/repository/user_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
          create: (context) => AuthenticationRepository(Loginprovider()),
          child: const CompaniesPost(),
        ));
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/CompanyLogin',
      builder: (context, state) => const CompanyLoginView(),
    ),
    GoRoute(
      path: '/SignupView',
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: '/CompanySignupView',
      builder: (context, state) => const CompanySignupView(),
    ),
    GoRoute(
      path: '/ApplicationForm',
      builder: (context, state) => const ApplicationForm(),
    ),
    GoRoute(
      path: '/companies_post',
      builder: (context, state) => const CompaniesPost(),
    ),
    GoRoute(
      path: '/Companymessage',
      builder: (context, state) => const Companymessage(),
    ),
    GoRoute(
      path: '/CompanyNavigation',
      builder: (context, state) => const CompanyNavigation(),
    ),
    GoRoute(
      path: '/SingleCompaniesPost',
      builder: (context, state) => const SingleCompaniesPost(),
    ),
    GoRoute(
      path: '/CompanyProfile',
      builder: (context, state) => const CompanyProfile(),
    ),
    GoRoute(
      path: '/PostForm',
      builder: (context, state) => const PostForm(),
    ),
    GoRoute(
      path: '/ApplicationEvaluation',
      builder: (context, state) => const ApplicationEvaluation(),
    ),
    GoRoute(
      path: '/UserNavigation',
      builder: (context, state) => const UserNavigation(),
    ),
    GoRoute(
      path: '/UserProfile',
      builder: (context, state) => const UserProfile(),
    ),
    GoRoute(
      path: '/UserMessage',
      builder: (context, state) => const UserMessage(),
    ),
  ],
);

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PostBloc>(
          create: (context) =>
              PostBloc(postRepository: PostRepository(PostDataProvider()))),
      BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(authrepo: AuthenticationRepository(Loginprovider())),
      ),
      BlocProvider<AppBloc>(
        create: (context) =>
            AppBloc(appRepository: AppRepository(AppDataProvider())),
      ),
      BlocProvider<CompanyBloc>(
        create: (context) => CompanyBloc(
            companyRepository: CompanyRepository(CompanyDataProvider())),
      ),
      BlocProvider<UserBloc>(
        create: (context) =>
            UserBloc(userRepository: UserRepository(UserDataProvider())),
      ),
      BlocProvider<MessageBloc>(
        create: (context) => MessageBloc(
            appRepository: MessageRepository(MessageDataProvider())),
      )
    ],
    child: MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    ),
  ));
}
