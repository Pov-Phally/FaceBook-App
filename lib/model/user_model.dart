class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profilePicture;
  int? postsCount;
  int? likesCount;
  int? commentsCount;
  List<Posts>? posts;

  User({
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.postsCount,
    this.likesCount,
    this.commentsCount,
    this.posts,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    postsCount = json['posts_count'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    data['posts_count'] = postsCount;
    data['likes_count'] = likesCount;
    data['comments_count'] = commentsCount;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  int? userId;
  String? content;
  String? image;
  int? likesCount;
  int? commentsCount;
  bool? liked;
  List<Likes>? likes;
  List<Comments>? comments;

  Posts({
    this.id,
    this.userId,
    this.content,
    this.image,
    this.likesCount,
    this.commentsCount,
    this.liked,
    this.likes,
    this.comments,
  });

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    content = json['content'];
    image = json['image'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    liked = json['liked'];
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
    data['likes_count'] = likesCount;
    data['comments_count'] = commentsCount;
    data['liked'] = liked;
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
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

  Comments({this.id, this.content, this.userId, this.postId});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    userId = json['user_id'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['user_id'] = userId;
    data['post_id'] = postId;
    return data;
  }
}