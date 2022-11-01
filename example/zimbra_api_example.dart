import 'package:zimbra_api/zimbra_api.dart';

void main() {
  final api = MailApi('mail.domain.com');
  api.authByAccountName('name', 'password');
}
