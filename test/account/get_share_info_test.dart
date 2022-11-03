
import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_share_info_envelope.dart';
import 'package:zimbra_api/src/account/message/get_share_info_response.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';
import 'package:zimbra_api/src/common/type/grantee_chooser.dart';
import 'package:zimbra_api/src/account/message/get_share_info_request.dart';

void main() {
  final faker = Faker();

  group('Get share info tests', (() {
    test('Get share info request', (() {
      final type = faker.lorem.word();
      final id = faker.guid.guid();
      final name = faker.internet.email();
      final internal = faker.randomGenerator.boolean();
      final includeSelf = faker.randomGenerator.boolean();

      final request = GetShareInfoRequest(
          grantee: GranteeChooser(type: type, id: id, name: name),
          owner: AccountSelector(AccountBy.name, name),
          internal: internal,
          includeSelf: includeSelf);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetShareInfoRequest': {
            '_jsns': 'urn:zimbraAccount',
            'grantee': {
              'type': type,
              'id': id,
              'name': name,
            },
            'owner': {
              'by': AccountBy.name.name,
              '_content': name,
            },
            'internal': internal,
            'includeSelf': includeSelf,
          }
        },
      });
    }));

    test('Get share info response', (() {
      final ownerId = faker.guid.guid();
      final ownerEmail = faker.internet.email();
      final ownerDisplayName = faker.person.name();
      final folderId = faker.randomGenerator.integer(100);
      final folderUuid = faker.guid.guid();
      final folderPath = faker.lorem.word();
      final defaultView = faker.lorem.word();
      final rights = faker.lorem.words(3).join(',');
      final granteeType = faker.lorem.word();
      final granteeId = faker.guid.guid();
      final granteeName = faker.internet.email();
      final granteeDisplayName = faker.person.name();
      final mountpointId = faker.guid.guid();

      final data = {
        'Body': {
          'GetShareInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'share': [
              {
                'ownerId': ownerId,
                'ownerEmail': ownerEmail,
                'ownerName': ownerDisplayName,
                'folderId': folderId,
                'folderUuid': folderUuid,
                'folderPath': folderPath,
                'view': defaultView,
                'rights': rights,
                'granteeType': granteeType,
                'granteeId': granteeId,
                'granteeName': granteeName,
                'granteeDisplayName': granteeDisplayName,
                'mid': mountpointId,
              }
            ],
          }
        },
      };
      final envelope = GetShareInfoEnvelope.fromMap(data);
      final response = envelope.body.response as GetShareInfoResponse;
      final share = response.shares.first;

      expect(share.ownerId, ownerId);
      expect(share.ownerEmail, ownerEmail);
      expect(share.ownerDisplayName, ownerDisplayName);
      expect(share.folderId, folderId);
      expect(share.folderUuid, folderUuid);
      expect(share.folderPath, folderPath);
      expect(share.defaultView, defaultView);
      expect(share.rights, rights);
      expect(share.granteeType, granteeType);
      expect(share.granteeId, granteeId);
      expect(share.granteeName, granteeName);
      expect(share.granteeDisplayName, granteeDisplayName);
      expect(share.mountpointId, mountpointId);
    }));
  }));
}
