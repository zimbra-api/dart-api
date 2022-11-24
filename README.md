Zimbra SOAP client library in Dart language
===========================================
This library is a simple Object Oriented wrapper for the Zimbra SOAP API.

## Features
* Support [`zimbraAccount` SOAP API](https://files.zimbra.com/docs/soap_api/9.0.0/api-reference/zimbraAccount/service-summary.html)
* Support [`zimbraMail` SOAP API](https://files.zimbra.com/docs/soap_api/9.0.0/api-reference/zimbraMail/service-summary.html)
* Support `upload` service

## Getting started
In your `Dart` or `flutter` project add the dependency:
```yml
dependencies:
  ...
  zimbra_api:
```

## Usage
### Authentication
Authentication by account name. 

```dart
final api = MailApi('mail.domain.com');
final response = await api.authByAccountName('name@domain.com', 'password');
if (response != null) {
  final authToken = response.authToken;
}
```

Authentication by `auth token` which `auth token` can obtain from previous authentication.

```dart
final api = MailApi('mail.domain.com');
final response = await api.authByToken('auth token');
```

Authentication by preauth which `preauth key` can obtain from `zmprov generateDomainPreAuthKey` command

```dart
final api = MailApi('mail.domain.com');
final response = await api.authByPreauth('name@domain.com', 'preauth key');
if (response != null) {
  final authToken = response.authToken;
}
```

### Basic Usage
1. Create `api` instance from one of Account & Mail API.
2. Authentication with `api.auth()` method.
3. From `api` object, you can access to Account & Mail API.

Example: Search messages has attachment in Inbox
```dart
final api = MailApi('mail.domain.com');
final response = await api.authByAccountName('name@domain.com', 'password');
if (response != null) {
  final query = 'in:inbox has:attachment';
  final searchResponse = await api.search(query: query, searchTypes: 'message');
  final messages = searchResponse.messageHits;
}
```

## Licensing
[BSD 3-Clause](LICENSE)

    For the full copyright and license information, please view the LICENSE
    file that was distributed with this source code.
