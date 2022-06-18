import '../../../domain/applicationform.dart';
import '../dataprovider/app_provider.dart';

class MessageRepository {
  final MessageDataProvider dataProvider;
  MessageRepository(this.dataProvider);

  Future<String> create(String id, String cgpa, String description,
      String Subject, String company_name) async {
    try {
      return await dataProvider.create(
          id, cgpa, description, Subject, company_name);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Application>> fetchByUserid(String id) async {
    return await dataProvider.fetchByid(id);
  }

  Future<void> delete(String subject) async {
    await dataProvider.delete(subject);
  }

  Future<Application> appEvaluation(String subject, String seen) async {
    return await dataProvider.appEvaluation(subject, seen);
  }

  Future<List<Application>> fetchBycompanyName(String companyname) async {
    return await dataProvider.fetchByCompanyname(companyname);
  }
}
