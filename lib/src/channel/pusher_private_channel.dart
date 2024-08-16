import 'package:pusher_client_socket/pusher_client_socket.dart' as PUSHER;

import 'private_channel.dart';
import 'pusher_channel.dart';

///
/// This class represents a Pusher private channel.
///
class PusherPrivateChannel extends PusherChannel<PUSHER.PrivateChannel>
    implements PrivateChannel {
  PusherPrivateChannel(
    super.pusher,
    super.name,
    super.options,
  );

  /// Trigger client event on the channel.
  @override
  PusherPrivateChannel whisper(String eventName, dynamic data) =>
      this..subscription.trigger('client-$eventName', data);

  /// listen to on subscribe success event
  @override
  PusherChannel onSubscribedSuccess(Function callback) =>
      listen('pusher:subscription_succeeded', callback);
}
