class PostModel {
  List<Post>? post;

  PostModel({this.post});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['Post'] != null) {
      post = <Post>[];
      json['Post'].forEach((v) {
        post!.add(Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (post != null) {
      data['Post'] = post!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  int? id;
  int? userId;
  String? content;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? likesCount;
  int? commentsCount;
  bool? liked;
  User? user;
  List<Likes>? likes;
  List<Comments>? comments;

  Post({
    this.id,
    this.userId,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.likesCount,
    this.commentsCount,
    this.liked,
    this.user,
    this.likes,
    this.comments,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    content = json['content'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    liked = json['liked'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['content'] = content;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['likes_count'] = likesCount;
    data['comments_count'] = commentsCount;
    data['liked'] = liked;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get createdAtDuration {
    if (createdAt == null) return '';
    final dateTime = DateTime.parse(createdAt!);
    final duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  String get updatedAtDuration {
    if (updatedAt == null) return '';
    final dateTime = DateTime.parse(updatedAt!);
    final duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profilePicture;

  User({this.id, this.name, this.email, this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    return data;
  }
}

class Likes {
  int? id;
  int? userId;
  int? postId;

  Likes({this.id, this.userId, this.postId});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['post_id'] = postId;
    return data;
  }
}

class Comments {
  int? id;
  String? content;
  int? userId;
  int? postId;
  String? createdAt;
  String? updatedAt;

  Comments({
    this.id,
    this.content,
    this.userId,
    this.postId,
    this.createdAt,
    this.updatedAt,
  });

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    userId = json['user_id'];
    postId = json['post_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['user_id'] = userId;
    data['post_id'] = postId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  String get createdAtDuration {
    if (createdAt == null) return '';
    final dateTime = DateTime.parse(createdAt!);
    final duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  String get updatedAtDuration {
    if (updatedAt == null) return '';
    final dateTime = DateTime.parse(updatedAt!);
    final duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}