
class DiscordMessages {

  String id = '';
  int type = 0;
  String content = '';
  String channelId = '';
  AuthorModel author = AuthorModel();
  List attachments = [];
  List embeds = [];
  List mentions = [];
  List mentionRoles = [];
  bool pinned = false;
  bool mentionEveryone = false;
  bool tts = false;
  String timestamp = '';
  dynamic editedTimestamp;
  int flags = 0;
  List components = [];

  DiscordMessages.fromJson(Map json) {
    id = safe(id, json['id']);
    type = safe(type, json['type']);
    content = safe(content, json['content']);
    channelId = safe(channelId, json['channel_id']);
    author = AuthorModel.fromJson(safe(<String, dynamic>{}, json['author']));
    List attachmentsItems = json['attachments'] ?? [];
    for (var item in attachmentsItems) {
      ///my code... 
        attachments.add(item);
    }
    List embedsItems = json['embeds'] ?? [];
    for (var item in embedsItems) {
      ///my code... 
        embeds.add(item);
    }
    List mentionsItems = json['mentions'] ?? [];
    for (var item in mentionsItems) {
      ///my code... 
        mentions.add(item);
    }
    List mentionRolesItems = json['mention_roles'] ?? [];
    for (var item in mentionRolesItems) {
      ///my code... 
        mentionRoles.add(item);
    }
    pinned = safe(pinned, json['pinned']);
    mentionEveryone = safe(mentionEveryone, json['mention_everyone']);
    tts = safe(tts, json['tts']);
    timestamp = safe(timestamp, json['timestamp']);
    editedTimestamp = safe(editedTimestamp, json['edited_timestamp']);
    flags = safe(flags, json['flags']);
    List componentsItems = json['components'] ?? [];
    for (var item in componentsItems) {
      ///my code... 
        components.add(item);
    }

  }

  T safe<T>(dynamic oldValue, dynamic newValue) {
    if (oldValue.runtimeType == newValue.runtimeType || (oldValue is Map && newValue is Map) || oldValue == null) { 
      return newValue;
    } else if ((oldValue is double) && (newValue is int)) { 
      return (newValue.toDouble() as T); 
    } 
    return oldValue; 
  }

}

class AuthorModel {

  String id = '';

  String username = '';

  String avatar = '';

  String discriminator = '';

  int publicFlags = 0;

  int premiumType = 0;

  int flags = 0;

  /// note: json value is null 
  dynamic banner;

  /// note: json value is null 
  dynamic accentColor;

  String globalName = '';

  /// note: json value is null 
  dynamic avatarDecorationData;

  /// note: json value is null 
  dynamic bannerColor;

  AuthorModel();

  AuthorModel.fromJson(Map json) {
    id = safe(id, json['id']);
    username = safe(username, json['username']);
    avatar = safe(avatar, json['avatar']);
    discriminator = safe(discriminator, json['discriminator']);
    publicFlags = safe(publicFlags, json['public_flags']);
    premiumType = safe(premiumType, json['premium_type']);
    flags = safe(flags, json['flags']);
    banner = safe(banner, json['banner']);
    accentColor = safe(accentColor, json['accent_color']);
    globalName = safe(globalName, json['global_name']);
    avatarDecorationData = safe(avatarDecorationData, json['avatar_decoration_data']);
    bannerColor = safe(bannerColor, json['banner_color']);

  }

  T safe<T>(dynamic oldValue, dynamic newValue) {
    if (oldValue.runtimeType == newValue.runtimeType || (oldValue is Map && newValue is Map) || oldValue == null) { 
      return newValue;
    } else if ((oldValue is double) && (newValue is int)) { 
      return (newValue.toDouble() as T); 
    } 
    return oldValue; 
  }

}
