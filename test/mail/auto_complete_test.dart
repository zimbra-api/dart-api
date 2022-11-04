import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/auto_complete_match_type.dart';
import 'package:zimbra_api/src/common/enum/gal_search_type.dart';
import 'package:zimbra_api/src/mail/message.dart';

void main() {
  final faker = Faker();

  group('Auto complete tests', (() {
    test('Auto complete request', (() {
      final name = faker.lorem.word();
      final needCanExpand = faker.randomGenerator.boolean();
      final folderList = faker.lorem.words(3).join(',');
      final includeGal = faker.randomGenerator.boolean();
      final request = AutoCompleteRequest(
        name,
        type: GalSearchType.account,
        needCanExpand: needCanExpand,
        folderList: folderList,
        includeGal: includeGal,
      );

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'AutoCompleteRequest': {
            '_jsns': 'urn:zimbraMail',
            'name': name,
            't': GalSearchType.account.name,
            'needExp': needCanExpand,
            'folders': folderList,
            'includeGal': includeGal,
          }
        },
      });
    }));

    test('Auto complete request', (() {
      final email = faker.internet.email();
      final ranking = faker.randomGenerator.integer(100);
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final folder = faker.guid.guid();
      final displayName = faker.person.name();
      final firstName = faker.person.firstName();
      final middleName = faker.lorem.word();
      final lastName = faker.person.lastName();
      final fullName = faker.person.name();
      final nickName = faker.lorem.word();
      final company = faker.company.name();
      final fileAs = faker.lorem.word();
      final canBeCached = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'AutoCompleteResponse': {
            '_jsns': 'urn:zimbraMail',
            'canBeCached': canBeCached,
            'match': [
              {
                'email': email,
                'type': AutoCompleteMatchType.contact.name,
                'ranking': ranking.toString(),
                'isGroup': isGroup,
                'exp': canExpandGroupMembers,
                'id': id,
                'l': folder,
                'display': displayName,
                'first': firstName,
                'middle': middleName,
                'last': lastName,
                'full': fullName,
                'nick': nickName,
                'company': company,
                'fileas': fileAs,
              }
            ],
          }
        }
      };
      final envelope = AutoCompleteEnvelope.fromMap(data);
      final response = envelope.body.response as AutoCompleteResponse;

      expect(response.canBeCached, canBeCached);

      final match = response.matches.first;
      expect(match.email, email);
      expect(match.matchType, AutoCompleteMatchType.contact);
      expect(match.ranking, ranking.toString());
      expect(match.isGroup, isGroup);
      expect(match.canExpandGroupMembers, canExpandGroupMembers);
      expect(match.id, id);
      expect(match.folder, folder);
      expect(match.displayName, displayName);
      expect(match.firstName, firstName);
      expect(match.middleName, middleName);
      expect(match.lastName, lastName);
      expect(match.fullName, fullName);
      expect(match.nickName, nickName);
      expect(match.company, company);
      expect(match.fileAs, fileAs);
    }));
  }));
}
