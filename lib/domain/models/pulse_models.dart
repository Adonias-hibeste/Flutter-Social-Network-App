class PulseUser {
  final String id;
  final String username;
  final String avatarUrl;
  final bool isVerified;

  PulseUser({
    required this.id,
    required this.username,
    required this.avatarUrl,
    this.isVerified = false,
  });
}

class PulsePost {
  final String id;
  final PulseUser author;
  final String imageUrl;
  final String caption;
  final int likes;
  final int comments;
  final DateTime timestamp;

  PulsePost({
    required this.id,
    required this.author,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });
}
