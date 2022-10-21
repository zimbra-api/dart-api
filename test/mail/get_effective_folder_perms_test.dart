import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_effective_folder_perms_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_effective_folder_perms_request.dart';
import 'package:zimbra_api/src/mail/type/folder_spec.dart';

void main() {
  final faker = Faker();

  group('Get effective folder perms tests', (() {
    test('Get effective folder perms request', (() {
      final folder = faker.guid.guid();
      final request = GetEffectiveFolderPermsRequest(FolderSpec(folder: folder));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetEffectiveFolderPermsRequest': {
            '_jsns': 'urn:zimbraMail',
            'folder': {
              'l': folder,
            },
          }
        },
      });
    }));

    test('Get effective folder perms response', (() {
      final effectivePermissions = faker.lorem.word();
      final json = {
        'Body': {
          'GetEffectiveFolderPermsResponse': {
            '_jsns': 'urn:zimbraMail',
            'folder': {
              'perm': effectivePermissions,
            },
          }
        }
      };
      final envelope = GetEffectiveFolderPermsEnvelope.fromJson(json);
      final response = envelope.getEffectiveFolderPermsBody.getEffectiveFolderPermsResponse!;
      final folder = response.folder!;

      expect(folder.effectivePermissions, effectivePermissions);
    }));
  }));
}