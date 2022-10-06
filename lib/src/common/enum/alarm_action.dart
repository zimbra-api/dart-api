// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum AlarmAction {
  display,
  audio,
  email,
  procedure,
  yahooIm,
  yahooMobile;

  String get name {
    switch (this) {
      case AlarmAction.display:
        return 'DISPLAY';
      case AlarmAction.audio:
        return 'AUDIO';
      case AlarmAction.email:
        return 'EMAIL';
      case AlarmAction.procedure:
        return 'PROCEDURE';
      case AlarmAction.yahooIm:
        return 'X_YAHOO_CALENDAR_ACTION_IM';
      case AlarmAction.yahooMobile:
        return 'X_YAHOO_CALENDAR_ACTION_MOBILE';
    }
  }
}
